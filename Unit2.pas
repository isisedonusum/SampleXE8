unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  XMLDoc, XMLIntf,
  Unit1;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
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

procedure ChangeNode(parent: IXMLNode; name: String; namespace: String;
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

  // fatura tipi
  faturatipi := parent.ChildNodes.FindNode('InvoiceTypeCode', NS_cbc);
  faturatipi.Text := 'SATIS';

  // müþteri
  musteri := parent.ChildNodes.FindNode('AccountingSupplierParty', NS_cac);

  // Fatura notu ekle
  new := doc.CreateElement(PR_cbc + ':Note', NS_cbc);
  new.Text := 'Fatura notu';
  new.Attributes['languageID'] := 'tr-TR';
  parent.ChildNodes.Insert(parent.ChildNodes.IndexOf(faturatipi) + 1, new);

  // Dosyaya kaydet
  doc.SaveToFile('sample.xml');
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  frmGonder: TForm1;
begin
  frmGonder := TForm1.Create(Form2);
  frmGonder.Show();
end;

end.
