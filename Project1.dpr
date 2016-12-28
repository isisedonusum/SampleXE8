program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  EInvoiceEasy in 'EInvoiceEasy.pas',
  Unit2 in 'Unit2.pas' {Form2},
  TaxPayerQuery in 'TaxPayerQuery.pas',
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Contracts in 'Contracts.pas',
  UblTr in 'UblTr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
