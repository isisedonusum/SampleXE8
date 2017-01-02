unit Contracts;

interface

uses
  SysUtils, System.Classes, tr.com.isisbilisim.types;

type

  TMuhatap = class
  public
    { Public declarations }
    WebURI, VKNTCKN, Unvan, Ilce, Il, Ulke, UlkeKodu, VergiDairesi: String end;

    TFaturaSenaryo = (TEMELFATURA, TICARIFATURA, IHRACAT, YOLCUBERABERFATURA);
    TFaturaTipi = (SATIS, IADE, TEVKIFAT, ISTISNA, OZELMATRAH, IHRACKAYITLI);
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

    TVergi = class(TObject)public Matrah: Nullable<Currency>;
    Kodu: String;
    Adi: String;
    Oran: Nullable<Double>;
    Tutar: Currency;
    MuafiyetKodu: String;
    MuafiyetAciklama: String;
    constructor Create(Kodu, Adi: String);
    procedure Clone(out vergi: TVergi);
  end;

  TVergiler = class(TList)
  private
    function Get(Index: Integer): TVergi;
  public
    ToplamVergi: Currency;
    destructor Destroy; override;
    function Add(Value: TVergi): Integer;
    property Items[Index: Integer]: TVergi read Get; default;
    function MevcutMu(vergi: TVergi): TVergi;
  end;

  TKalem = class
  public
    KalemNo: Integer;
    Notlar: TStringList;
    Miktar: Double;
    OlcuBirimi: TOlcuBirimleri;
    IndirimTutar: Nullable<Currency>;
    KalemTutar: Currency;
    UrunKodu: String;
    UrunAdi: String;
    BirimFiyat: Currency;
    Vergiler: TVergiler;
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
    No: String;
    ETTN: String;
    Tarih: TDate;
    Saat: TTime;
    Senaryo: TFaturaSenaryo;
    Tipi: TFaturaTipi;
    BelgePB: String;
    Gorsel: TFileName;
    Gonderici: TMuhatap;
    Alici: TMuhatap;
    Kalemler: TKalemler;
    Vergiler: TVergiler;
    KalemToplamTutar: Currency;
    VergiDahilTutar: Currency;
    VergiHaricTutar: Currency;
    ToplamIndirim: Currency;
    OdenecekTutar: Currency;
    constructor Create(); overload;
    constructor Create(ETTN: String); overload;
    procedure BaslikVergileriHesapla;
  end;

implementation

constructor TVergi.Create(Kodu, Adi: String);
begin
  self.Kodu := Kodu;
  self.Adi := Adi;
end;

procedure TVergi.Clone(out vergi: TVergi);
begin
  vergi := TVergi.Create(self.Kodu, self.Adi);
  if self.Matrah.HasValue then
    vergi.Matrah := self.Matrah.Value;
  if self.Oran.HasValue then
    vergi.Oran := self.Oran.Value;
  vergi.Tutar := self.Tutar;
  vergi.MuafiyetKodu := self.MuafiyetKodu;
  vergi.MuafiyetAciklama := self.MuafiyetAciklama;
end;

function TVergiler.Add(Value: TVergi): Integer;
begin
  Result := inherited Add(Value);
end;

destructor TVergiler.Destroy;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Free;
  inherited;
end;

function TVergiler.Get(Index: Integer): TVergi;
begin
  Result := TVergi(inherited Get(Index));
end;

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

constructor TFatura.Create();
var
  Uid: TGuid;
begin
  CreateGuid(Uid);
  self.ETTN := GuidToString(Uid);
  self.ETTN := StringReplace(ETTN, '{', '', [rfReplaceAll]);
  self.ETTN := StringReplace(ETTN, '}', '', [rfReplaceAll]);

end;

constructor TFatura.Create(ETTN: String);

begin
  self.ETTN := ETTN;
end;

procedure TFatura.BaslikVergileriHesapla;
var
  mevcut, yeni: TVergi;
  i, j: Integer;
begin
  if self.Kalemler = nil then
    raise Exception.Create('Fatura kalemi bulunamadý!');
  self.Vergiler := TVergiler.Create;
  for i := 0 to self.Kalemler.Count - 1 do
    for j := 0 to self.Kalemler[i].Vergiler.Count - 1 do
    begin
      mevcut := self.Vergiler.MevcutMu(self.Kalemler[i].Vergiler[j]);
      if mevcut = nil then
      begin
        self.Kalemler[i].Vergiler[j].Clone(yeni);
        self.Vergiler.Add(yeni);
        self.Vergiler.ToplamVergi := self.Vergiler.ToplamVergi + yeni.Tutar;
      end
      else
      begin
        mevcut.Tutar := mevcut.Tutar + self.Kalemler[i].Vergiler[j].Tutar;
        self.Vergiler.ToplamVergi := self.Vergiler.ToplamVergi + mevcut.Tutar;
      end;
    end;

end;

function TVergiler.MevcutMu(vergi: TVergi): TVergi;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to self.Count - 1 do
    if (self[i].Kodu = vergi.Kodu) and (self[i].Oran = vergi.Oran) and
      (self[i].MuafiyetKodu = vergi.MuafiyetKodu) and
      (self[i].MuafiyetAciklama = vergi.MuafiyetAciklama) then
    begin
      Result := self[i];
      break;
    end;
end;

end.
