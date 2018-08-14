unit Calc;

interface

uses
  Produto;

type
  TCalc = class
    FTotal: Currency;
    class function Somar(P1, P2: TProduto): Currency;
    class function Subtrair(P1, P2: TProduto): Currency;
  end;

implementation

{ TCalc }

class function TCalc.Somar(P1, P2: TProduto): Currency;
begin
  Result := P1.Preco + P2.Preco;

  // Erro: Total não é acessível, pois não estamos em uma instância
  // FTotal := Result;
end;

class function TCalc.Subtrair(P1, P2: TProduto): Currency;
begin
  Result := P1.Preco - P2.Preco;
end;

end.
