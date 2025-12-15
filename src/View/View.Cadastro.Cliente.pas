unit View.Cadastro.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Model.Cliente, ACBrBase, ACBrSocket, ACBrCEP;

type
  TfrmCadCliente = class(TForm)
    pnlFooter: TPanel;
    pnlContent: TPanel;
    edtNomeCliente: TEdit;
    edtEnderecoCEP: TEdit;
    edtEnderecoRua: TEdit;
    btnSair: TButton;
    btnSalvar: TButton;
    btnPadrao: TButton;
    lblNome: TLabel;
    lblEnderecoCEP: TLabel;
    lblEnderecoRua: TLabel;
    edtEnderecoNumero: TEdit;
    lblEnderecoNumero: TLabel;
    edtEnderecoBairro: TEdit;
    lblEnderecoBairro: TLabel;
    edtEnderecoCidade: TEdit;
    lblEnderecoCidade: TLabel;
    lblEnderecoUF: TLabel;
    btnBuscarCEP: TBitBtn;
    edtEnderecoUF: TEdit;
    ACBrCEP1: TACBrCEP;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPadraoClick(Sender: TObject);
    procedure btnBuscarCEPClick(Sender: TObject);
    procedure edtEnderecoCEPKeyPress(Sender: TObject; var Key: Char);
  private
    FClienteInterno: TCliente;
    Procedure SalvarCliente;
    procedure AtualizarClientes;
  public
    { Public declarations }
    property ClienteCriado: TCliente read FClienteInterno;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.AtualizarClientes;
begin
  with FClienteInterno do
  begin
    edtNomeCliente.Text := Nome;
    edtEnderecoCEP.Text := CEP_Codigo;
    edtEnderecoRua.Text := CEP_Endereco;
    edtEnderecoNumero.Text := CEP_Numero;
    edtEnderecoBairro.Text := CEP_Bairro;
    edtEnderecoCidade.Text := CEP_Cidade;
    edtEnderecoUF.Text := CEP_UF;
  end;
end;

procedure TfrmCadCliente.btnBuscarCEPClick(Sender: TObject);
var
  LCep : String;
begin
  LCep := edtEnderecoCEP.Text;

  if ACBrCEP1.Enderecos.Count = 0 then
  begin
    ACBrCEP1.BuscarPorCEP(LCep);

    With ACBrCEP1.Enderecos[0] do
    begin
      edtEnderecoCEP.Text := CEP;
      edtEnderecoRua.Text := Logradouro;
      edtEnderecoBairro.Text := Bairro;
      edtEnderecoCidade.Text := Municipio;
      edtEnderecoUF.Text := UF;
    end;

    ACBrCEP1.Enderecos.Clear;
  end;
end;

procedure TfrmCadCliente.btnPadraoClick(Sender: TObject);
begin
  FClienteInterno := FClienteInterno.ClientePadrao;
  AtualizarClientes;
end;

procedure TfrmCadCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCliente.btnSalvarClick(Sender: TObject);
begin
  SalvarCliente;
end;

procedure TfrmCadCliente.edtEnderecoCEPKeyPress(Sender: TObject; var Key: Char);
begin
  // Aceita somente número, ponto e dash
  if not (Key in ['0'..'9', #13, #8, #45, #46]) then
    Key := #0;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  FClienteInterno := TCliente.Create;
end;

procedure TfrmCadCliente.SalvarCliente;
var
LCliente : TCliente;
begin
  LCliente := TCliente.Create;
  try
    with LCliente do
    begin
      Nome := edtNomeCliente.Text;
      CEP_Codigo := edtEnderecoCEP.Text;
      CEP_Endereco := edtEnderecoRua.Text;
      CEP_Numero := edtEnderecoNumero.Text;
      CEP_Bairro := edtEnderecoBairro.Text;
      CEP_Cidade := edtEnderecoCidade.Text;
      CEP_UF := edtEnderecoUF.Text;
    end;

    FClienteInterno := LCliente;
    ModalResult := mrOK;

  except
    ShowMessage('Erro ao preencher dados. Verifique os campos.');
    ModalResult := mrNone;
  end;
end;

end.
