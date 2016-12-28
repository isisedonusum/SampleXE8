unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TypInfo;

type
  TForm2 = class(TForm)
    Button1: TButton;
    cbProfileID: TComboBox;
    Label1: TLabel;
    cbInvoiceType: TComboBox;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  Contracts, UblTr;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  fatura: TFatura;
  kalem: TKalem;
begin
  fatura := TFatura.Create;
  fatura.Senaryo := TFaturaSenaryo(GetEnumValue(TypeInfo(TFaturaSenaryo), cbProfileID.Items[cbProfileID.ItemIndex]));
  fatura.Tipi := TFaturaTipi(GetEnumValue(TypeInfo(TFaturaTipi), cbInvoiceType.Items[cbInvoiceType.ItemIndex]));
  fatura.BelgePB := 'TRY';

  //fatura kalemleri
  fatura.Kalemler := TKalemler.Create;
  kalem := TKalem.Create;
  kalem.KalemNo := 2;
  kalem.Miktar := 5;
  kalem.OlcuBirimi := TOlcuBirimleri.C62;
  fatura.Kalemler.Add(kalem);

  CreateUblTr(fatura);
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i: Integer;
begin
  cbProfileID.Items.Clear;
  for i :=  Ord(Low(TFaturaSenaryo)) to Ord(High(TFaturaSenaryo)) do
    cbProfileID.Items.Add(GetEnumName(TypeInfo(TFaturaSenaryo), i));
  cbProfileID.ItemIndex := 0;

  cbInvoiceType.Items.Clear;
  for i :=  Ord(Low(TFaturaTipi)) to Ord(High(TFaturaTipi)) do
    cbInvoiceType.Items.Add(GetEnumName(TypeInfo(TFaturaTipi), i));
  cbInvoiceType.ItemIndex := 0;
end;

end.
