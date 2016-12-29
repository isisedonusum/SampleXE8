unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  TaxPayerQuery, Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    HTTPRIO1: THTTPRIO;
    procedure Button1Click(Sender: TObject);
    function PrepareService(): ITaxPayerQuery;
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
  Memo2.Lines.Clear;
  Service := PrepareService();
  SetLength(VKNTCKNList, Memo1.Lines.Count);
  for i := 0 to  Memo1.Lines.Count - 1 do
    VKNTCKNList[i] := Memo1.Lines[i];
  UserList := Service.GetListByVknList(VKNTCKNList);
  for i := Low(UserList) to High(UserList) do
  begin
    Memo2.Lines.Add(UserList[i].Title + ' ' + UserList[i].Alias);
  end;
end;

function TForm3.PrepareService(): ITaxPayerQuery;
begin
  //HTTPRIO1.HTTPWebNode.UserName := Edit1.Text;
  //HTTPRIO1.HTTPWebNode.Password := Edit2.Text;
  Result := GetITaxPayerQuery(false, '', HTTPRIO1);
end;

end.
