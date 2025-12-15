unit DAO.Venda;

interface

uses
  DM.Conexao, Model.Venda, Model.VendaItem, System.Generics.Collections;

type
  TVendaDAO = class
  private
    FDM: TDMConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(AVenda: TVenda; AItensList: TObjectList<TVendaItem>): Boolean;
    function BuscarNovoCodigo : Integer;
  end;
implementation

uses
  Data.SqlExpr, System.SysUtils;

{ TVendaDAO }

constructor TVendaDAO.Create;
begin
  FDM := TDMConexao.Create(nil);
end;

destructor TVendaDAO.Destroy;
begin
  FDM.Free;
  inherited;
end;

function TVendaDAO.Salvar(AVenda: TVenda;
  AItensList: TObjectList<TVendaItem>): Boolean;
var
  Q : TSQLQuery;
  LItem: TVendaItem;
  Transact: TTransactionDesc;
begin
  Q := TSQLQuery.Create(nil);
  Q.SQLConnection := FDM.SQLConnection;
  Transact.TransactionID := 1;

  try
    // Início da Transação
    Q.SQLConnection.StartTransaction(Transact);

    try

      Q.SQL.Text := 'Insert into VENDAS (COD_VENDA, CLIENTE, CEP_CODIGO, CEP_RUA, CEP_NUM, ' +
                                  'CEP_BAIRRO, CEP_CIDADE, CEP_UF, VALOR_TOTAL, DATA_VENDA) ' +

                    'values (:COD_VENDA, :CLIENTE, :CEP_CODIGO, :CEP_RUA, :CEP_NUM, :CEP_BAIRRO, '+
                            ':CEP_CIDADE, :CEP_UF, :VALOR_TOTAL, CURRENT_DATE);';

      Q.ParamByName('cod_venda').AsInteger := AVenda.Codigo ;
      Q.ParamByName('cliente').AsString := AVenda.Cliente.Nome ;
      Q.ParamByName('cep_codigo').AsString := AVenda.Cliente.CEP_Codigo ;
      Q.ParamByName('cep_rua').AsString := AVenda.Cliente.CEP_Endereco ;
      Q.ParamByName('cep_num').AsString := AVenda.Cliente.CEP_Numero ;
      Q.ParamByName('cep_bairro').AsString := AVenda.Cliente.CEP_Bairro ;
      Q.ParamByName('cep_cidade').AsString := AVenda.Cliente.CEP_Cidade ;
      Q.ParamByName('cep_uf').AsString := AVenda.Cliente.CEP_UF ;
      Q.ParamByName('valor_total').AsFloat := AVenda.ValorTotal ;

      Q.ExecSQL();
      Q.Close;

      // Limpa a SQL Query, e prepara o lançamento dos Itens da venda
      Q.SQL.Clear;
      Q.SQL.Text :=
          'insert into VENDAS_ITENS (ID_VENDA, COD_ITEM, PRECO, QUANTIDADE, TOTAL, ORDEM)'+
          'values (:ID_VENDA, :COD_ITEM, :PRECO, :QUANTIDADE, :TOTAL, :ORDEM)';

      for LItem in AItensList do
      begin
        // Atualiza os parâmetros para o item atual
        Q.ParamByName('ID_VENDA').AsInteger := AVenda.Codigo;
        Q.ParamByName('COD_ITEM').AsInteger := LItem.CodProduto;
        Q.ParamByName('QUANTIDADE').AsFloat := LItem.Quantidade;
        Q.ParamByName('PRECO').AsFloat := LItem.ValUnitario;
        Q.ParamByName('TOTAL').AsFloat := LItem.ValTotal;
        Q.ParamByName('ORDEM').AsInteger := AItensList.IndexOf(LItem) +1;

        Q.ExecSQL;
      end;

      FDM.SQLConnection.Commit(Transact);

    except
      Q.SQLConnection.Rollback(Transact);
      raise;
    end;

  finally
    Q.Free;
  end;

end;


function TVendaDAO.BuscarNovoCodigo: Integer;
var
  Q : TSQLQuery;
begin
  Q := TSQLQuery.Create(nil);
  try
    Q.SQLConnection := FDM.SQLConnection;
    Q.SQL.Text := 'select max(v.cod_venda)+1 from vendas v';
    Q.Open;
    Result := Q.Fields[0].AsInteger;
  finally
    Q.Free;
  end;

end;


end.
