unit View.Cadastro.Produto;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls, DAO.Produto;

type
  TOperacao = (opNovo, opSalvar, opAlterar, opExcluir);
  TfrmCadProduto = class(TForm)
    pnlFooter: TPanel;
    btnSair: TButton;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    edtCod: TEdit;
    lblCod: TLabel;
    pnlContent: TPanel;
    edtNome: TEdit;
    lblNome: TLabel;
    edtValor: TEdit;
    lblValor: TLabel;
    procedure SalvarProduto;
    procedure ResetarCampos;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    FOperacao : TOperacao;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses
  Model.Produto, Controller.Cadastro.Produto;

{$R *.dfm}

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
var
  objContollerProduto: TProdutoController;
begin
  objContollerProduto := TProdutoController.Create;
  try
    if FOperacao = opSalvar then
    begin
        SalvarProduto;
        FOperacao := opNovo;
        ResetarCampos;
        exit;
    end;

    if FOperacao = opNovo then
    begin
      FOperacao := opSalvar;
      ResetarCampos;
      edtCod.Text := IntToStr(objContollerProduto.BuscarNovoCodigo);
    end;
  finally
    objContollerProduto.Free;
  end;

end;

procedure TfrmCadProduto.btnSairClick(Sender: TObject);
begin
  Self.Free;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  FOperacao := opNovo;
  ResetarCampos;
end;

procedure TfrmCadProduto.SalvarProduto;
var
  objProduto : TProduto;
  objContollerProduto : TProdutoController;
begin
  objProduto := TProduto.Create;
  objContollerProduto := TProdutoController.Create;

  Try
    objProduto.Codigo := StrToInt(edtCod.Text);
    objProduto.Descricao := edtNome.Text;
    objProduto.Valor := StrToCurr(edtValor.Text);

    if objContollerProduto.Salvar(objProduto) then
      ShowMessage('Produto Salvo com Sucesso');

  Finally
    objProduto.Free;
    objContollerProduto.Free;
  End;

end;

procedure TfrmCadProduto.ResetarCampos;
begin
  if FOperacao = opNovo then
  begin
    btnNovo.Caption := 'Novo';
    edtCod.Text := EmptyStr;
    edtNome.Text := EmptyStr;
    edtValor.Text := EmptyStr;

    edtCod.Enabled := False;
    edtNome.Enabled := False;
    edtValor.Enabled := False;
  end
  else if FOperacao = opSalvar then
  begin
    btnNovo.Caption := 'Salvar';
    edtCod.Text := EmptyStr;
    edtNome.Text := EmptyStr;
    edtValor.Text := EmptyStr;

    edtCod.Enabled := True;
    edtNome.Enabled := True;
    edtValor.Enabled := True;
  end;
end;

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
var
  objContollerProduto: TProdutoController;
begin
  objContollerProduto := TProdutoController.Create;
  try
    ShowMessage('Next: '+IntToStr(objContollerProduto.BuscarNovoCodigo));
  finally
    objContollerProduto.Free;
  end;
end;

end.
