unit Variants;

interface

procedure Exemplo;

implementation

uses
  System.Variants;

procedure Exemplo;
var
  A: Variant;
begin
  Writeln(' === Variants ===');
  A := Unassigned;
  A := Null;

  // Erro em runtime
  // Writeln(A);

  A := 'string';
  Writeln(A); // ok

  A := 1;
  Writeln(A); // ok
  Writeln(A + 1); // ok

  A := 'string';
  Writeln(A + 1); // Erro de conversão em runtime
end;

end.
