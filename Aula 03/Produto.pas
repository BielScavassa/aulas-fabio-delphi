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
    // Construtor pode receber par�metros para inicializar os Fields
    constructor Create(Nome: string; Preco: Currency);
  end;

  EValidationError = class(Exception);

implementation

{ TProduto }

constructor TProduto.Create(Nome: string; Preco: Currency);
begin
  FNome := Nome;

  // Exceptions no construtor podem causar memory leaks
  // Ao dar exception no construtor o objeto n�o � criado
  Self.Preco := Preco;
end;

destructor TProduto.Destroy;
begin
  Writeln(Format('Removendo produto: %s da mem�ria', [Detalhes]));
  inherited;
end;

function TProduto.Detalhes: string;
begin
  Result := Format('%s: %m', [FNome, FPreco]);
end;

procedure TProduto.SetPreco(const Value: Currency);
begin
  if Value < 0 then
    raise EValidationError.Create('Pre�o n�o pode ser negativo.');

  FPreco := Value;
end;

function TProduto.Somar(Produto: TProduto): Currency;
begin
  // Podemos acessar FPreco, Preco, Self.FPreco ou Self.Preco
  // Todas as formas s�o equivalentes, mas por padr�o sempre utiliza-se o Field: FPreco
  Result := FPreco + Produto.Preco;
end;

end.
