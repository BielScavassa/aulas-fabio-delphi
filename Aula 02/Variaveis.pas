unit Variaveis;

interface

type
  TClasse = class
  strict private
    FVariavelEstritamentePrivada: string;
  private
    // Chamadas de "Fields", coloca-se um F como prefixo
    FVariavelPrivada: string;
  protected
    FVariavelProtegida: string;
  public
    // Vari�veis p�blicas n�o devem ter prefixo F
    class var VariavelDeClasse: string;
    VariavelPublica: string;
    procedure Exemplo;
  end;

  TOutraClasse = class
    // Se n�o especificar o escopo � sempre public
    procedure AcessarVariaveis;
  end;

var
  VariavelPublica: string;

implementation

var
  VariavelPrivada: string;

{ TClasse }

procedure TClasse.Exemplo;
var
  VariavelLocal: string;
  X, Y, Z: Integer; // Declarar m�ltiplas vari�veis na mesma linha

  // M�todos aninhados
  procedure MetodoAninhado;
  var
    VariavelAninhada: string;
  begin
    // Este m�todo tem acesso as vari�veis do m�todo Exemplo
    VariavelAninhada := VariavelLocal;
  end;

begin
  Writeln(' === Vari�veis ===');

  VariavelLocal := 'S� dispon�vel dentro deste m�todo';

  // Vari�veis aninhadas n�o est�o dispon�veis no m�todo "pai"
  // Erro:
  // VariavelAninhada := 'Esta vari�vel n�o est� acess�vel aqui';

  // Acesso a todas as vari�veis da Instancia ou classe
  FVariavelPrivada := 'private';
  FVariavelEstritamentePrivada := 'strict private';
  FVariavelProtegida := 'protected';
  VariavelPublica := 'public';
  VariavelDeClasse := 'class var';

  // Vari�vel de classe tem um �nico valor para todas as inst�ncias da classe
  VariavelDeClasse := 'Este valor ser� o mesmo em todas as inst�ncias';

  // Acessa o valor da vari�vel de classe
  Writeln(TClasse.VariavelDeClasse);
end;

{ TOutraClasse }

procedure TOutraClasse.AcessarVariaveis;
var
  Instancia: TClasse;
  Valor: string;
begin
  Instancia := TClasse.Create;
  try
    // Vari�veis da Instancia
    Valor := Instancia.FVariavelPrivada; // Vari�vel privada pode ser acessada por classes na mesma unit
    Valor := Instancia.FVariavelProtegida;
    Valor := Instancia.VariavelPublica;

    // Vari�vel de classe pode ser acessada tanto pela inst�ncia quanto pela classe
    Valor := Instancia.VariavelDeClasse;
    // Geralmente usamos a op��o abaixo
    Valor := TClasse.VariavelDeClasse

    // Vari�vel estritamente privada n�o pode ser acessada de outra classe, mesmo na mesma unit
    // Express�o abaixo n�o compila:
    // Valor := Instancia.FVariavelEstritamentePrivada;
  finally
    Instancia.Free;
  end;
end;

end.
