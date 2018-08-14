program AppConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Exp in 'Exp.pas',
  Variaveis in 'Variaveis.pas',
  Variants in 'Variants.pas',
  Constantes in 'Constantes.pas',
  Enum in 'Enum.pas';

var
  Instancia: TClasse;
begin
  Instancia := TClasse.Create;
  try
    Exp.Expressoes;

    Instancia.VariavelDeClasse := 'class var';
    Instancia.VariavelPublica := 'publica';
    TClasse.VariavelDeClasse := 'class var';
    Instancia.Exemplo;

    TClasseComConstantes.Exemplo;
    WriteLn(TClasseComConstantes.ConstanteDeClasse);

    Enum.Exemplo;

    Variants.Exemplo;
    Readln;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      Readln;
    end;
  end;
end.
