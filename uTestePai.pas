unit uTestePai;

interface

uses
  System.SysUtils, IBX.IBquery;

type
   TTestePai = class
      private
         nome            : String;
         data_nascimento : TDate;
         data_cadastro   : TDate;


      protected
       { protected declarations }
      public
       { public declarations }
         function Getnome : String;
         function Getdata_nascimento : TDate;
         function Getdata_cadastro : TDate;
         procedure Setnome(const Value: String);
         procedure Setdata_nascimento(const Value: TDate);
         procedure Setdata_cadastro(const Value: TDate);
      published
       { published declarations }
      end;

   TUsuario = class(TTestePai)
      private
         email           : String;
         telefone        : String;


      protected
       { protected declarations }
      public
       { public declarations }
         function Getemail : String;
         function Gettelefone : String;
         procedure Setemail(const Value: String);
         procedure Settelefone(const Value: String);
         procedure procCopiaUsuario;
      published
       { published declarations }
       constructor Create(nome : String; dtNascimento : Tdate);

      end;


implementation

{ TTestePai }

uses Udm000;

procedure TTestePai.Setnome(const Value: String);
begin
   nome := Value;
end;

procedure TTestePai.Setdata_nascimento(const Value: TDate);
begin
   data_nascimento := Value;
end;

function TTestePai.Getdata_cadastro: TDate;
begin
   Result := data_cadastro;
end;

function TTestePai.Getdata_nascimento: TDate;
begin
   Result := data_nascimento;
end;

function TTestePai.Getnome: String;
begin
   Result := nome;
end;

procedure TTestePai.Setdata_cadastro(const Value: Tdate);
begin
   data_cadastro := Value;
end;

{ TUsuario }


{ TUsuario }

constructor TUsuario.Create(nome: String; dtNascimento: Tdate);
begin
   Self.Setnome(nome);
   Self.Setdata_nascimento(dtNascimento);
   Self.Setdata_cadastro(dmBanco.funcDataServidor);
end;

function TUsuario.Getemail: String;
begin
   Result := email;
end;

function TUsuario.Gettelefone: String;
begin
   Result := telefone;
end;

procedure TUsuario.procCopiaUsuario;
var
   usuario : TUsuario;
   QryUpdate : TIBQuery;
begin
   QryUpdate := TIBQuery.Create(nil);
   QryUpdate.Transaction := dmBanco.TBanco;
   try
      try
         QryUpdate.Close;
         QryUpdate.SQL.Text := ' INSERT INTO USUARIO VALUES (GEN_ID(SEQ_USUARIO,1), :NOME, :DT_NASCIMENTO, '+
                               '                             :DT_CADASTRO, :EMAIL, :TELEFONE);             ';
         QryUpdate.ParamByName('NOME').AsString        := Self.Getnome;
         QryUpdate.ParamByName('DT_NASCIMENTO').AsDate := Self.Getdata_nascimento;
         QryUpdate.ParamByName('DT_CADASTRO').AsDate   := Self.Getdata_cadastro;
         QryUpdate.ParamByName('EMAIL').AsString       := Self.Getemail;
         QryUpdate.ParamByName('TELEFONE').AsString    := Self.Gettelefone;
         QryUpdate.ExecSQL;

         if dmBanco.TBanco.InTransaction then
            dmBanco.TBanco.Commit;
      except
          on E: Exception do
          begin
             if dmBanco.TBanco.InTransaction then
                dmBanco.TBanco.Rollback;

             Raise;
          end;
      end;
   finally
      QryUpdate.Free
   end;
end;

procedure TUsuario.Setemail(const Value: String);
begin
   email := Value;
end;

procedure TUsuario.Settelefone(const Value: String);
begin
   telefone := Value;
end;

end.
