unit OutraUnit;

interface

implementation

{$IFDEF CONSOLE}
initialization
  Writeln('Outra unit');
finalization
  Writeln('Finalizando Outra unit');
  Readln;
{$ENDIF}

end.
