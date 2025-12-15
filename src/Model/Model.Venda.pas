unit Model.Venda;

interface

uses
  Model.Cliente, Model.VendaItem, System.Generics.Collections;
type TVenda = class
  private
    FCodigo: integer;
    FValorTotal: Currency;
    FCliente: TCliente;
    FItens: TObjectList<TVendaItem>;
    function GetCliente: TCliente;
    procedure SetCliente(const Value: TCliente);
  public
    constructor Create;
    destructor Destroy; override;

published
  property Codigo : integer read FCodigo write FCodigo;
  property Cliente : TCliente read GetCliente write SetCliente;
  property ValorTotal : Currency read FValorTotal write FValorTotal;
end;

implementation

{ TVenda }

constructor TVenda.Create;
begin
  FItens := TObjectList<TVendaItem>.Create;
end;

destructor TVenda.Destroy;
begin
  FItens.Free;
  inherited;
end;

function TVenda.GetCliente: TCliente;
begin
  Result := FCliente;
end;

procedure TVenda.SetCliente(const Value: TCliente);
begin
  FCliente := Value;
end;

end.
