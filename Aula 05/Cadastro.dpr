program Cadastro;

uses
  Vcl.Forms,
  DBXDevartPostgreSQL,
  MainForm in 'MainForm.pas' {FormMain},
  Dados in 'Dados.pas' {DmDados: TDataModule},
  PessoaForm in 'PessoaForm.pas' {FormPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
