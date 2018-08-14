object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 277
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonNovo: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 0
    OnClick = ButtonNovoClick
  end
  object ButtonEditar: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 1
    OnClick = ButtonEditarClick
  end
  object ButtonExcluir: TButton
    Left = 170
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = ButtonExcluirClick
  end
  object Grid: TDBGrid
    Left = 8
    Top = 39
    Width = 482
    Height = 230
    DataSource = DataSource
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ButtonPesquisar: TButton
    Left = 415
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 4
    OnClick = ButtonPesquisarClick
  end
  object DataSource: TDataSource
    Left = 224
    Top = 120
  end
end
