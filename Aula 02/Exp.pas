unit Exp;

interface

procedure Expressoes;

implementation

uses
  System.SysUtils;

procedure Expressoes;
var
  I: Integer;
  S: String;
  B: Boolean;
  F: TProc<string>;
begin
  Writeln(' === Expressões ===');

  // Expressões numéricas, cálculos, etc
  I := 1 + 1;

  // Expresão retorna Extended e não integer
  // I := 1 / 2;

  // Concatenação de strings
  S := 'A' + 'B' + sLineBreak + // sLineBreak = quebra de linha
    'C' +
    'D';

  Writeln(S);

  // Expressões booleanas
  B := True or False;
  B := True and False;
  B := True = False;
  B := True <> False;
  B := 1 > 0;
  B := 1 = 0;

  // Funções
  F := procedure(Texto: string)
       begin
        Writeln(Texto);
       end;

  F('Procedure executada');
end;

end.
