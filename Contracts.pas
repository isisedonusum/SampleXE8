unit Contracts;

interface

uses
  SysUtils, System.Classes;

type
  TMuhatap = class
  private
    { Private declarations }
  public
    { Public declarations }
    WebURI, VKNTCKN, Unvan, Ilce, Il, Ulke, UlkeKodu, VergiDairesi: String end;

  type
    TOlcuBirimleri = (B32, // Kilogram / Metrekare
      BAS, // Bas
      BX, // Kutu
      C62, // Adet
      CCT, // Ton baþýna taþýma kapasitesi
      CLT, // Santilitre
      CMK, // Santimetrekare
      CMQ, // Santimetreküp
      CMT, // Santimetre
      CPR, // Adet (Çift)
      CS, // Koli
      CT, // Karton
      D30, // Brüt Kalori Deðeri
      D40, // Bin Litre
      DAY, // Gün
      GMS, // Gümüþ
      GRM, // Gram
      GT, // Gross Ton
      HUR, // Saat
      K20, // Kg Potasyum Oksit
      K58, // Kurutulmuþ Net Aðýrlýklý kg
      K62, // Kg / Adet
      KGM, // Kilogram
      KGS, // KGS
      KH6, // Kg / Bas
      KJO, // Kilojul
      KPR, // Kilogram-Çift
      KSD, // %90 Kuru Ürün Kilogramý
      KTM, // Kilometre
      KWH, // Kilowattsaat
      KWT, // Kilowatt
      LPA, // Saf Alkol Listesi
      LTR, // Litre
      MLT, // Mililitre
      MMQ, // Metreküp
      MMT, // Milimetre
      MON, // Ay
      MTK, // Metrekare
      MTQ, // Metreküp
      MTR, // Metre
      NCL, // Hücre Adet
      NCR, // Karat
      NM3, // 101325 mbar/m³ (0°C)
      PA, // Paket
      PR, // Çift
      R9, // Bin Metreküp
      _SET, // Set
      SM3, // 101325 mbar/m³ (15°C)
      T3, // Bin Adet
      TWH, // Bin Kilowatt-saat
      _26 // Ton
      );

    TKalem = class
    private
      { Private declarations }
    public
      { Public declarations }
      KalemNo: Integer;
      Notlar: TStringList;
      Miktar: Double;
      OlcuBirimi: TOlcuBirimleri;
      KalemTutar: Currency;
      UrunAdi: String;
      BirimFiyat: Currency;
    end;

    TKalemler = class(TList)
    private
      function Get(Index: Integer): TKalem;
    public
      destructor Destroy; override;
      function Add(Value: TKalem): Integer;
      property Items[Index: Integer]: TKalem read Get; default;
    end;

    TFatura = class
    private
      { Private declarations }
    public
      { Public declarations }
      Senaryo: String;
      Tipi: String;
      BelgePB: String;
      Alici: TMuhatap;
      Kalemler: TKalemler;
    end;

implementation

function TKalemler.Add(Value: TKalem): Integer;
begin
  Result := inherited Add(Value);
end;

destructor TKalemler.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Free;
  inherited;
end;

function TKalemler.Get(Index: Integer): TKalem;
begin
  Result := TKalem(inherited Get(Index));
end;

end.
