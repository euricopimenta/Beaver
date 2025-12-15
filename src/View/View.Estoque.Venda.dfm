object frmCadVenda: TfrmCadVenda
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 487
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 446
    Width = 700
    Height = 41
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      700
      41)
    object btnSair: TButton
      Left = 621
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnSalvar: TButton
      Left = 540
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnAlterar: TButton
      Left = 459
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Alterar'
      TabOrder = 2
    end
    object btnExcluir: TButton
      Left = 378
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 68
    Width = 700
    Height = 337
    Align = alClient
    TabOrder = 1
    object pnlLancamentos: TPanel
      Left = 1
      Top = 1
      Width = 698
      Height = 64
      Align = alTop
      TabOrder = 0
      DesignSize = (
        698
        64)
      object lblCodItem: TLabel
        Left = 3
        Top = 13
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object lblNomeProduto: TLabel
        Left = 63
        Top = 13
        Width = 46
        Height = 13
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Descri'#231#227'o'
      end
      object lblQuantidade: TLabel
        Left = 383
        Top = 13
        Width = 56
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Quantidade'
        ExplicitTop = 77
      end
      object lblValorItem: TLabel
        Left = 445
        Top = 13
        Width = 44
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Valor. Un'
        ExplicitTop = 77
      end
      object lbltotalItem: TLabel
        Left = 505
        Top = 13
        Width = 49
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Item'
      end
      object edtCodItem: TEdit
        Left = 3
        Top = 32
        Width = 54
        Height = 21
        TabOrder = 0
        OnExit = edtCodItemExit
        OnKeyPress = edtCodItemKeyPress
      end
      object edtDescricao: TEdit
        Left = 63
        Top = 32
        Width = 314
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        Enabled = False
        TabOrder = 1
      end
      object edtQtde: TEdit
        Left = 383
        Top = 32
        Width = 54
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 2
        OnExit = edtQtdeExit
        OnKeyPress = edtQtdeKeyPress
      end
      object edtValorItem: TEdit
        Left = 445
        Top = 32
        Width = 54
        Height = 21
        Anchors = [akRight, akBottom]
        Enabled = False
        TabOrder = 3
        OnKeyPress = edtValorItemKeyPress
      end
      object edtValorTotal: TEdit
        Left = 505
        Top = 32
        Width = 68
        Height = 21
        Anchors = [akRight, akBottom]
        Enabled = False
        TabOrder = 4
      end
      object btnAdd: TBitBtn
        Left = 579
        Top = 13
        Width = 52
        Height = 42
        Anchors = [akRight, akBottom]
        Caption = 'Adicionar'
        TabOrder = 5
        OnClick = btnAddClick
      end
      object btnRemover: TBitBtn
        Left = 637
        Top = 13
        Width = 54
        Height = 42
        Anchors = [akRight, akBottom]
        Caption = 'Remover'
        TabOrder = 6
        OnClick = btnRemoverClick
      end
    end
    object DBGVendaItens: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 68
      Width = 692
      Height = 265
      Align = alClient
      DataSource = dtsVenda
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codVenda'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'codProduto'
          Title.Caption = 'C'#243'digo'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nomeProduto'
          Title.Caption = 'Descri'#231#227'o'
          Width = 314
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorProduto'
          Title.Caption = 'Valor Un.'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorTotal'
          Title.Caption = 'Total Item'
          Width = 73
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 700
    Height = 41
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 2
    DesignSize = (
      700
      41)
    object lblTotal: TLabel
      Left = 540
      Top = 6
      Width = 28
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Total:'
    end
    object lblItens: TLabel
      Left = 378
      Top = 6
      Width = 29
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Itens:'
    end
    object lblValorTotal: TLabel
      Left = 580
      Top = 6
      Width = 112
      Height = 29
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlBottom
    end
    object lblQuantItens: TLabel
      Left = 413
      Top = 6
      Width = 112
      Height = 29
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 68
    Align = alTop
    TabOrder = 3
    object lblNumVenda: TLabel
      Left = 4
      Top = 9
      Width = 41
      Height = 13
      Caption = 'Venda #'
    end
    object Label4: TLabel
      Left = 51
      Top = 9
      Width = 40
      Height = 13
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlCliente: TPanel
      AlignWithMargins = True
      Left = 173
      Top = 4
      Width = 523
      Height = 60
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 0
      object lblClienteNome: TLabel
        Left = 8
        Top = 5
        Width = 505
        Height = 13
        AutoSize = False
        Caption = 'Consumidor Final'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblClienteRua: TLabel
        Left = 8
        Top = 24
        Width = 449
        Height = 13
        AutoSize = False
        Caption = 'Nome da Rua'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblClienteCEP: TLabel
        Left = 8
        Top = 42
        Width = 73
        Height = 13
        AutoSize = False
        Caption = '00.000-000'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblClienteNumero: TLabel
        Left = 463
        Top = 24
        Width = 50
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '000'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblClienteBairro: TLabel
        Left = 87
        Top = 43
        Width = 229
        Height = 14
        AutoSize = False
        Caption = 'Centro'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblClienteCidade: TLabel
        Left = 322
        Top = 42
        Width = 154
        Height = 14
        AutoSize = False
        Caption = 'Cidade'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblClienteUF: TLabel
        Left = 482
        Top = 42
        Width = 31
        Height = 14
        AutoSize = False
        Caption = 'UF'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
    object btnAddCliente: TButton
      Left = 107
      Top = 3
      Width = 60
      Height = 60
      Caption = 'Adicionar Cliente'
      TabOrder = 1
      WordWrap = True
      OnClick = btnAddClienteClick
    end
  end
  object cdsVenda: TClientDataSet
    PersistDataPacket.Data = {
      930000009619E0BD010000001800000006000000000003000000930008636F64
      56656E646104000100000000000A636F6450726F6475746F0400010000000000
      0B6E6F6D6550726F6475746F0100490000000100055749445448020002001400
      045154444504000100000000000C76616C6F7250726F6475746F080004000000
      00000A76616C6F72546F74616C08000400000000000000}
    Active = True
    Aggregates = <
      item
        Active = True
        AggregateName = 'totalVenda'
        Expression = 'sum(valorTotal)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    Left = 608
    Top = 144
    object cdsVendacodVenda: TIntegerField
      FieldName = 'codVenda'
    end
    object cdsVendacodProduto: TIntegerField
      FieldName = 'codProduto'
    end
    object cdsVendanomeProduto: TStringField
      FieldName = 'nomeProduto'
    end
    object cdsVendaQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsVendavalor: TFloatField
      FieldName = 'valorProduto'
    end
    object cdsVendavalorTotal: TFloatField
      FieldName = 'valorTotal'
    end
  end
  object dtsVenda: TDataSource
    DataSet = cdsVenda
    Left = 648
    Top = 144
  end
end
