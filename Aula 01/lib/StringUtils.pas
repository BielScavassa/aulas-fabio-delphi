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
  // Vari�vel local s� fica dispon�vel dentro da sess�o implementation desta unit
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
