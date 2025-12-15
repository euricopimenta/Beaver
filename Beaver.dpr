program Beaver;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMainMenu},
  View.Cadastro.Cliente in 'src\View\View.Cadastro.Cliente.pas' {frmCadCliente},
  View.Cadastro.Produto in 'src\View\View.Cadastro.Produto.pas' {frmCadProduto},
  View.Estoque.Venda in 'src\View\View.Estoque.Venda.pas' {frmCadVenda},
  Model.Produto in 'src\Model\Model.Produto.pas',
  Model.Venda in 'src\Model\Model.Venda.pas',
  Model.Cliente in 'src\Model\Model.Cliente.pas',
  Model.VendaItem in 'src\Model\Model.VendaItem.pas',
  DM.Conexao in 'src\DM.Conexao.pas' {DMConexao: TDataModule},
  Controller.Cadastro.Produto in 'src\Controller\Controller.Cadastro.Produto.pas',
  DAO.Produto in 'src\DAO\DAO.Produto.pas',
  DAO.Venda in 'src\DAO\DAO.Venda.pas',
  Controller.Venda in 'src\Controller\Controller.Venda.pas',
  Report.Vendas in 'src\View\Reports\Report.Vendas.pas' {frmRelVendas},
  Report.Filtro.Vendas in 'src\View\Reports\Report.Filtro.Vendas.pas' {frmRelVendaFiltro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
