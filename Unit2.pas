unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
  fatura.Senaryo := cbProfileID.Items[cbProfileID.ItemIndex];
  fatura.Tipi := cbInvoiceType.Items[cbInvoiceType.ItemIndex];
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

end.
