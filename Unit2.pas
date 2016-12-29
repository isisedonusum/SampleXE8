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
  vergi: TVergi;
begin
  fatura := TFatura.Create;
  fatura.Senaryo := TFaturaSenaryo(GetEnumValue(TypeInfo(TFaturaSenaryo),
    cbProfileID.Items[cbProfileID.ItemIndex]));
  fatura.Tipi := TFaturaTipi(GetEnumValue(TypeInfo(TFaturaTipi),
    cbInvoiceType.Items[cbInvoiceType.ItemIndex]));
  fatura.BelgePB := 'TRY';

  // Alýcý
  fatura.Alici := TMuhatap.Create;
  fatura.Alici.WebURI := 'http://www.isisbilisim.com.tr';
  fatura.Alici.VKNTCKN := '46603924300';
  fatura.Alici.Unvan := 'ISIS Biliþim Teknolojileri';
  fatura.Alici.Ilce := 'Ataþehir';
  fatura.Alici.Il := 'Ýstanbul';
  fatura.Alici.Ulke := 'Türkiye';
  fatura.Alici.UlkeKodu := 'TR';
  fatura.Alici.VergiDairesi := 'Ýlyasbey';

  // fatura kalemleri
  fatura.Kalemler := TKalemler.Create;
  kalem := TKalem.Create;
  kalem.KalemNo := 1; // kalem numarasý 1'den baþlar
  kalem.UrunAdi := 'e-Fatura';
  kalem.Miktar := 5;
  kalem.OlcuBirimi := TOlcuBirimleri.C62;
  kalem.KalemTutar := 100;
  kalem.BirimFiyat := 21;
  kalem.IndirimTutar := 5;
  kalem.Vergiler := TVergiler.Create;
  //vergi
  vergi :=  TVergi.Create('0015', 'KDV');
  vergi.Oran := 8;
  kalem.Vergiler.Add(vergi);
  //vergi 2
  vergi :=  TVergi.Create('0015', 'KDV');
  vergi.Oran := 18;
  kalem.Vergiler.Add(vergi);
  fatura.Kalemler.Add(kalem);
  //baþlýk vergileri manuel de atanabilir
  fatura.BaslikVergileriHesapla;

  CreateUblTr(fatura);
end;

procedure TForm2.FormShow(Sender: TObject);
var
  i: Integer;
begin
  cbProfileID.Items.Clear;
  for i := Ord(Low(TFaturaSenaryo)) to Ord(High(TFaturaSenaryo)) do
    cbProfileID.Items.Add(GetEnumName(TypeInfo(TFaturaSenaryo), i));
  cbProfileID.ItemIndex := 0;

  cbInvoiceType.Items.Clear;
  for i := Ord(Low(TFaturaTipi)) to Ord(High(TFaturaTipi)) do
    cbInvoiceType.Items.Add(GetEnumName(TypeInfo(TFaturaTipi), i));
  cbInvoiceType.ItemIndex := 0;
end;

end.
