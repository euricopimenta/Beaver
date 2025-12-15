unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMainMenu = class(TForm)
    MainMenu1: TMainMenu;
    opcCadastro: TMenuItem;
    Estoque1: TMenuItem;
    Produtos1: TMenuItem;
    Cliente1: TMenuItem;
    Venda1: TMenuItem;
    Relatrio1: TMenuItem;
    Vendas1: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Sair1: TMenuItem;
    ImageList1: TImageList;
    pnlContent: TPanel;
    pnlFooter: TPanel;
    procedure Cliente1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

uses
  View.Cadastro.Produto,
  View.Estoque.Venda,
  View.Cadastro.Cliente,
  Report.Vendas, Report.Filtro.Vendas;

{$R *.dfm}

procedure TfrmMainMenu.Cliente1Click(Sender: TObject);
begin
  frmCadCliente.Show;
end;

procedure TfrmMainMenu.Produtos1Click(Sender: TObject);
var
CadProduto :TfrmCadProduto;
begin
  CadProduto := TfrmCadProduto.Create(Self);
  CadProduto.Show;
end;

procedure TfrmMainMenu.Sair1Click(Sender: TObject);
begin
  if MessageDlg('Fechar a aplicação ?',mtConfirmation,[mbYes, mbNo], 0) = mrYes then
    Application.Terminate;

end;

procedure TfrmMainMenu.Venda1Click(Sender: TObject);
var
  FormVenda : TfrmCadVenda;
begin
  FormVenda := TfrmCadVenda.Create(Self);
  FormVenda.Show;
end;

procedure TfrmMainMenu.Vendas1Click(Sender: TObject);
var
  FiltroRelVendas :TfrmRelVendaFiltro;
begin
  FiltroRelVendas := TfrmRelVendaFiltro.Create(Self);
  FiltroRelVendas.Show;
end;


end.
