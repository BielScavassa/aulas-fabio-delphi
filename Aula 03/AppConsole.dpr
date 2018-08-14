program AppConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Produto in 'Produto.pas',
  Calc in 'Calc.pas';

var
  Produto: TProduto;
  Produto2: TProduto;
  Soma: Currency;
begin
  ReportMemoryLeaksOnShutdown := True;
  try
    // Exception no Construtor faz com que o objeto não seja inicializado: **bugs**
    try
      // O que é e como tratar exceptions
      try
        Produto := TProduto.Create('Paçoca', -1);
      except
      end; // Não façam isso em casa crianças!
    finally
      Produto.Free; // Bug. Ao dar erro no construtor o produto não é retornado
    end;

    // Forma correta: Os objetos precisam ser instanciados fora do try
    Produto := TProduto.Create('Cerveja', 3.99);
    try
      Writeln(Produto.Detalhes);
    finally
      Produto.Free;
    end;

    // Método correto para instanciar 2 objetos:
    // Inicializa ambos com nil, assim o Free não vai explodir
    Produto := nil;
    Produto2 := nil;
    try
      // Instanciar um objeto herdado em uma variável do tipo base
      try
        Produto := TProduto.Create('Suco', -1);
      except
        on E: EValidationError do
          Writeln(Format('Erro de validação: %s', [E.Message]));
       end;

      Produto2 := TProduto.Create('Cerveja', 3.99);
    finally
      Produto.Free;
      Produto2.Free;
    end;

    Produto := nil;
    Produto2 := nil;
    try
      Produto := TProduto.Create('Leite', 2.99);
      Produto.Preco := -1;

      Produto2 := TProduto.Create('Cerveja', 3.99);

      Soma := TCalc.Somar(Produto, Produto2);

      Writeln(Format('Soma: %m', [Soma]))
    finally
      Produto.Free;
      Produto2.Free;
    end;

    Readln;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      Readln;
    end;
  end;
end.
