object frmMainMenu: TfrmMainMenu
  Left = 0
  Top = 0
  Caption = 'Beaver'
  ClientHeight = 649
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 630
    Width = 784
    Height = 19
    Panels = <>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 784
    Height = 34
    AutoSize = True
    ButtonHeight = 32
    ButtonWidth = 32
    Caption = 'ToolBar1'
    Color = clSilver
    Customizable = True
    DrawingStyle = dsGradient
    Flat = False
    ParentColor = False
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 32
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 64
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 2
    end
    object ToolButton4: TToolButton
      Left = 96
      Top = 0
      Caption = 'ToolButton4'
      ImageIndex = 3
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 34
    Width = 784
    Height = 555
    Align = alClient
    TabOrder = 2
    ExplicitLeft = -8
    ExplicitTop = 58
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 589
    Width = 784
    Height = 41
    Align = alBottom
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 736
    Top = 48
    object opcCadastro: TMenuItem
      Caption = 'Cadastro'
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
      object Cliente1: TMenuItem
        Caption = 'Clientes'
        OnClick = Cliente1Click
      end
    end
    object Estoque1: TMenuItem
      Caption = 'Estoque'
      object Venda1: TMenuItem
        Caption = 'Vendas'
        OnClick = Venda1Click
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 736
    Top = 96
  end
end
