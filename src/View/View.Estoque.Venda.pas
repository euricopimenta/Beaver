unit View.Estoque.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, Model.Cliente;

type
  TOperacao = (opNovo, opSalvar, opAlterar, opExcluir);

  TfrmCadVenda = class(TForm)
    pnlFooter: TPanel;
    btnSair: TButton;
    btnSalvar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    pnlContent: TPanel;
    pnlLancamentos: TPanel;
    DBGVendaItens: TDBGrid;
    edtCodItem: TEdit;
    lblCodItem: TLabel;
    edtDescricao: TEdit;
    lblNomeProduto: TLabel;
    edtQtde: TEdit;
    lblQuantidade: TLabel;
    edtValorItem: TEdit;
    lblValorItem: TLabel;
    edtValorTotal: TEdit;
    lbltotalItem: TLabel;
    btnAdd: TBitBtn;
    btnRemover: TBitBtn;
    Panel1: TPanel;
    lblTotal: TLabel;
    lblItens: TLabel;
    lblValorTotal: TLabel;
    lblQuantItens: TLabel;
    pnlHeader: TPanel;
    lblNumVenda: TLabel;
    Label4: TLabel;
    cdsVenda: TClientDataSet;
    cdsVendacodVenda: TIntegerField;
    cdsVendacodProduto: TIntegerField;
    cdsVendaQTDE: TIntegerField;
    cdsVendavalor: TFloatField;
    cdsVendavalorTotal: TFloatField;
    dtsVenda: TDataSource;
    cdsVendanomeProduto: TStringField;
    pnlCliente: TPanel;
    btnAddCliente: TButton;
    lblClienteNome: TLabel;
    lblClienteRua: TLabel;
    lblClienteCEP: TLabel;
    lblClienteNumero: TLabel;
    lblClienteBairro: TLabel;
    lblClienteCidade: TLabel;
    lblClienteUF: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorItemKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodItemKeyPress(Sender: TObject; var Key: Char);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCodItemExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtQtdeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClienteClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FCliente : TCliente;
    FOperacao : TOperacao;
    procedure InsereNoDataSet;
    procedure LimparCamposItens;
    procedure LimparFormulario;
    procedure AtualizaTotalVenda;
    procedure AtualizaTotalItem;
    procedure AtualizaDadosCliente;
    procedure SalvarVenda;
  public
    { Public declarations }
  end;

var
  frmCadVenda: TfrmCadVenda;

implementation

uses
  Model.Venda, Model.VendaItem, System.Generics.Collections, Controller.Venda, Controller.Cadastro.Produto,
  Model.Produto, View.Cadastro.Cliente;

{$R *.dfm}

procedure TfrmCadVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCliente.Free;
end;

procedure TfrmCadVenda.FormShow(Sender: TObject);
begin
  FCliente := FCliente.ClientePadrao;
  AtualizaDadosCliente;
end;

procedure TfrmCadVenda.btnAddClick(Sender: TObject);
begin
  InsereNoDataSet;
  LimparCamposItens;
  AtualizaTotalVenda;
end;

procedure TfrmCadVenda.btnAddClienteClick(Sender: TObject);
var
  FrmCadCliente: TFrmCadCliente;
begin
  FrmCadCliente := TFrmCadCliente.Create(Application);
  try
    FrmCadCliente.Position := poOwnerFormCenter;
    if FrmCadCliente.ShowModal = mrOK then
    begin
      FCliente := FrmCadCliente.ClienteCriado;
      AtualizaDadosCliente;
    end;
  finally
    FrmCadCliente.Free;
  end;
end;

procedure TfrmCadVenda.btnExcluirClick(Sender: TObject);
begin
  LimparFormulario;
end;

procedure TfrmCadVenda.btnRemoverClick(Sender: TObject);
begin
  if not cdsVenda.IsEmpty then
  begin
    cdsVenda.Delete;
    AtualizaTotalVenda;
    edtCodItem.SetFocus;
  end;
end;

procedure TfrmCadVenda.InsereNoDataSet;
begin
  cdsVenda.Append;
  cdsVenda.FieldByName('codProduto').AsInteger := StrToInt(edtCodItem.Text);
  cdsVenda.FieldByName('nomeProduto').AsString := Trim(edtDescricao.Text);
  cdsVenda.FieldByName('QTDE').AsInteger := StrToInt(edtQtde.Text);
  cdsVenda.FieldByName('valorProduto').AsFloat := StrToFloat(edtValorItem.Text);
  cdsVenda.FieldByName('valorTotal').AsFloat := StrToFloat(edtValorTotal.Text);
  cdsVenda.Post;
end;

procedure TfrmCadVenda.LimparCamposItens;
begin
  edtCodItem.Clear;
  edtDescricao.Clear;
  edtQtde.Clear;
  edtValorItem.Clear;
  edtValorTotal.Clear;
  edtCodItem.SetFocus;
end;

