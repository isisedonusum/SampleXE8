unit UblTr;

interface

uses
  Contracts, Xml.XMLIntf, Xml.XMLDoc, System.SysUtils, System.TypInfo,
  System.Classes, EncdDecd;

const
  PR_cbc = 'cbc';
  NS_cbc = 'urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2';
  PR_cac = 'cac';
  NS_cac = 'urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2';

procedure CreateUblTr(fatura: TFatura);
procedure ChangeNode(parent: IXMLNode; name, namespace, value: String);
procedure KalemEkle(node: IXMLNode; kalem: TKalem; BelgePB: String);
function CreateChildNode(node: IXMLNode; namespace, name: String): IXMLNode;
procedure AddChildNode(node: IXMLNode; namespace, name, value: String);
procedure MuhatapBilgileri(node: IXMLNode; muhatap: TMuhatap);
procedure VergiEkle(node: IXMLNode; vergiler: TVergiler;
  BelgePB: String); overload;
procedure VergiEkle(node: IXMLNode; vergi: TVergi; BelgePB: String); overload;
procedure DipToplam(node: IXMLNode; fatura: TFatura);
procedure TutarDegistir(parent: IXMLNode; name, namespace, pb: String;
  value: Currency);
procedure FaturaGorseli(node: IXMLNode; fatura: TFatura);
function EncodeFile(const FileName: string): AnsiString;

implementation

procedure CreateUblTr(fatura: TFatura);
var
  doc: IXMLDocument;
  parent: IXMLNode;

  faturatipi: IXMLNode;

  node: IXMLNode;
  new: IXMLNode;

  i: Integer;
begin
  doc := LoadXMLDocument('base.xml');
  doc.Options := doc.Options + [doNodeAutoIndent];
  parent := doc.DocumentElement;

  // fatura no
  ChangeNode(parent, 'ID', NS_cbc, fatura.No);

  // ETTN
  ChangeNode(parent, 'UUID', NS_cbc, fatura.ETTN);

  // fatura tarihi
  ChangeNode(parent, 'IssueDate', NS_cbc, FormatDateTime('yyyy-mm-dd',
    fatura.Tarih));

  // fatura senaryosu
  node := parent.ChildNodes.FindNode('ProfileID', NS_cbc);
  node.Text := GetEnumName(TypeInfo(TFaturaSenaryo), Ord(fatura.Senaryo));

  // fatura tipi
  faturatipi := parent.ChildNodes.FindNode('InvoiceTypeCode', NS_cbc);
  faturatipi.Text := GetEnumName(TypeInfo(TFaturaTipi), Ord(fatura.Tipi));

  // fatura görseli
  FaturaGorseli(parent, fatura);

  // satýcý
  if fatura.Gonderici <> nil then
    MuhatapBilgileri(parent.ChildNodes.FindNode('AccountingSupplierParty',
      NS_cac), fatura.Gonderici);

  // müþteri
  MuhatapBilgileri(parent.ChildNodes.FindNode('AccountingCustomerParty',
    NS_cac), fatura.Alici);

  // Fatura notu ekle
  new := doc.CreateElement(PR_cbc + ':Note', NS_cbc);
  new.Text := 'Fatura notu';
  new.Attributes['languageID'] := 'tr-TR';
  parent.ChildNodes.Insert(parent.ChildNodes.IndexOf(faturatipi) + 1, new);

  // Vergiler
  node := parent.ChildNodes.FindNode('TaxTotal', NS_cac);
  VergiEkle(node, fatura.vergiler, fatura.BelgePB);

  // Dip toplamlar
  DipToplam(parent, fatura);

  // Kalem ekle
  for i := 0 to fatura.Kalemler.Count - 1 do
    KalemEkle(parent, fatura.Kalemler[i], fatura.BelgePB);
  // Dosyaya kaydet
  doc.SaveToFile('sample.xml');
end;

procedure ChangeNode(parent: IXMLNode; name, namespace, value: String);
var
  node: IXMLNode;
begin
  node := parent.ChildNodes.FindNode(name, namespace);
  if node = nil then
    exit;
  if value = '' then
  begin
    parent.ChildNodes.Remove(node);
    exit;
  end;
  node.Text := value;
end;

