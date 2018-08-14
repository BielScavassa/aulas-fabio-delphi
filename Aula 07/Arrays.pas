unit Arrays;

interface

const
  // Declaração de array fixa é o primeiro índice até o último
  // então 0..2 são 3 elementos 0, 1 e 2
  ArrayFixa: array[0..2] of string = ('a', 'b', 'c');
  ArrayComGenerics: TArray<string> =['a', 'b', 'c'];

procedure Exemplo;
procedure ExemploComObjetos;
procedure ExemploComRecords;

implementation

uses
  System.SysUtils, Records;

procedure Exemplo;
var
  ArrayDinamica: array of string;
  ArrayGenerica: TArray<Integer>;
  Valor: string;
  I: Integer;
begin
  Writeln('=== Arrays.Exemplo ===');
  // Arrays sempre começam com índice 0 e devem ser acessadas pelos índices
  Writeln(ArrayFixa[0]);
  Writeln(ArrayComGenerics[1]);

  // Dar loop em array de qualquer tipo utilizando o índice
  for I := Low(ArrayFixa) to High(ArrayFixa) do
    Writeln(Format('Elemento: %d Valor: %s', [I, ArrayFixa[I]]));

  // Loop do último elemento para o primeiro
  for I := High(ArrayFixa) downto Low(ArrayFixa) do
    Writeln(Format('Elemento: %d Valor: %s', [I, ArrayFixa[I]]));

  // Acrescentar um elemento em um array.
  // Quando se sabe a quantidade de elementos, pode-se usar o indice
  SetLength(ArrayDinamica, 1);
  ArrayDinamica[0] := 'primeiro elemento';

  //Se quiser inserir vários elementos, pode-se usar:
  for Valor in ArrayFixa do
  begin
    // Incrementa o tamanho do array em 1
    SetLength(ArrayDinamica, Length(ArrayDinamica) + 1);
    // Insere um item na última posicão do array (que acabou de ser criada acima)
    ArrayDinamica[High(ArrayDinamica)] := Valor;
  end;

  // Mas estamos em 2017, deve ter uma forma mais fácil!
  for Valor in ArrayFixa do
    ArrayDinamica := ArrayDinamica + [Valor]; // Muito melhor!

  // Libera a memória utilizada pelo Array
  // Cuidado, isso só libera o array e não os objetos contidos nela
  // Com tipos primitidos é seguro, com objetos dá memory leak
  SetLength(ArrayDinamica, 0);

  // Forma de instanciar um array com a syntaxe de generics
  ArrayGenerica := TArray<Integer>.Create(1, 2, 3);
  Writeln(IntToStr(ArrayGenerica[0]));
end;

procedure ExemploComObjetos;
var
  Pessoa: TClassePessoa;
  Lista: TArray<TClassePessoa>;
  I: Integer;
begin
  Writeln('=== Arrays.ExemploComObjetos ===');
  Pessoa := TClassePessoa.Create('Fábio');
  Lista := Lista + [Pessoa];

  Pessoa.Nome := 'Felipe';
  Lista := Lista + [Pessoa];

  for I := Low(Lista) to High(Lista) do
    Writeln(Lista[I].Nome);

  // Zerar o array será que libera os objetos?
  SetLength(Lista, 0);
end;

procedure ExemploComRecords;
var
  Pessoa: TPessoa;
  Lista: TArray<TPessoa>;
  I: Integer;
begin
  Writeln('=== Arrays.ExemploComRecords ===');

  Pessoa.Nome := 'Fábio';
  Lista := Lista + [Pessoa];

  Pessoa.Nome := 'Felipe';
  Lista := Lista + [Pessoa];

  for I := Low(Lista) to High(Lista) do
    Writeln(Lista[I].Nome);
end;

end.
