unit Arrays;

interface

const
  // Declara��o de array fixa � o primeiro �ndice at� o �ltimo
  // ent�o 0..2 s�o 3 elementos 0, 1 e 2
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
  // Arrays sempre come�am com �ndice 0 e devem ser acessadas pelos �ndices
  Writeln(ArrayFixa[0]);
  Writeln(ArrayComGenerics[1]);

  // Dar loop em array de qualquer tipo utilizando o �ndice
  for I := Low(ArrayFixa) to High(ArrayFixa) do
    Writeln(Format('Elemento: %d Valor: %s', [I, ArrayFixa[I]]));

  // Loop do �ltimo elemento para o primeiro
  for I := High(ArrayFixa) downto Low(ArrayFixa) do
    Writeln(Format('Elemento: %d Valor: %s', [I, ArrayFixa[I]]));

  // Acrescentar um elemento em um array.
  // Quando se sabe a quantidade de elementos, pode-se usar o indice
  SetLength(ArrayDinamica, 1);
  ArrayDinamica[0] := 'primeiro elemento';

  //Se quiser inserir v�rios elementos, pode-se usar:
  for Valor in ArrayFixa do
  begin
    // Incrementa o tamanho do array em 1
    SetLength(ArrayDinamica, Length(ArrayDinamica) + 1);
    // Insere um item na �ltima posic�o do array (que acabou de ser criada acima)
    ArrayDinamica[High(ArrayDinamica)] := Valor;
  end;

  // Mas estamos em 2017, deve ter uma forma mais f�cil!
  for Valor in ArrayFixa do
    ArrayDinamica := ArrayDinamica + [Valor]; // Muito melhor!

  // Libera a mem�ria utilizada pelo Array
  // Cuidado, isso s� libera o array e n�o os objetos contidos nela
  // Com tipos primitidos � seguro, com objetos d� memory leak
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
  Pessoa := TClassePessoa.Create('F�bio');
  Lista := Lista + [Pessoa];

  Pessoa.Nome := 'Felipe';
  Lista := Lista + [Pessoa];

  for I := Low(Lista) to High(Lista) do
    Writeln(Lista[I].Nome);

  // Zerar o array ser� que libera os objetos?
  SetLength(Lista, 0);
end;

procedure ExemploComRecords;
var
  Pessoa: TPessoa;
  Lista: TArray<TPessoa>;
  I: Integer;
begin
  Writeln('=== Arrays.ExemploComRecords ===');

  Pessoa.Nome := 'F�bio';
  Lista := Lista + [Pessoa];

  Pessoa.Nome := 'Felipe';
  Lista := Lista + [Pessoa];

  for I := Low(Lista) to High(Lista) do
    Writeln(Lista[I].Nome);
end;

end.
