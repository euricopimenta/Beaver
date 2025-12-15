unit DAO.Produto;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.SqlExpr,
  Model.Produto,
  DM.Conexao,
  System.Generics.Collections;

type
  TProdutoDAO = class
  private
    FDM: TDMConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function Inserir(Produto: TProduto): Boolean;
    function Atualizar(Produto: TProduto): Boolean;
    function Deletar(Codigo: Integer): Boolean;
    function BuscarPorCodigo(Codigo: Integer): TProduto;
    function BuscarNovoCodigo : Integer;
    function ListarTodos: TObjectList<TProduto>;
  end;

implementation


constructor TProdutoDAO.Create;
begin
  inherited Create;
  FDM := TDMConexao.Create(nil);
end;


function TProdutoDAO.Inserir(Produto: TProduto): Boolean;
var
  Q: TSQLQuery;
begin
  Result := False;
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := FDM.SQLConnection;

    Q.SQL.Text := 'INSERT INTO PRODUTOS (COD_ITEM, NOME, PRECO) VALUES (:pCODIGO, :pDESCRICAO, :pVALOR)';
    Q.ParamByName('pCODIGO').AsInteger := Produto.Codigo;
    Q.ParamByName('pDESCRICAO').AsString := Produto.Descricao;
    Q.ParamByName('pVALOR').AsCurrency := Produto.Valor;
    Q.ExecSQL;

    Result := True;
  finally
    Q.Free;
  end;
end;

function TProdutoDAO.Atualizar(Produto: TProduto): Boolean;
var
  Q: TSQLQuery;
begin
  Result := False;
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := FDM.SQLConnection;
    Q.SQL.Text := 'UPDATE PRODUTOS SET NOME = :pDESCRICAO, VALOR = :pVALOR WHERE COD_ITEM = :pCODIGO';

    // Atribuição de Parâmetros
    Q.ParamByName('pDESCRICAO').AsString := Produto.Descricao;
    Q.ParamByName('pVALOR').AsCurrency := Produto.Valor;
    Q.ParamByName('pCODIGO').AsInteger := Produto.Codigo;
    Q.ExecSQL;

    Result := (Q.RowsAffected > 0);
  finally
    Q.Free;
  end;
end;

function TProdutoDAO.Deletar(Codigo: Integer): Boolean;
var
  Q: TSQLQuery;
begin
  Result := False;
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := FDM.SQLConnection;
    Q.SQL.Text := 'DELETE FROM PRODUTOS WHERE COD_ITEM = :pCODIGO';

    Q.ParamByName('pCODIGO').AsInteger := Codigo;
    Q.ExecSQL;

    Result := (Q.RowsAffected > 0);
  finally
    Q.Free;
  end;
end;

function TProdutoDAO.BuscarNovoCodigo: Integer;
var
  Q : TSQLQuery;
begin
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := FDM.SQLConnection;
    Q.SQL.Text := 'select max(p.cod_item)+1 from produtos p';
    Q.Open;
    Result := Q.Fields[0].AsInteger;
  finally
    Q.Free;
  end;

end;

function TProdutoDAO.BuscarPorCodigo(Codigo: Integer): TProduto;
var
  Q: TSQLQuery;
begin
  Result := nil;
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := FDM.SQLConnection;
    Q.SQL.Text := 'SELECT COD_ITEM, NOME, PRECO FROM PRODUTOS WHERE COD_ITEM = :pCODIGO';

    Q.ParamByName('pCODIGO').AsInteger := Codigo;
    Q.Open;

    if not Q.IsEmpty then
    begin
      Result := TProduto.Create;
      Result.Codigo := Q.FieldByName('COD_ITEM').AsInteger;
      Result.Descricao := Q.FieldByName('NOME').AsString;
      Result.Valor := Q.FieldByName('PRECO').AsCurrency;
    end;
  finally
    Q.Free;
  end;
end;

function TProdutoDAO.ListarTodos: TObjectList<TProduto>;
var
  Q: TSQLQuery;
  Produto: TProduto;
begin
  Result := TObjectList<TProduto>.Create;
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := FDM.SQLConnection;
    Q.SQL.Text := 'SELECT COD_ITEM, NOME, PRECO FROM PRODUTO ORDER BY NOME';
    Q.Open;

    while not Q.Eof do
    begin
      Produto := TProduto.Create;
      Produto.Codigo := Q.FieldByName('COD_ITEM').AsInteger;
      Produto.Descricao := Q.FieldByName('NOME').AsString;
      Produto.Valor := Q.FieldByName('PRECO').AsCurrency;

      Result.Add(Produto);
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

destructor TProdutoDAO.Destroy;
begin
  FDM.Free;
  inherited Destroy;
end;

end.
