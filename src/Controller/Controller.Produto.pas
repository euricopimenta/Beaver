unit Controller.Produto;

interface
uses
  System.SysUtils,
  Model.Produto,
  System.Generics.Collections,
  DAO.Produto;

type
  TProdutoController = class
  private
    FProdutoDAO: TProdutoDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(AProduto: TProduto): Boolean;
    function BuscarPorCodigo(ACodigo: Integer): TProduto;
    function Deletar(ACodigo: Integer): Boolean;

    function ListarTodos: TObjectList<TProduto>;
  end;

implementation

constructor TProdutoController.Create;
begin
  inherited Create;
  FProdutoDAO := TProdutoDAO.Create;
end;

destructor TProdutoController.Destroy;
begin
  FProdutoDAO.Free;
  inherited Destroy;
end;

function TProdutoController.Salvar(AProduto: TProduto): Boolean;
begin
  if (AProduto.Descricao = '') or (AProduto.Valor <= 0) then
  begin
    raise Exception.Create('Descrição e Valor são obrigatórios.');
    Result := False;
    Exit;
  end;

  // Lógica de persistência: Chamar o DAO para salvar no Firebird
  try

    if AProduto.Codigo = 0 then
     Result := FProdutoDAO.Inserir(AProduto)
    else
     Result := FProdutoDAO.Atualizar(AProduto);

  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;


function TProdutoController.BuscarPorCodigo(ACodigo: Integer): TProduto;
begin

  if ACodigo <= 0 then
    raise Exception.Create('Código do produto inválido.');

  // Exemplo conceitual:
  // Result := FProdutoDAO.Buscar(Codigo);

  // Exemplo Mock: Se não encontrou, retorna nil
  if ACodigo = 999 then
    Result := nil
  else
  begin
    // Retorna um objeto TProduto carregado do banco de dados (exemplo)
    Result := TProduto.Create;
    Result.Codigo := ACodigo;
    Result.Descricao := 'Produto Carregado';
    Result.Valor := 50.00;
  end;
end;

// -----------------------------------------------------------------

// Lógica para Deletar um Produto
function TProdutoController.Deletar(ACodigo: Integer): Boolean;
begin
  // AQUI ENTRA A LÓGICA DE NEGÓCIO (Ex: verificar se o produto está em alguma venda)
  // if FProdutoDAO.EstaEmUso(Codigo) then
  //   raise Exception.Create('Não é possível deletar, produto em uso.');

  // Exemplo conceitual:
  // Result := FProdutoDAO.Deletar(Codigo);
  Result := True;
end;

// -----------------------------------------------------------------

// Lógica para Listar todos os Produtos
function TProdutoController.ListarTodos: TObjectList<TProduto>;
begin
//
end;


end.