procedure AddChildNode(node: IXMLNode; namespace, name, value: String);
var
  new: IXMLNode;
begin
  new := node.OwnerDocument.CreateElement(name, namespace);
  if value <> '' then
    new.Text := value;
  node.ChildNodes.Add(new);

end;

function CreateChildNode(node: IXMLNode; namespace, name: String): IXMLNode;
begin
  Result := node.OwnerDocument.CreateElement(name, namespace);
  node.ChildNodes.Add(Result);
end;

procedure MuhatapBilgileri(node: IXMLNode; muhatap: TMuhatap);
var
  new: IXMLNode;
  child: IXMLNode;
  i: Integer;
begin
  // party elemanýna git
  node := node.ChildNodes.First;
  // tüm alt elemanlarý temizle
  node.ChildNodes.Clear;

  // web adresi
  AddChildNode(node, NS_cbc, PR_cbc + ':WebsiteURI', muhatap.WebURI);
  // VKN/TCKN
  new := CreateChildNode(node, NS_cac, PR_cac + ':PartyIdentification');
  child := node.OwnerDocument.CreateElement(PR_cbc + ':ID', NS_cbc);
  child.Text := muhatap.VKNTCKN;
  if Length(muhatap.VKNTCKN) = 11 then
    child.Attributes['schemeID'] := 'TCKN'
  else if Length(muhatap.VKNTCKN) = 10 then
    child.Attributes['schemeID'] := 'VKN'
  else
    raise Exception.Create('VKNTCKN formatý uygun deðil!');
  new.ChildNodes.Add(child);

  // Tüzel þirket ünvan
  if Length(muhatap.VKNTCKN) = 10 then
  begin
    new := CreateChildNode(node, NS_cac, PR_cac + ':PartyName');
    AddChildNode(new, NS_cbc, PR_cbc + ':Name', muhatap.Unvan);
    child := node.OwnerDocument.CreateElement(PR_cbc + ':Name', NS_cbc);
  end;
  // Adres
  new := CreateChildNode(node, NS_cac, PR_cac + ':PostalAddress');
  AddChildNode(new, NS_cbc, PR_cbc + ':Room', '');
  AddChildNode(new, NS_cbc, PR_cbc + ':StreetName', '');
  AddChildNode(new, NS_cbc, PR_cbc + ':BuildingName', '');
  AddChildNode(new, NS_cbc, PR_cbc + ':BuildingNumber', '');
  AddChildNode(new, NS_cbc, PR_cbc + ':CitySubdivisionName', muhatap.Ilce);
  AddChildNode(new, NS_cbc, PR_cbc + ':CityName', muhatap.Il);
  AddChildNode(new, NS_cbc, PR_cbc + ':PostalZone', '');
  AddChildNode(new, NS_cbc, PR_cbc + ':Region', '');
  child := node.OwnerDocument.CreateElement(PR_cac + ':Country', NS_cac);
  new.ChildNodes.Add(child);
  AddChildNode(child, NS_cbc, PR_cbc + ':IdentificationCode', muhatap.UlkeKodu);
  AddChildNode(child, NS_cbc, PR_cbc + ':Name', muhatap.Ulke);
  // vergi dairesi
  child := CreateChildNode(node, NS_cac, PR_cac + ':PartyTaxScheme');
  child := CreateChildNode(child, NS_cac, PR_cac + ':TaxScheme');
  AddChildNode(child, NS_cbc, PR_cbc + ':Name', muhatap.VergiDairesi);
  // Contact
  child := CreateChildNode(node, NS_cac, PR_cac + ':Contact');
  AddChildNode(child, NS_cbc, PR_cbc + ':Telephone', '');
  AddChildNode(child, NS_cbc, PR_cbc + ':Telefax', '');
  AddChildNode(child, NS_cbc, PR_cbc + ':ElectronicMail', '');
  // Þahýs þirket sahibi
  if Length(muhatap.VKNTCKN) = 11 then
  begin
    child := CreateChildNode(node, NS_cac, PR_cac + ':Person');
    // Unvan ad-soyad tespiti
    i := LastDelimiter(' ', muhatap.Unvan);
    if i < 2 then
      raise Exception.Create('Unvanýn formatý uygun deðil!');
    AddChildNode(child, NS_cbc, PR_cbc + ':FirstName',
      Copy(muhatap.Unvan, 0, i - 1));
    AddChildNode(child, NS_cbc, PR_cbc + ':FamilyName',
      Copy(muhatap.Unvan, i + 1, Length(muhatap.Unvan) - 2));
  end;
  // <cac:PartyName>
  // <cbc:Name>ISIS Biliþim</cbc:Name>
  // </cac:PartyName>
  // <cac:PostalAddress>
  // <cbc:Room/>
  // <cbc:StreetName/>
  // <cbc:BuildingName/>
  // <cbc:BuildingNumber/>
  // <cbc:CitySubdivisionName>Alsancak</cbc:CitySubdivisionName>
  // <cbc:CityName>ÝZMÝR</cbc:CityName>
  // <cbc:PostalZone/>
  // <cbc:Region/>
  // <cac:Country>
  // <cbc:Name>Türkiye</cbc:Name>
  // </cac:Country>
  // </cac:PostalAddress>
  // <cac:PartyTaxScheme>
  // <cac:TaxScheme>
  // <cbc:Name/>
  // </cac:TaxScheme>
  // </cac:PartyTaxScheme>
  // <cac:Contact>
  // <cbc:Telephone/>
  // <cbc:Telefax/>
  // <cbc:ElectronicMail/>
  // </cac:Contact>
  // <cac:Person>
  // <cbc:FirstName/>
  // <cbc:FamilyName/>
  // </cac:Person>