procedure TfrmCadVenda.LimparFormulario;
begin
  if Assigned(cdsVenda) then
  begin
    cdsVenda.DisableControls;
    try
      cdsVenda.EmptyDataSet;
      DBGVendaItens.Update;
    finally
      cdsVenda.EnableControls;
    end;
  end;

  AtualizaTotalVenda;
  FCliente := FCliente.ClientePadrao;
  AtualizaDadosCliente;
  edtCodItem.SetFocus;
end;

procedure TfrmCadVenda.SalvarVenda;
var
  LVenda : TVenda;
  LVendaController : TVendaController;
  LItem : TVendaItem;
  LItensLista : TObjectlist<TVendaItem>;
begin
  LVenda := TVenda.Create;
  LVendaController := TVendaController.Create;
  LItensLista := TObjectList<TVendaItem>.Create;
  try
    //Preenche dados Venda
    LVenda.Cliente := FCliente;
    LVenda.ValorTotal := cdsVenda.Aggregates[0].Value;

    //Preenche TObejectList dos Itens
    cdsVenda.DisableControls;
    cdsVenda.First;
    while not cdsVenda.Eof do
      begin
        LItem := TVendaItem.Create;
        try
          LItem.CodVendaItem := LVenda.Codigo;
          LItem.CodProduto := cdsVenda.FieldByName('codProduto').AsInteger;
          LItem.Quantidade := cdsVenda.FieldByName('QTDE').AsInteger;
          LItem.ValUnitario:= cdsVenda.FieldByName('valorProduto').AsFloat;
          LItem.ValTotal   := cdsVenda.FieldByName('valorTotal').AsFloat;

          LItensLista.Add(LItem);
        finally
          cdsVenda.EnableControls;
        end;

        cdsVenda.Next;
      end;

  finally
    LItensLista.Free;
    LVenda.Free;
    LVendaController.Free;
    ShowMessage('Venda Finalizada !');
  end;

end;

procedure TfrmCadVenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadVenda.btnSalvarClick(Sender: TObject);
begin
  if dtsVenda.DataSet.RecordCount = 0 then
    raise Exception.Create('Venda sem itens');

  SalvarVenda;
  LimparFormulario;
end;

procedure TfrmCadVenda.AtualizaDadosCliente;
begin
  with FCliente do
  begin
    lblClienteNome.Caption := Nome;
    lblClienteCEP.Caption := CEP_Codigo;
    lblClienteRua.Caption := CEP_Endereco;
    lblClienteNumero.Caption := CEP_Numero;
    lblClienteBairro.Caption := CEP_Bairro;
    lblClienteCidade.Caption := CEP_Cidade;
    lblClienteUF.Caption := CEP_UF;
  end;
end;

procedure TfrmCadVenda.AtualizaTotalItem;
var
  Total: double;
begin
  Total := StrToInt(edtQtde.Text) * StrToFloat(edtValorItem.Text);
  edtValorTotal.Text := FloatToStr(Total);
end;

procedure TfrmCadVenda.AtualizaTotalVenda;
var
  total : string;
begin
  if cdsVenda.RecordCount > 0
    then total := FormatCurr('R$ ###,###,##0.00', cdsVenda.Aggregates[0].Value)
  else
    total := 'R$ 0,00';

  lblValorTotal.Caption := Total;
  lblQuantItens.Caption := IntToStr(cdsVenda.RecordCount);
end;


{$REGION ' >> Validadore e Formatadores dos Campos'}
procedure TfrmCadVenda.edtCodItemExit(Sender: TObject);
  var
    LControllerProduto : TProdutoController;
    LProduto : TProduto;
    LCodProduto : Integer;
  begin
    if not (edtCodItem.Text = EmptyStr) then
    begin
      LControllerProduto := TProdutoController.Create;
      LProduto := TProduto.Create;
      LCodProduto := StrToint(edtCodItem.Text);
      try
        LProduto := LControllerProduto.BuscarPorCodigo(LCodProduto);

        //Preenche os campos apartir do código
        edtDescricao.Text := LProduto.Descricao;
        edtValorItem.Text := CurrToStr( LProduto.Valor);

      finally
        LProduto.Free;
        LControllerProduto.Free;
      end;
    end;
  end;

procedure TfrmCadVenda.edtCodItemKeyPress(Sender: TObject; var Key: Char);
  begin
    // Aceita somente números
    if not (Key in ['0'..'9', #13, #8]) then
      Key := #0;
  end;

  procedure TfrmCadVenda.edtQtdeExit(Sender: TObject);
  begin

      AtualizaTotalItem;
  end;

procedure TfrmCadVenda.edtQtdeKeyPress(Sender: TObject; var Key: Char);
  begin
    // Aceita somente números
    if not (Key in ['0'..'9', #13, #8]) then
      Key := #0;
  end;

  procedure TfrmCadVenda.edtValorItemKeyPress(Sender: TObject; var Key: Char);
  begin
    // Aceita somente número, ponto e vírgula
    if not (Key in ['0'..'9', #13, #8, #44, #46]) then
      Key := #0;
  end;

{$ENDREGION}

end.
