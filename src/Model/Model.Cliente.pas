unit Model.Cliente;

interface
type TCliente = Class
  private
    FCEP_Codigo: string;
    FNome: String;
    FCEP_Endereco: String;
    FCEP_Bairro: String;
    FCEP_UF: String;
    FCEP_Numero: String;
    FCEP_Cidade: String;

  public
    function ClientePadrao : TCliente;
  published
    property Nome : String Read FNome write FNome;
    property CEP_Codigo: string read FCEP_Codigo write FCEP_Codigo;
    property CEP_Endereco: String read FCEP_Endereco write FCEP_Endereco;
    property CEP_Numero: String read FCEP_Numero write FCEP_Numero;
    property CEP_Bairro: String read FCEP_Bairro write FCEP_Bairro;
    property CEP_Cidade: String read FCEP_Cidade write FCEP_Cidade;
    property CEP_UF: String read FCEP_UF write FCEP_UF;
End;

implementation

{ TCliente }


{ TCliente }

function TCliente.ClientePadrao: TCliente;
begin
  Result := TCliente.Create;
  with Result do
  begin
    Nome := 'Consumidor Final';
    CEP_Codigo := '45200390';
    CEP_Endereco := 'Joaquim Lobo 2';
    CEP_Numero := '161';
    CEP_Bairro := 'Centro';
    CEP_Cidade := 'Jequié';
    CEP_UF := 'BA';
  end;
end;

end.