end;

procedure KalemEkle(node: IXMLNode; kalem: TKalem; BelgePB: String);
var
  new: IXMLNode;
  child: IXMLNode;
  i: Integer;
begin
  new := node.OwnerDocument.CreateElement(PR_cac + ':InvoiceLine', NS_cac);

  // Kalem numarasý
  AddChildNode(new, NS_cbc, PR_cbc + ':ID', IntToStr(kalem.KalemNo));
  node.ChildNodes.Add(new);

  // notlar
  if kalem.Notlar <> nil then
    for i := 0 to kalem.Notlar.Count do
      AddChildNode(new, NS_cbc, PR_cbc + ':Note', kalem.Notlar[i]);

  // miktar
  child := CreateChildNode(new, NS_cbc, PR_cbc + ':InvoicedQuantity');
  child.Attributes['unitCode'] :=
    StringReplace(GetEnumName(TypeInfo(TOlcuBirimleri), Ord(kalem.OlcuBirimi)),
    '_', '', []);
  child.Text := FloatToStr(kalem.Miktar);

  // Kalem tutarý
  child := CreateChildNode(new, NS_cbc, PR_cbc + ':LineExtensionAmount');
  child.Attributes['currencyID'] := BelgePB;
  child.Text := FloatToStr(kalem.KalemTutar);

  // indirim
  if kalem.IndirimTutar.HasValue then
  begin
    child := CreateChildNode(new, NS_cac, PR_cac + ':AllowanceCharge');
    AddChildNode(child, NS_cbc, PR_cbc + ':ChargeIndicator', 'false');
    child := CreateChildNode(child, NS_cbc, PR_cbc + ':Amount');
    child.Text := FloatToStr(kalem.IndirimTutar);
    child.Attributes['currencyID'] := BelgePB;
  end;

  // vergiler
  child := CreateChildNode(new, NS_cac, PR_cac + ':TaxTotal');
  VergiEkle(child, kalem.vergiler, BelgePB);

  // Detay
  child := CreateChildNode(new, NS_cac, PR_cac + ':Item');
  AddChildNode(child, NS_cbc, PR_cbc + ':Name', kalem.UrunAdi);
  if kalem.UrunKodu <> '' then
  begin
    child := CreateChildNode(child, NS_cac,
      PR_cac + ':SellersItemIdentification');
    AddChildNode(child, NS_cbc, PR_cbc + ':ID', kalem.UrunKodu);
  end;

  // birim fiyat
  child := CreateChildNode(new, NS_cac, PR_cac + ':Price');
  child := CreateChildNode(child, NS_cbc, PR_cbc + ':PriceAmount');
  child.Text := FloatToStr(kalem.BirimFiyat);
  child.Attributes['currencyID'] := BelgePB;
  // <cac:InvoiceLine>
  // <cbc:ID>1</cbc:ID>
  // <cbc:Note/>
  // <cbc:InvoicedQuantity unitCode="C62">1</cbc:InvoicedQuantity>
  // <cbc:LineExtensionAmount currencyID="TRL">500</cbc:LineExtensionAmount>
  // <cac:AllowanceCharge>
  // <cbc:ChargeIndicator>false</cbc:ChargeIndicator>
  // <cbc:Amount currencyID="TRL">0</cbc:Amount>
  // </cac:AllowanceCharge>
  // <cac:TaxTotal>
  // <cbc:TaxAmount currencyID="TRL">90</cbc:TaxAmount>
  // <cac:TaxSubtotal>
  // <cbc:TaxAmount currencyID="TRL">90</cbc:TaxAmount>
  // <cbc:Percent>18</cbc:Percent>
  // <cac:TaxCategory>
  // <cbc:TaxExemptionReason/>
  // <cac:TaxScheme>
  // <cbc:TaxTypeCode>0015</cbc:TaxTypeCode>
  // </cac:TaxScheme>
  // </cac:TaxCategory>
  // </cac:TaxSubtotal>
  // </cac:TaxTotal>
  // <cac:Item>
  // <cbc:Name>Test</cbc:Name>
  // <cac:SellersItemIdentification>
  // <cbc:ID>Satýcý Kodu</cbc:ID>
  // </cac:SellersItemIdentification>
  // </cac:Item>
  // <cac:Price>
  // <cbc:PriceAmount currencyID="TRL">500</cbc:PriceAmount>
  // </cac:Price>
  // </cac:InvoiceLine>
