unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  XMLDoc, XMLIntf;

type
  TForm2 = class(TForm)
    Button1: TButton;
    cbProfileID: TComboBox;
    Label1: TLabel;
    cbInvoiceType: TComboBox;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeNode(parent: IXMLNode; name: String; namespace: String; value: String);
    procedure MuhatapBilgileri(muhatap: IXMLNode; WebURI,VKNTCKN: string);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

const
  PR_cbc = 'cbc';
  NS_cbc = 'urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2';
  PR_cac = 'cac';
  NS_cac = 'urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2';

implementation

{$R *.dfm}

procedure TForm2.ChangeNode(parent: IXMLNode; name: String; namespace: String;
  value: String);
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

procedure TForm2.Button1Click(Sender: TObject);
var
  doc: IXMLDocument;
  parent: IXMLNode;

  faturatipi: IXMLNode;
  musteri: IXMLNode;

  node: IXMLNode;
  new: IXMLNode;

  Uid: TGuid;
  ETTN: String;
begin
  doc := LoadXMLDocument('base.xml');

  parent := doc.DocumentElement;

  // ETTN
  CreateGuid(Uid);
  ETTN := GuidToString(Uid);
  ETTN := StringReplace(ETTN, '{', '', [rfReplaceAll]);
  ETTN := StringReplace(ETTN, '}', '', [rfReplaceAll]);
  ChangeNode(parent, 'UUID', NS_cbc, ETTN);
  // fatura no
  ChangeNode(parent, 'ID', NS_cbc, 'ISS2016000000001');

  // fatura senaryosu
  node := parent.ChildNodes.FindNode('ProfileID', NS_cbc);
  node.Text := cbProfileID.Items[cbProfileID.ItemIndex];

  // fatura tipi
  faturatipi := parent.ChildNodes.FindNode('InvoiceTypeCode', NS_cbc);
  faturatipi.Text := cbInvoiceType.Items[cbInvoiceType.ItemIndex];

  // müþteri
  MuhatapBilgileri(parent.ChildNodes.FindNode('AccountingCustomerParty', NS_cac),
                   'http://www.isisbilisim.com.tr',
                   '4660392430');

  // Fatura notu ekle
  new := doc.CreateElement(PR_cbc + ':Note', NS_cbc);
  new.Text := 'Fatura notu';
  new.Attributes['languageID'] := 'tr-TR';
  parent.ChildNodes.Insert(parent.ChildNodes.IndexOf(faturatipi) + 1, new);

  // Dosyaya kaydet
  doc.SaveToFile('sample.xml');
end;

procedure TForm2.MuhatapBilgileri(muhatap: IXMLNode; WebURI,VKNTCKN: string);
var
  node: IXMLNode;
  new: IXMLNode;
begin
  // web adresi
  muhatap := muhatap.ChildNodes.First;
  new :=  muhatap.OwnerDocument.CreateElement(PR_cbc + ':WebsiteURI', NS_cbc);
  new.Text := WebURI;
  muhatap.ChildNodes.Insert(0, new);
end;

end.
