unit Controller.Cadastro.Produto;

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
    function BuscarNovoCodigo : Integer;
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

  try
     Result := FProdutoDAO.Inserir(AProduto);

  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;


function TProdutoController.BuscarNovoCodigo: Integer;
var
  DAOProduto : TProdutoDAO;
begin
  DAOProduto := TProdutoDAO.Create;
  try
    result := DAOProduto.BuscarNovoCodigo;
  finally
    DAOProduto.Free;
  end;
end;

function TProdutoController.BuscarPorCodigo(ACodigo: Integer): TProduto;
var
  DAOProduto : TProdutoDAO;
begin
  if ACodigo <= 0 then
    raise Exception.Create('Código do produto inválido.');

  DAOProduto := TProdutoDAO.Create;
  try
    result := DAOProduto.BuscarPorCodigo(ACodigo);
  finally
    DAOProduto.Free;
  end;

end;


end.
