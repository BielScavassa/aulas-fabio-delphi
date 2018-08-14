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
    // Variáveis públicas não devem ter prefixo F
    class var VariavelDeClasse: string;
    VariavelPublica: string;
    procedure Exemplo;
  end;

  TOutraClasse = class
    // Se não especificar o escopo é sempre public
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
  X, Y, Z: Integer; // Declarar múltiplas variáveis na mesma linha

  // Métodos aninhados
  procedure MetodoAninhado;
  var
    VariavelAninhada: string;
  begin
    // Este método tem acesso as variáveis do método Exemplo
    VariavelAninhada := VariavelLocal;
  end;

begin
  Writeln(' === Variáveis ===');

  VariavelLocal := 'Só disponível dentro deste método';

  // Variáveis aninhadas não estão disponíveis no método "pai"
  // Erro:
  // VariavelAninhada := 'Esta variável não está acessível aqui';

  // Acesso a todas as variáveis da Instancia ou classe
  FVariavelPrivada := 'private';
  FVariavelEstritamentePrivada := 'strict private';
  FVariavelProtegida := 'protected';
  VariavelPublica := 'public';
  VariavelDeClasse := 'class var';

  // Variável de classe tem um único valor para todas as instâncias da classe
  VariavelDeClasse := 'Este valor será o mesmo em todas as instâncias';

  // Acessa o valor da variável de classe
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
    // Variáveis da Instancia
    Valor := Instancia.FVariavelPrivada; // Variável privada pode ser acessada por classes na mesma unit
    Valor := Instancia.FVariavelProtegida;
    Valor := Instancia.VariavelPublica;

    // Variável de classe pode ser acessada tanto pela instância quanto pela classe
    Valor := Instancia.VariavelDeClasse;
    // Geralmente usamos a opção abaixo
    Valor := TClasse.VariavelDeClasse

    // Variável estritamente privada não pode ser acessada de outra classe, mesmo na mesma unit
    // Expressão abaixo não compila:
    // Valor := Instancia.FVariavelEstritamentePrivada;
  finally
    Instancia.Free;
  end;
end;

end.
