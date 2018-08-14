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
  Writeln(' === Express�es ===');

  // Express�es num�ricas, c�lculos, etc
  I := 1 + 1;

  // Expres�o retorna Extended e n�o integer
  // I := 1 / 2;

  // Concatena��o de strings
  S := 'A' + 'B' + sLineBreak + // sLineBreak = quebra de linha
    'C' +
    'D';

  Writeln(S);

  // Express�es booleanas
  B := True or False;
  B := True and False;
  B := True = False;
  B := True <> False;
  B := 1 > 0;
  B := 1 = 0;

  // Fun��es
  F := procedure(Texto: string)
       begin
        Writeln(Texto);
       end;

  F('Procedure executada');
end;

end.
