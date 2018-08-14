unit Constantes;

interface

const
  ConstanteGlobal = 'global';

resourcestring
  ConstanteASerTraduzida = 'traduza-me';

type
  TClasseComConstantes = class
  private
    const ConstantePrivada = 'private';
    const ContanteInteger = 1;
  public
    const ConstanteDeClasse = 'classe';
    class procedure Exemplo;
  end;

implementation

const
  ConstanteLocal = 'local';

{ TClasseComConstantes }

class procedure TClasseComConstantes.Exemplo;
const
  Pi = 3.14;
resourcestring
  ResourceLocal = 'traduzir';
begin
  Writeln(' === Constantes ===');
  // Erro de compila��o:
  // ConstanteLocal := 2;

  // const e resourcestring funcionam da mesma forma que vari�veis,
  // mas seu valor n�o pode ser alterado durante a execu��o.
  WriteLn(ResourceLocal);
end;

end.
