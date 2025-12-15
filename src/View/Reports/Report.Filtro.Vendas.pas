unit Report.Filtro.Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls;

type
  TfrmRelVendaFiltro = class(TForm)
    pnlFooter: TPanel;
    btnSair: TButton;
    btnGerar: TButton;
    edtDataInicial: TDateTimePicker;
    lblDataInicial: TLabel;
    edtDataFinal: TDateTimePicker;
    lblDataFinal: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendaFiltro: TfrmRelVendaFiltro;

implementation

uses
  Report.Vendas;

{$R *.dfm}

procedure TfrmRelVendaFiltro.btnGerarClick(Sender: TObject);
var
  RelVendas : TfrmRelVendas;
begin
  RelVendas := TfrmRelVendas.Create(Self);
  try
    RelVendas.DataInicial := edtDataInicial.Date;
    RelVendas.DataFinal := edtDataFinal.Date;
    RelVendas.RLReport1.Preview;
  finally
    RelVendas.RLReport1.Free;
  end;
end;

procedure TfrmRelVendaFiltro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelVendaFiltro.FormShow(Sender: TObject);
begin
  edtDataFinal.MaxDate := Now;
end;

end.
