unit Produto;

interface

uses
  System.SysUtils;

type
  TProduto = class(TObject)
  private
    FNome: string;
    FPreco: Currency;
    procedure SetPreco(const Value: Currency);
  protected
    property Nome: string read FNome;
  public
    function Detalhes: string;
    function Somar(Produto: TProduto): Currency;
    destructor Destroy; override;
    property Preco: Currency read FPreco write SetPreco;
    // Construtor pode receber parâmetros para inicializar os Fields
    constructor Create(Nome: string; Preco: Currency);
  end;

  EValidationError = class(Exception);

implementation

{ TProduto }

constructor TProduto.Create(Nome: string; Preco: Currency);
begin
  FNome := Nome;

  // Exceptions no construtor podem causar memory leaks
  // Ao dar exception no construtor o objeto não é criado
  Self.Preco := Preco;
end;

destructor TProduto.Destroy;
begin
  Writeln(Format('Removendo produto: %s da memória', [Detalhes]));
  inherited;
end;

function TProduto.Detalhes: string;
begin
  Result := Format('%s: %m', [FNome, FPreco]);
end;

procedure TProduto.SetPreco(const Value: Currency);
begin
  if Value < 0 then
    raise EValidationError.Create('Preço não pode ser negativo.');

  FPreco := Value;
end;

function TProduto.Somar(Produto: TProduto): Currency;
begin
  // Podemos acessar FPreco, Preco, Self.FPreco ou Self.Preco
  // Todas as formas são equivalentes, mas por padrão sempre utiliza-se o Field: FPreco
  Result := FPreco + Produto.Preco;
end;

end.
