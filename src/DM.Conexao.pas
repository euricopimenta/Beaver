unit DM.Conexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr;

type
  TDMConexao = class(TDataModule)
    SQLConnection: TSQLConnection;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
