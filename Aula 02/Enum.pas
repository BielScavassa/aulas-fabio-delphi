unit Enum;

interface

type
  TEstado = (eDesconhecido, eLigado, eDesligado);

procedure Exemplo;

implementation

uses
  System.SysUtils;

procedure Exemplo;
var
  E: TEstado;
begin
  Writeln(' === Enums ===');
  E := eLigado;
  case E of
    eDesconhecido:
      WriteLn('Indice estado ' + IntToStr(Ord(E)));
    eLigado:
      WriteLn('Indice estado ' + IntToStr(Ord(E)));
    eDesligado:
      WriteLn('Indice estado ' + IntToStr(Ord(E)));
  end;
end;

end.
