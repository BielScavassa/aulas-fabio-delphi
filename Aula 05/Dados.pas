unit Dados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient;

type
  EValidationError = class(Exception);

  TDmDados = class(TDataModule)
    Conexao: TSQLConnection;
    sqlPessoas: TSQLDataSet;
    sqlPessoaspessoa_id: TIntegerField;
    sqlPessoasnome: TWideStringField;
    sqlPessoastelefone: TWideStringField;
    sqlPessoasemail: TWideStringField;
    dspPessoas: TDataSetProvider;
    cdsPessoas: TClientDataSet;
    cdsPessoaspessoa_id: TIntegerField;
    cdsPessoasnome: TWideStringField;
    cdsPessoastelefone: TWideStringField;
    cdsPessoasemail: TWideStringField;
    procedure cdsPessoasBeforePost(DataSet: TDataSet);
    procedure dspPessoasAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind:
        TUpdateKind);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmDados.cdsPessoasBeforePost(DataSet: TDataSet);
begin
  if cdsPessoasnome.Value.IsEmpty then
    raise EValidationError.Create('Nome é obrigatório.');

  if Pos('@', cdsPessoasemail.Value) = 0 then
    raise EValidationError.Create('E-mail inválido.');
end;

procedure TDmDados.dspPessoasAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
    UpdateKind: TUpdateKind);
var
  Query: TSQLQuery;
begin
  if UpdateKind <> ukInsert then
    Exit;

  Query := TSQLQuery.Create(nil);
  try
    Query.SQLConnection := Conexao;
    Query.CommandText := 'SELECT last_value FROM pessoas_pessoa_id_seq;';
    Query.Open;

    DeltaDS.Edit;
    DeltaDS.FieldByName(sqlPessoaspessoa_id.FieldName).NewValue := Query.Fields[0].Value;
    DeltaDS.Post;
  finally
    Query.Free;
  end;
end;

end.
