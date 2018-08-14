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
    // Exception no Construtor faz com que o objeto n�o seja inicializado: **bugs**
    try
      // O que � e como tratar exceptions
      try
        Produto := TProduto.Create('Pa�oca', -1);
      except
      end; // N�o fa�am isso em casa crian�as!
    finally
      Produto.Free; // Bug. Ao dar erro no construtor o produto n�o � retornado
    end;

    // Forma correta: Os objetos precisam ser instanciados fora do try
    Produto := TProduto.Create('Cerveja', 3.99);
    try
      Writeln(Produto.Detalhes);
    finally
      Produto.Free;
    end;

    // M�todo correto para instanciar 2 objetos:
    // Inicializa ambos com nil, assim o Free n�o vai explodir
    Produto := nil;
    Produto2 := nil;
    try
      // Instanciar um objeto herdado em uma vari�vel do tipo base
      try
        Produto := TProduto.Create('Suco', -1);
      except
        on E: EValidationError do
          Writeln(Format('Erro de valida��o: %s', [E.Message]));
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
