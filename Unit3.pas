unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  TaxPayerQuery, Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Vcl.Grids;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    HTTPRIO1: THTTPRIO;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    function PrepareService(): ITaxPayerQuery;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  Service: ITaxPayerQuery;
  UserList: TaxPayerQuery.ArrayOfUser;
  VKNTCKNList: TaxPayerQuery.ArrayOfstring;
  i: integer;
begin
  Service := PrepareService();
  SetLength(VKNTCKNList, Memo1.Lines.Count);
  for i := 0 to Memo1.Lines.Count - 1 do
    VKNTCKNList[i] := Memo1.Lines[i];
  UserList := Service.GetListByVknList(VKNTCKNList);
  StringGrid1.RowCount := Length(UserList) + 1;
  for i := Low(UserList) to High(UserList) do
  begin
    StringGrid1.Cells[0, i + 1] := UserList[i].Identifier;
    StringGrid1.Cells[1, i + 1] := UserList[i].Title;
    StringGrid1.Cells[2, i + 1] := UserList[i].Alias;
    StringGrid1.Cells[3, i + 1] := UserList[i].Type_;
    StringGrid1.Cells[4, i + 1] := BoolToStr(UserList[i].IsActive, True);
    StringGrid1.Cells[5, i + 1] :=
      DateToStr(UserList[i].CreatedDate.AsDateTime);
    StringGrid1.Cells[6, i + 1] :=
      DateToStr(UserList[i].UpdatedDate.AsDateTime);
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  StringGrid1.Cells[0, 0] := 'VKN/TCKN';
  StringGrid1.Cells[1, 0] := 'Unvan';
  StringGrid1.Cells[2, 0] := 'Posta Kutusu';
  StringGrid1.Cells[3, 0] := 'Tipi';
  StringGrid1.Cells[4, 0] := 'Aktif/Pasif';
  StringGrid1.Cells[5, 0] := 'Oluþturulma';
  StringGrid1.Cells[6, 0] := 'Güncelleme';
  StringGrid1.ColWidths[0] := 75;
  StringGrid1.ColWidths[1] := 300;
  StringGrid1.ColWidths[2] := 200;
end;

function TForm3.PrepareService(): ITaxPayerQuery;
begin
  // HTTPRIO1.HTTPWebNode.UserName := Edit1.Text;
  // HTTPRIO1.HTTPWebNode.Password := Edit2.Text;
  Result := GetITaxPayerQuery(false, '', HTTPRIO1);
end;

end.
