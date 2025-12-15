object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 240
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFooter: TPanel
    Left = 0
    Top = 199
    Width = 518
    Height = 41
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      518
      41)
    object btnSair: TButton
      Left = 439
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnNovo: TButton
      Left = 358
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btnNovoClick
    end
    object btnAlterar: TButton
      Left = 277
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 196
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Excluir'
      TabOrder = 3
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 199
    Align = alClient
    TabOrder = 1
    object lblCod: TLabel
      Left = 16
      Top = 17
      Width = 22
      Height = 16
      Caption = 'Cod'
    end
    object lblNome: TLabel
      Left = 79
      Top = 17
      Width = 33
      Height = 16
      Caption = 'Nome'
    end
    object lblValor: TLabel
      Left = 414
      Top = 17
      Width = 30
      Height = 16
      Caption = 'Valor'
    end
    object edtCod: TEdit
      Left = 16
      Top = 39
      Width = 57
      Height = 24
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 79
      Top = 39
      Width = 329
      Height = 24
      TabOrder = 1
    end
    object edtValor: TEdit
      Left = 414
      Top = 39
      Width = 81
      Height = 24
      TabOrder = 2
    end
  end
end
