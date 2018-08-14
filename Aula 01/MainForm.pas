unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Controls;

type
  TFormMain = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  StringUtils;

{$R *.dfm}

procedure TFormMain.Button1Click(Sender: TObject);
begin
  Edit2.Text := ReversoMaiuscula(Edit1.Text)
end;

end.
