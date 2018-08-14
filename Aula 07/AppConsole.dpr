program AppConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Records in 'Records.pas',
  Arrays in 'Arrays.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  try
    Records.Exemplo;
    Arrays.Exemplo;
    Arrays.ExemploComRecords;
    Arrays.ExemploComObjetos;
    Readln;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      Readln;
    end;
  end;
end.
