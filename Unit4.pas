unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure FormShow(Sender: TObject);
    procedure EmbedForm(InstanceClass: TComponentClass; var Reference; AOwner: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1, Unit2, Unit3;

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
  EmbedForm(TForm1, Form1, TabSheet1);
  EmbedForm(TForm2, Form2, TabSheet2);
  EmbedForm(TForm3, Form3, TabSheet3);
end;

procedure TForm4.EmbedForm(InstanceClass: TComponentClass; var Reference; AOwner: TComponent);
var
  Instance: TComponent;
begin
  Instance := TComponent(InstanceClass.NewInstance);
  TComponent(Reference) := Instance;
  try
    Instance.Create(AOwner.Owner);
    TForm(Instance).BorderStyle := bsNone;
    TForm(Instance).Parent := TWinControl(AOwner);
    TForm(Instance).Align := alClient;
    TForm(Instance).Constraints.MaxHeight := 0;
    TForm(Instance).Constraints.MinHeight := 0;
    TForm(Instance).Constraints.MaxWidth := 0;
    TForm(Instance).Constraints.MinWidth := 0;
    TForm(Instance).Show;
  except
    TComponent(Reference) := nil;
    raise;
  end;
end;

end.
