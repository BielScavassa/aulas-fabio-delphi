unit PessoaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Dados, Data.DB;

type
  TFormPessoa = class(TForm)
    LabelNome: TLabel;
    LabelTelefone: TLabel;
    LabelEmail: TLabel;
    EditNome: TDBEdit;
    EditTelefone: TDBEdit;
    EditEmail: TDBEdit;
    ButtonCancelar: TButton;
    ButtonOK: TButton;
    DataSource: TDataSource;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private
    FDados: TDmDados;
    procedure SetDados(const Value: TDmDados);
  public
    property Dados: TDmDados read FDados write SetDados;
  end;

implementation

{$R *.dfm}

procedure TFormPessoa.ButtonCancelarClick(Sender: TObject);
begin
  FDados.cdsPessoas.Cancel;
  ModalResult := mrCancel;
end;

procedure TFormPessoa.ButtonOKClick(Sender: TObject);
begin
//  if Pos('@', FDados.cdsPessoasemail.Value) = 0 then
//  begin
//    ShowMessage('Email inválido.');
//    Exit;
//  end;

  FDados.cdsPessoas.Post;
  ModalResult := mrOk;
end;

{ TFormPessoa }

procedure TFormPessoa.SetDados(const Value: TDmDados);
begin
  FDados := Value;
  DataSource.DataSet := FDados.cdsPessoas;
end;

end.
