unit Report.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.FMTBcd, Data.DB,
  Data.SqlExpr, DM.Conexao, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRelVendas = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    rlblTitulo: TRLLabel;
    Qry: TSQLQuery;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    dtsVendas: TDataSource;
    QryCOD_VENDA: TIntegerField;
    QryCLIENTE: TStringField;
    QryCEP_CODIGO: TStringField;
    QryCEP_RUA: TStringField;
    QryCEP_NUM: TStringField;
    QryCEP_BAIRRO: TStringField;
    QryCEP_CIDADE: TStringField;
    QryCEP_UF: TStringField;
    QryVALOR_TOTAL: TFMTBCDField;
    QryDATA_VENDA: TDateField;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FDataInicial: TDate;
    FDataFinal: TDate;
    procedure SetDataInicial(const Value: TDate);
    procedure SetDataFinal(const Value: TDate);
    { Private declarations }
  public
    property DataInicial : TDate read FDataInicial write SetDataInicial;
    property DataFinal : TDate read FDataFinal write SetDataFinal;
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

{$R *.dfm}

procedure TfrmRelVendas.FormCreate(Sender: TObject);
begin
  //
end;

procedure TfrmRelVendas.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
//
//  Qry.SQL.Clear;
//  Qry.SQL.Text := 'Select * from vendas v where v.data_venda between :pDtIni and :pDtFim ';
//  Qry.ParamByName('pDtIni').AsDate := DataInicial;
//  Qry.ParamByName('pDtFim').AsDate := DataFinal;
//
//  Qry.Open;
end;

procedure TfrmRelVendas.SetDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TfrmRelVendas.SetDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

end.
