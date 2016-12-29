unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TypInfo, Vcl.Grids,
  Vcl.Mask;

type
  TForm2 = class(TForm)
    Button1: TButton;
    cbProfileID: TComboBox;
    Label1: TLabel;
    cbInvoiceType: TComboBox;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    txKalemToplamTutar: TEdit;
    Label3: TLabel;
    txNo: TMaskEdit;
    Label4: TLabel;
    txVergiHaricTutar: TEdit;
    Label5: TLabel;
    txVergiDahilTutar: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    txToplamIndirim: TEdit;
    Label8: TLabel;
    txOdenecekTutar: TEdit;
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
  fatura.No := txNo.Text;
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
  kalem.UrunKodu := '001';
  kalem.UrunAdi := 'e-Fatura';
  kalem.Miktar := 5;
  kalem.OlcuBirimi := TOlcuBirimleri.C62;
  kalem.BirimFiyat := 21;
  kalem.IndirimTutar := 5;
  kalem.KalemTutar := 100;
  kalem.Vergiler := TVergiler.Create;
  //vergi
  vergi :=  TVergi.Create('0015', 'KDV');
  vergi.Oran := 8;
  kalem.Vergiler.Add(vergi);

  fatura.Kalemler.Add(kalem);
  //baþlýk vergileri manuel de atanabilir
  fatura.BaslikVergileriHesapla;

  fatura.KalemToplamTutar := StrToCurr(txKalemToplamTutar.Text);
  fatura.VergiHaricTutar := StrToCurr(txVergiHaricTutar.Text);;
  fatura.VergiDahilTutar := StrToCurr(txVergiDahilTutar.Text);;
  fatura.ToplamIndirim := StrToCurr(txToplamIndirim.Text);;
  fatura.OdenecekTutar := StrToCurr(txOdenecekTutar.Text);;


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

  //Kalem grid
  StringGrid1.Cells[0,0] := 'Ürün Kodu';
  StringGrid1.Cells[1,0] := 'Ürün';
  StringGrid1.Cells[2,0] := 'B.Fiyat';
  StringGrid1.Cells[3,0] := 'Miktar';
  StringGrid1.Cells[4,0] := 'ÖlçüBrm';
  StringGrid1.Cells[5,0] := 'Ýsk.Orn.';
  StringGrid1.Cells[6,0] := 'Ýskonto';
end;

end.
