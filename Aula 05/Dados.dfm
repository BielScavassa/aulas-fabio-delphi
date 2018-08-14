object DmDados: TDmDados
  OldCreateOrder = False
  Height = 466
  Width = 481
  object Conexao: TSQLConnection
    ConnectionName = 'Devart PostgreSQL'
    DriverName = 'DevartPostgreSQL'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=localhost'
      'DataBase=monde'
      'SchemaName=dbx'
      'DriverName=DevartPostgreSQL'
      'User_Name=postgres'
      'Password=postgres'
      'FetchAll=True'
      'UseQuoteChar=False'
      'EnableBCD=False'
      'IPVersion=IPv4'
      'UseUnicode=True'
      'Charset=')
    Connected = True
    Left = 144
    Top = 16
  end
  object sqlPessoas: TSQLDataSet
    CommandText = 'select * from pessoas'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 144
    Top = 88
    object sqlPessoaspessoa_id: TIntegerField
      FieldName = 'pessoa_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlPessoasnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object sqlPessoastelefone: TWideStringField
      FieldName = 'telefone'
    end
    object sqlPessoasemail: TWideStringField
      FieldName = 'email'
      Required = True
      Size = 255
    end
  end
  object dspPessoas: TDataSetProvider
    DataSet = sqlPessoas
    Options = [poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspPessoasAfterUpdateRecord
    Left = 144
    Top = 160
  end
  object cdsPessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoas'
    BeforePost = cdsPessoasBeforePost
    Left = 144
    Top = 248
    object cdsPessoaspessoa_id: TIntegerField
      FieldName = 'pessoa_id'
      Visible = False
    end
    object cdsPessoasnome: TWideStringField
      DisplayWidth = 30
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object cdsPessoastelefone: TWideStringField
      DisplayWidth = 10
      FieldName = 'telefone'
    end
    object cdsPessoasemail: TWideStringField
      DisplayWidth = 30
      FieldName = 'email'
      Required = True
      Size = 255
    end
  end
end
