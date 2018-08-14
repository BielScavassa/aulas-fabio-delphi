object FormPessoa: TFormPessoa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pessoa'
  ClientHeight = 140
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelNome: TLabel
    Left = 31
    Top = 19
    Width = 31
    Height = 18
    Caption = 'Nome:'
  end
  object LabelTelefone: TLabel
    Left = 16
    Top = 46
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object LabelEmail: TLabel
    Left = 30
    Top = 73
    Width = 32
    Height = 13
    Caption = 'E-mail:'
  end
  object EditNome: TDBEdit
    Left = 68
    Top = 16
    Width = 381
    Height = 21
    DataField = 'nome'
    DataSource = DataSource
    TabOrder = 0
  end
  object EditTelefone: TDBEdit
    Left = 68
    Top = 43
    Width = 121
    Height = 21
    DataField = 'telefone'
    DataSource = DataSource
    TabOrder = 1
  end
  object EditEmail: TDBEdit
    Left = 68
    Top = 70
    Width = 381
    Height = 21
    DataField = 'email'
    DataSource = DataSource
    TabOrder = 2
  end
  object ButtonCancelar: TButton
    Left = 374
    Top = 97
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = ButtonCancelarClick
  end
  object ButtonOK: TButton
    Left = 293
    Top = 97
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = ButtonOKClick
  end
  object DataSource: TDataSource
    Left = 32
    Top = 96
  end
end