end;

procedure VergiEkle(node: IXMLNode; vergiler: TVergiler; BelgePB: String);
var
  child: IXMLNode;
  i: Integer;
begin
  node.ChildNodes.Clear;
  child := CreateChildNode(node, NS_cbc, PR_cbc + ':TaxAmount');
  child.Text := FloatToStr(vergiler.ToplamVergi);
  child.Attributes['currencyID'] := BelgePB;
  for i := 0 to vergiler.Count - 1 do
    VergiEkle(node, vergiler[i], BelgePB);
  // <cbc:TaxAmount currencyID="TRL">90</cbc:TaxAmount>
end;

procedure VergiEkle(node: IXMLNode; vergi: TVergi; BelgePB: String);
var
  new: IXMLNode;
  child: IXMLNode;
begin
  if vergi = nil then
    exit;
  child := CreateChildNode(node, NS_cac, PR_cac + ':TaxSubtotal');
  // matrah
  if vergi.Matrah.HasValue then
  begin
    new := CreateChildNode(child, NS_cbc, PR_cbc + ':TaxableAmount');
    new.Text := FloatToStr(vergi.Matrah);
    new.Attributes['currencyID'] := BelgePB;
  end;
  // vergi tutar
  new := CreateChildNode(child, NS_cbc, PR_cbc + ':TaxAmount');
  new.Text := FloatToStr(vergi.Tutar);
  new.Attributes['currencyID'] := BelgePB;
  // oran
  if vergi.Oran.HasValue then
    AddChildNode(child, NS_cbc, PR_cbc + ':Percent', FloatToStr(vergi.Oran));
  // vergi bilgileri
  new := CreateChildNode(child, NS_cac, PR_cac + ':TaxCategory');
  // muhafiyet bilgisi
  if vergi.MuafiyetKodu <> '' then
  begin
    AddChildNode(new, NS_cbc, PR_cbc + ':TaxExemptionReasonCode',
      vergi.MuafiyetKodu);
    AddChildNode(new, NS_cbc, PR_cbc + ':TaxExemptionReason',
      vergi.MuafiyetAciklama);
  end;
  new := CreateChildNode(new, NS_cac, PR_cac + ':TaxScheme');
  AddChildNode(new, NS_cbc, PR_cbc + ':Name', vergi.Adi);
  AddChildNode(new, NS_cbc, PR_cbc + ':TaxTypeCode', vergi.Kodu);
  // <cac:TaxSubtotal>
  // <cbc:TaxableAmount currencyID="TRL">100</cbc:TaxableAmount>
  // <cbc:TaxAmount currencyID="TRL">90</cbc:TaxAmount>
  // <cbc:Percent>18</cbc:Percent>
  // <cac:TaxCategory>
  // / <cbc:TaxExemptionReasonCode/>
  // / <cbc:TaxExemptionReason/>
  // / <cac:TaxScheme>
  // / / <cbc:Name>KDV</cbc:Name>
  // / / <cbc:TaxTypeCode>0015</cbc:TaxTypeCode>
  // / </cac:TaxScheme>
  // </cac:TaxCategory>
  // </cac:TaxSubtotal>
