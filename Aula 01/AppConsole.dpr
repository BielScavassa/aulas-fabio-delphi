program AppConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  StringUtils in 'lib\StringUtils.pas',
  OutraUnit in 'lib\OutraUnit.pas';

begin
  try
    // Variável pública pode ser alterada de qualquer lugar
    StringUtils.Publica  := 'variavel publica';
    Writeln(ReversoMaiuscula('Delphi 101'));
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
