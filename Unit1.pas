unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Soap.InvokeRegistry,
  Soap.Rio, Soap.SOAPHTTPClient, Winapi.WinInet, Soap.SOAPHTTPTrans,
  EInvoiceEasy,
  System.Types, System.UITypes, System.TypInfo;

type
  TForm1 = class(TForm)
    Button1: TButton;
    HTTPRIO1: THTTPRIO;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function PrepareService(): IEasy;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Service: IEasy;
  Response: Contracts_ResponseType2;
  MsgDlgType: TMsgDlgType;
begin
  Service := PrepareService();
  try
    Response := Service.GetStatus(Edit3.Text, Contracts_DirectionType.OUTBOUND,
      Edit4.Text);
    if Response.Status = Contracts_StatusType.ERROR then
      MsgDlgType := mtError
    else if Response.Status = Contracts_StatusType.PROCCESSING then
      MsgDlgType := mtWarning
    else
      MsgDlgType := mtInformation;
    MessageDlg(GetEnumName(TypeInfo(Contracts_StatusType), Ord(Response.Status)) + ': ' + Response.GIBMessage, MsgDlgType, [mbOK], 0);
  Except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Service: IEasy;
  Response: Contracts_ResponseType2;
  Data: TByteDynArray;
  afile: file of byte;
  i: Integer;

begin
  if OpenDialog1.Execute() = false then
    exit;
  AssignFile(afile, OpenDialog1.FileName);
  Reset(afile);
  SetLength(Data, FileSize(afile));
  For i := 1 to FileSize(afile) do
    Read(afile, Data[i - 1]);
  CloseFile(afile);
  Service := PrepareService();
  try
    Response := Service.SendInvoice(Edit3.Text, '', '', Data);
    if Response.Status = Contracts_StatusType.OK then
    begin
      Edit4.Text := Response.ETTN;
      ShowMessage(Response.ID);
      exit;
    end;
    ShowMessage(Response.GIBMessage);
  Except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

function TForm1.PrepareService(): IEasy;
begin
  HTTPRIO1.HTTPWebNode.UserName := Edit1.Text;
  HTTPRIO1.HTTPWebNode.Password := Edit2.Text;
  Result := GetIEasy(false, '', HTTPRIO1);
end;

end.
