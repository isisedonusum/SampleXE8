program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  EInvoiceEasy in 'EInvoiceEasy.pas',
  Unit2 in 'Unit2.pas' {Form2},
  TaxPayerQuery in 'TaxPayerQuery.pas',
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;

end.
