unit Model.Produto;

interface

type TProduto = class
  private
    FValor: Currency;
    FDescricao: String;
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetValor(const Value: Currency);


  published
    property Codigo : Integer read FCodigo write SetCodigo;
    property Descricao : String read FDescricao write SetDescricao;
    property Valor : Currency read FValor write SetValor;

end;

implementation

{ TProduto }

procedure TProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
