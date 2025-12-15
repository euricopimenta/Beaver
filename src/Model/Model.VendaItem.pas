unit Model.VendaItem;

interface

type TVendaItem = class
  private
    FCodProduto: Integer;
    FCodVendaItem: Integer;
    FValUnitario: Double;
    FQuantidade: Double;
    FValTotal: Double;
    procedure SetQuantidade(const Value: Double);
    procedure SetValTotal(const Value: Double);
    procedure SetValUnitario(const Value: Double);
    procedure SetCodProduto(const Value: Integer);
    procedure SetCodVendaItem(const Value: Integer);
  published
    Property CodVendaItem : Integer read FCodVendaItem write SetCodVendaItem;
    Property CodProduto : Integer read FCodProduto write SetCodProduto;
    Property Quantidade : Double read FQuantidade write SetQuantidade;
    Property ValUnitario : Double read FValUnitario write SetValUnitario;
    Property ValTotal : Double read FValTotal write SetValTotal;
end;

implementation

uses
  System.SysUtils;

{ TVendaItem }

procedure TVendaItem.SetCodProduto(const Value: Integer);
begin
  FCodProduto := Value;
end;

procedure TVendaItem.SetCodVendaItem(const Value: Integer);
begin
  FCodVendaItem := Value;
end;

procedure TVendaItem.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TVendaItem.SetValTotal(const Value: Double);
begin
  FValTotal := Value;
end;

procedure TVendaItem.SetValUnitario(const Value: Double);
begin
  if Value <= 0 then
    raise Exception.Create('Insira o Valor unitário');
  FValUnitario := Value;
end;

end.
