object frmRelVendaFiltro: TfrmRelVendaFiltro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gerar Relat'#243'rio de Vendas'
  ClientHeight = 173
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDataInicial: TLabel
    Left = 24
    Top = 21
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object lblDataFinal: TLabel
    Left = 160
    Top = 21
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 132
    Width = 279
    Height = 41
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      279
      41)
    object btnSair: TButton
      Left = 200
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnGerar: TButton
      Left = 119
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Gerar'
      TabOrder = 1
      OnClick = btnGerarClick
    end
  end
  object edtDataInicial: TDateTimePicker
    Left = 24
    Top = 40
    Width = 97
    Height = 21
    Date = 46005.000000000000000000
    Time = 0.748122557866736300
    TabOrder = 1
  end
  object edtDataFinal: TDateTimePicker
    Left = 160
    Top = 40
    Width = 97
    Height = 21
    Date = 46005.000000000000000000
    Time = 0.748122557866736300
    TabOrder = 2
  end
end
