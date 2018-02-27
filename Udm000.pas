unit Udm000;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, IBX.IBquery,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL;

type
  TdmBanco = class(TDataModule)
    Banco: TIBDatabase;
    TBanco: TIBTransaction;
    Usuario: TIBQuery;
    UsuarioUSU_CODIGO: TIntegerField;
    UsuarioUSU_NOME: TIBStringField;
    UsuarioUSU_DT_NASCIMENTO: TDateField;
    UsuarioUSU_EMAIL: TIBStringField;
    UsuarioUSU_TELEFONE: TIBStringField;
    uUsuario: TIBUpdateSQL;
    UsuarioUSU_DT_CADASTRO: TDateTimeField;
    procedure UsuarioAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
     function funcDataServidor : TDate;
     function funcGeraId(generator : String) : Integer;
  end;

var
  dmBanco: TdmBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule2 }

function TdmBanco.funcDataServidor: TDate;
var
   QryAux : TIBQuery;
begin
   QryAux := TIBQuery.Create(Self);
   QryAux.Transaction := dmBanco.TBanco;
   try
      QryAux.Close;
      QryAux.SQL.Text := ' SELECT CURRENT_TIMESTAMP DATASERVIDOR '+
                         '   FROM RDB$DATABASE                   ';
      QryAux.Open;

      Result := QryAux.FieldByName('DATASERVIDOR').AsDateTime;
   finally
      QryAux.Free;
   end;
end;

function TdmBanco.funcGeraId(generator: String): Integer;
var
   QryAux : TIBQuery;
begin
   QryAux := TIBQuery.Create(nil);
   QryAux.Transaction := TBanco;
   try
      QryAux.Close;
      QryAux.SQL.Text := ' SELECT GEN_ID('+generator+',1) ID '+
                         '   FROM rdb$database               ';
      QryAux.Open;

      Result := QryAux.FieldByName('ID').AsInteger;
   finally
      QryAux.Free;
   end;
end;

procedure TdmBanco.UsuarioAfterInsert(DataSet: TDataSet);
begin
   UsuarioUSU_CODIGO.AsInteger       := funcGeraId('SEQ_USUARIO');
   UsuarioUSU_DT_CADASTRO.AsDateTime := funcDataServidor;
end;

end.