end;

procedure DipToplam(node: IXMLNode; fatura: TFatura);
var
  child: IXMLNode;
begin
  child := node.ChildNodes.FindNode('LegalMonetaryTotal', NS_cac);
  TutarDegistir(child, 'LineExtensionAmount', NS_cbc, fatura.BelgePB,
    fatura.KalemToplamTutar);
  TutarDegistir(child, 'TaxExclusiveAmount', NS_cbc, fatura.BelgePB,
    fatura.VergiHaricTutar);
  TutarDegistir(child, 'TaxInclusiveAmount', NS_cbc, fatura.BelgePB,
    fatura.VergiDahilTutar);
  TutarDegistir(child, 'AllowanceTotalAmount', NS_cbc, fatura.BelgePB,
    fatura.ToplamIndirim);
  TutarDegistir(child, 'PayableAmount', NS_cbc, fatura.BelgePB,
    fatura.OdenecekTutar);
end;

procedure TutarDegistir(parent: IXMLNode; name, namespace, pb: String;
  value: Currency);
var
  node: IXMLNode;
begin
  node := parent.ChildNodes.FindNode(name, namespace);
  if node = nil then
    exit;
  node.Text := FloatToStr(value);
  node.Attributes['currencyID'] := pb;
end;

procedure FaturaGorseli(node: IXMLNode; fatura: TFatura);
var
  new, child: IXMLNode;
begin
  if fatura.Gorsel = '' then
    exit;
  new := CreateChildNode(node, NS_cac, PR_cac + ':AdditionalDocumentReference');

  // gönderi bilgilerinden öncesine ekleyelim
  node.ChildNodes.Insert(node.ChildNodes.IndexOf(node.ChildNodes.FindNode
    ('AccountingSupplierParty', NS_cac)), new);

  // görsel dosyasýný yükleyelim
  AddChildNode(new, NS_cbc, PR_cbc + ':ID', '1');
  AddChildNode(new, NS_cbc, PR_cbc + ':IssueDate', FormatDateTime('yyyy-mm-dd',
    fatura.Tarih));
  AddChildNode(new, NS_cbc, PR_cbc + ':DocumentTypeCode', 'XSLT');
  AddChildNode(new, NS_cbc, PR_cbc + ':DocumentType', 'XSLT');
  child := CreateChildNode(new, NS_cac, PR_cac + ':Attachment');
  child := CreateChildNode(child, NS_cbc,
    PR_cbc + ':EmbeddedDocumentBinaryObject');
  child.Attributes['characterSetCode'] := 'UTF-8';
  child.Attributes['encodingCode'] := 'Base64';
  child.Attributes['filename'] := fatura.No + '.xslt';
  child.Attributes['mimeCode'] := 'application/xml';
  child.Text := EncodeFile(fatura.Gorsel);

  // <cac:AdditionalDocumentReference>
  // /		<cbc:ID>1</cbc:ID>
  // /		<cbc:IssueDate>2016-12-30</cbc:IssueDate>
  // /    <cbc:DocumentTypeCode>XSLT</cbc:DocumentTypeCode>
  // /    <cbc:DocumentType>XSLT</cbc:DocumentType>
  // /		<cac:Attachment>
  // / /			<cbc:EmbeddedDocumentBinaryObject characterSetCode="UTF-8" encodingCode="Base64" filename="H552017000000017.xslt" mimeCode="application/xml">
  // / /      Base64
  // / /      </cbc:EmbeddedDocumentBinaryObject>
  // /    </cac:Attachment>
  // </cac:AdditionalDocumentReference>
end;

function EncodeFile(const FileName: string): AnsiString;
var
  stream: TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(FileName);
    Result := EncodeBase64(stream.Memory, stream.Size);
  finally
    stream.Free;
  end;
end;

end.
