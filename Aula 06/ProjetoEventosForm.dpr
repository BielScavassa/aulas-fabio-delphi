program ProjetoEventosForm;

uses
  Vcl.Forms,
  FormEventos in 'FormEventos.pas' {Form1},
  DM1 in 'DM1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
