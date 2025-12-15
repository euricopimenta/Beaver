object frmRelVendas: TfrmRelVendas
  Left = 0
  Top = 0
  Caption = 'frmRelVendas'
  ClientHeight = 789
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object RLReport1: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dtsVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 43
      BandType = btHeader
      object rlblTitulo: TRLLabel
        Left = 296
        Top = 12
        Width = 121
        Height = 16
        Caption = 'Relat'#243'rio de Vendas'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 24
      object RLDBText1: TRLDBText
        Left = 3
        Top = 7
        Width = 84
        Height = 16
        DataField = 'COD_VENDA'
        DataSource = dtsVendas
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 90
        Top = 7
        Width = 327
        Height = 16
        DataField = 'CLIENTE'
        DataSource = dtsVendas
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 423
        Top = 7
        Width = 95
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_TOTAL'
        DataSource = dtsVendas
        DisplayMask = 'R$ #,###.00'
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 526
        Top = 7
        Width = 90
        Height = 16
        Alignment = taRightJustify
        DataField = 'DATA_VENDA'
        DataSource = dtsVendas
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 16
      BandType = btTitle
      Color = clCream
      ParentColor = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 3
        Top = 1
        Width = 81
        Height = 16
        AutoSize = False
        Caption = 'Venda#'
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 90
        Top = 1
        Width = 327
        Height = 16
        AutoSize = False
        Caption = 'Cliente'
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 423
        Top = 1
        Width = 95
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tot. Venda'
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 526
        Top = 1
        Width = 90
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Data'
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 24
      BandType = btColumnFooter
      Color = clCream
      ParentColor = False
      Transparent = False
      object RLDBResult1: TRLDBResult
        Left = 354
        Top = 5
        Width = 166
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        ComputeNulls = False
        DataField = 'VALOR_TOTAL'
        DataSource = dtsVendas
        DisplayMask = 'R$ #,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
  end
  object Qry: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from vendas v')
    SQLConnection = DMConexao.SQLConnection
    Left = 696
    Top = 56
    object QryCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object QryCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object QryCEP_CODIGO: TStringField
      FieldName = 'CEP_CODIGO'
      Size = 10
    end
    object QryCEP_RUA: TStringField
      FieldName = 'CEP_RUA'
      Size = 50
    end
    object QryCEP_NUM: TStringField
      FieldName = 'CEP_NUM'
      Size = 10
    end
    object QryCEP_BAIRRO: TStringField
      FieldName = 'CEP_BAIRRO'
    end
    object QryCEP_CIDADE: TStringField
      FieldName = 'CEP_CIDADE'
    end
    object QryCEP_UF: TStringField
      FieldName = 'CEP_UF'
      Size = 2
    end
    object QryVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object QryDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
    end
  end
  object dtsVendas: TDataSource
    DataSet = Qry
    Left = 630
    Top = 54
  end
end
