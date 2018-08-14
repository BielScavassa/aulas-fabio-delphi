unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormMain = class(TForm)
    ButtonComponente: TButton;
    procedure ButtonComponenteClick(Sender: TObject);
  private
    procedure ButtonCodigoClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.ButtonCodigoClick(Sender: TObject);
begin
  ShowMessage('Código');
end;

procedure TFormMain.ButtonComponenteClick(Sender: TObject);
begin
  ShowMessage('Componente');
end;

constructor TFormMain.Create(AOwner: TComponent);
var
  ButtonCodigo: TButton;
  Panel1: TPanel;
begin
  inherited;
  Panel1 := TPanel.Create(Self);

  Panel1.Name := 'Panel1';
  Panel1.Parent := Self;
  Panel1.Left := 320;
  Panel1.Top := 83;
  Panel1.Width := 249;
  Panel1.Height := 97;
  Panel1.Caption := 'Panel1';
  Panel1.TabOrder := 1;

  // Componente é uma classe herdada de TComponent
  // TButton é uma classe como qualquer outra
  ButtonCodigo := TButton.Create(Self);

  // Nome do componente precisa ser único no parent
  ButtonCodigo.Name := 'ButtonCodigo';
  // Parent é onde o componente vai ser "desenhado"
  ButtonCodigo.Parent := Panel1;

  // Posição e tamanho do componente
  ButtonCodigo.Left := 30;
  ButtonCodigo.Top := 15;
  ButtonCodigo.Width := 153;
  ButtonCodigo.Height := 25;

  // Outras propriedades
  ButtonCodigo.Caption := 'Botão - Código';
  ButtonCodigo.TabOrder := 0;

  // Eventos são apenas métodos que são executados em um determinado momento
  ButtonCodigo.OnClick := ButtonCodigoClick;
end;

end.
