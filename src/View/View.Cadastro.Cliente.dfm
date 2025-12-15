object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de clientes'
  ClientHeight = 253
  ClientWidth = 493
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
  object pnlFooter: TPanel
    Left = 0
    Top = 212
    Width = 493
    Height = 41
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      493
      41)
    object btnSair: TButton
      Left = 414
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnSalvar: TButton
      Left = 333
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnPadrao: TButton
      Left = 252
      Top = 2
      Width = 75
      Height = 35
      Anchors = [akRight, akBottom]
      Caption = 'Padr'#227'o'
      TabOrder = 2
      OnClick = btnPadraoClick
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 212
    Align = alClient
    TabOrder = 1
    object lblNome: TLabel
      Left = 16
      Top = 5
      Width = 33
      Height = 16
      Caption = 'Nome'
    end
    object lblEnderecoCEP: TLabel
      Left = 343
      Top = 5
      Width = 22
      Height = 16
      Caption = 'CEP'
    end
    object lblEnderecoRua: TLabel
      Left = 16
      Top = 59
      Width = 22
      Height = 16
      Caption = 'Rua'
    end
    object lblEnderecoNumero: TLabel
      Left = 414
      Top = 59
      Width = 45
      Height = 16
      Caption = 'N'#250'mero'
    end
    object lblEnderecoBairro: TLabel
      Left = 16
      Top = 112
      Width = 34
      Height = 16
      Caption = 'Bairro'
    end
    object lblEnderecoCidade: TLabel
      Left = 191
      Top = 112
      Width = 39
      Height = 16
      Caption = 'Cidade'
    end
    object lblEnderecoUF: TLabel
      Left = 287
      Top = 112
      Width = 15
      Height = 16
      Caption = 'UF'
    end
    object edtNomeCliente: TEdit
      Left = 16
      Top = 27
      Width = 321
      Height = 24
      TabOrder = 0
    end
    object edtEnderecoCEP: TEdit
      Left = 343
      Top = 27
      Width = 98
      Height = 24
      TabOrder = 1
      OnKeyPress = edtEnderecoCEPKeyPress
    end
    object edtEnderecoRua: TEdit
      Left = 16
      Top = 81
      Width = 392
      Height = 24
      TabOrder = 2
    end
    object edtEnderecoNumero: TEdit
      Left = 414
      Top = 81
      Width = 57
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtEnderecoBairro: TEdit
      Left = 16
      Top = 134
      Width = 169
      Height = 24
      TabOrder = 4
    end
    object edtEnderecoCidade: TEdit
      Left = 191
      Top = 134
      Width = 90
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object btnBuscarCEP: TBitBtn
      Left = 447
      Top = 26
      Width = 24
      Height = 25
      TabOrder = 6
      OnClick = btnBuscarCEPClick
    end
    object edtEnderecoUF: TEdit
      Left = 287
      Top = 134
      Width = 40
      Height = 24
      MaxLength = 2
      TabOrder = 7
    end
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsOpenCep
    PesquisarIBGE = True
    Left = 440
    Top = 128
  end
end
