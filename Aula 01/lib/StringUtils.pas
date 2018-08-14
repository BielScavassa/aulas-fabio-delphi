unit StringUtils;

interface

uses
  OutraUnit;

function ReversoMaiuscula(Texto: string): string;

var
  Publica: string;

implementation

uses
  System.StrUtils,
  System.SysUtils;

var
  // Variável local só fica disponível dentro da sessão implementation desta unit
  Local: string;

function Maiuscula(Texto: string): string;
begin
  Result := UpperCase(Texto);
end;

function ReversoMaiuscula(Texto: string): string;

  function AdicionarPrefixo(Texto, Prefixo: string): string;
  begin
    Result := Prefixo + ' ' + Texto
  end;

begin
  Result := Maiuscula(Texto);
  Result := ReverseString(Result);
  Result := AdicionarPrefixo(Result, '****');
end;

{$IFDEF CONSOLE}
initialization
  Writeln('Inicializando app...');
finalization
  Writeln('Finalizando app...');
{$ENDIF}

end.
