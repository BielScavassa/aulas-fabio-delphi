unit Records;

interface

type
  TPessoa = record
    Nome: string;
    Telefone: string;
    procedure Imprimir;
  end;

  TClassePessoa = class
    Nome: string;
    constructor Create(Nome: string);
  end;

procedure Exemplo;

implementation

uses
  System.SysUtils;

procedure TPessoa.Imprimir;
begin
  WriteLn(Format('Record -> Nome: %s Telefone: %s', [Nome, Telefone]));
end;

procedure AtualizarNome(Pessoa: TPessoa; Nome: string);
begin
  Pessoa.Nome := Nome;
end;

procedure AtualizarNomeObjeto(Pessoa: TClassePessoa; Nome: string);
begin
  Pessoa.Nome := Nome;
end;

procedure Exemplo;
var
  Pessoa: TPessoa;
  PessoaObj: TClassePessoa;
begin
  Writeln('=== Records.Exemplo ===');
  // Records n�o precisam ser instanciados
  // s�o criados automaticamente e alocados no "stack"
  Pessoa.Nome := 'F�bio';
  Pessoa.Telefone := '(19) 4321-1234';
  Pessoa.Imprimir;

  // Diferentemente de classes, os Records s�o passados por valor
  // Ao passar um record para um m�todo, � criada uma c�pia deste record dentro do m�todo
  AtualizarNome(Pessoa, 'Felipe');
  Pessoa.Imprimir;

  PessoaObj := TClassePessoa.Create('F�bio');
  try
    AtualizarNomeObjeto(PessoaObj, 'Felipe');

    Writeln('Objeto -> PessoaObj.Nome: ' + PessoaObj.Nome);
  finally
    PessoaObj.Free;
  end;
end;

{ TClassePessoa }

constructor TClassePessoa.Create(Nome: string);
begin
  Self.Nome := Nome;
end;

end.
