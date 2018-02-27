unit uForm2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls;

type
  TcUsuario = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Panel1: TPanel;
    btGravar: TButton;
    btCancelar: TButton;
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function funcValidacoes : Boolean;
  public
    { Public declarations }
  end;

var
  cUsuario: TcUsuario;

implementation

{$R *.dfm}

uses Udm000;

procedure TcUsuario.btCancelarClick(Sender: TObject);
begin
   dmBanco.Usuario.Cancel;

   Close;
end;

procedure TcUsuario.btGravarClick(Sender: TObject);
begin
   try
      if not funcValidacoes then
         Exit;
   
      dmBanco.Usuario.Post;

      if dmBanco.TBanco.InTransaction then
         dmBanco.TBanco.Commit;

      Close;
   except 
      on E: Exception do
      begin
         if dmBanco.TBanco.InTransaction then
            dmBanco.TBanco.Rollback;
      
         raise Exception.Create('Ocorreu um erro ao tentar gravar o usuário!'+sLineBreak+
                                'Erro: '+E.Message);   
      end;
   end;
end;

procedure TcUsuario.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
   if not(key in ['0'..'9','(',')',#8]) then
      key := #0;
end;

function TcUsuario.funcValidacoes: Boolean;
begin
   Result := False;

   if dmBanco.UsuarioUSU_NOME.AsString = '' then
   begin
      Application.MessageBox('O campo NOME não pode estar vazio!',
                             'Alerta',MB_OK+MB_ICONERROR);
      Exit;
   end;

   if dmBanco.UsuarioUSU_EMAIL.AsString = '' then
   begin
      Application.MessageBox('O campo EMAIL não pode estar vazio!',
                             'Alerta',MB_OK+MB_ICONERROR);
      Exit;
   end;

   if dmBanco.UsuarioUSU_TELEFONE.AsString = '' then
   begin
      Application.MessageBox('O campo TELEFONE não pode estar vazio!',
                             'Alerta',MB_OK+MB_ICONERROR);
      Exit;
   end;

   if dmBanco.UsuarioUSU_DT_NASCIMENTO.isNull then
   begin
      Application.MessageBox('O campo DATA DE NASCIMENTO não pode estar vazio!',
                             'Alerta',MB_OK+MB_ICONERROR);
      Exit;
   end;

   Result := True;
end;

end.
