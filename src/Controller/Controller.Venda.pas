unit Controller.Venda;

interface

uses
  DAO.Venda,
  Model.Venda,
  Model.VendaItem,
  System.Generics.Collections;

type TVendaController = Class

  private
    FVendaDAO: TVEndaDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(AVenda: TVenda ; AItensList : TObjectList<TVendaItem>): Boolean;
    function BuscarPorCodigo(ACodigo: Integer): TVenda;
    function Deletar(ACodigo: Integer): Boolean;
    function BuscarNovoCodigo : Integer;

End;

implementation



{ TVendaController }
constructor TVendaController.Create;
begin
  FVendaDAO := TVendaDAO.Create;
end;

destructor TVendaController.Destroy;
begin
  FVendaDAO.Free;
  inherited;
end;

function TVendaController.BuscarNovoCodigo: Integer;
begin
  Result := FVendaDAO.BuscarNovoCodigo;
end;

function TVendaController.BuscarPorCodigo(ACodigo: Integer): TVenda;
begin

end;


function TVendaController.Deletar(ACodigo: Integer): Boolean;
begin

end;

function TVendaController.Salvar(AVenda: TVenda; AItensList: TObjectList<TVendaItem>): Boolean;
begin
  AVenda.Codigo := BuscarNovoCodigo;
  FVendaDAO.Salvar(AVenda,AItensList);
end;

end.
