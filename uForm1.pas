unit uForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus;

type
  TpUsuario = class(TForm)
    Panel1: TPanel;
    pme: TDBGrid;
    sbExcluir: TSpeedButton;
    sbNovo: TSpeedButton;
    sbEditar: TSpeedButton;
    dUsuario: TDataSource;
    PopupMenu1: TPopupMenu;
    CopiarUsuario1: TMenuItem;
    procedure sbNovoClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CopiarUsuario1Click(Sender: TObject);
  private
    { Private declarations }
    procedure procSelect;
  public
    { Public declarations }
  end;

var
  pUsuario: TpUsuario;

implementation

{$R *.dfm}

uses Udm000, uForm2, uTestePai;

procedure TpUsuario.CopiarUsuario1Click(Sender: TObject);
var
   usuario : TUsuario;
begin
try
   usuario := TUsuario.Create(dmbanco.UsuarioUSU_NOME.AsString,
                              dmbanco.UsuarioUSU_DT_NASCIMENTO.AsDateTime);
   try
      usuario.Setemail(dmBanco.UsuarioUSU_EMAIL.AsString);
      usuario.Settelefone(dmBanco.UsuarioUSU_TELEFONE.AsString);
      usuario.procCopiaUsuario;

      Application.MessageBox('Operação realizada!',
                             'Alerta',MB_OK+MB_ICONINFORMATION);
   except
      on E: Exception do
      begin
         raise Exception.Create('Ocorreu um erro ao Copiar o usuário'+sLineBreak+
                                'Erro: '+E.Message);
      end;
   end;
finally
   usuario.Free;
   procSelect;
end;

end;

procedure TpUsuario.FormCreate(Sender: TObject);
begin
   procSelect;
end;

procedure TpUsuario.procSelect;
begin
   dmBanco.Usuario.Close;
   dmBanco.Usuario.SQl.Text := ' SELECT A.*                '+
                               '   FROM USUARIO A          '+
                               '  ORDER BY USU_DT_CADASTRO ';
   dmBanco.Usuario.Open;
end;

procedure TpUsuario.sbEditarClick(Sender: TObject);
begin
   cusuario := TcUsuario.Create(Self);
   try
      dmBanco.Usuario.Edit;
      cusuario.ShowModal;
   finally
      cusuario.Free;
      procSelect;
   end;
end;

procedure TpUsuario.sbExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Deseja deletar este usuario?',
                             'Alerta',MB_YESNO+MB_ICONEXCLAMATION) = IDNO then
      Exit;
   try
      try
      dmBanco.Usuario.Delete;

      if dmBanco.TBanco.InTransaction then
        dmBanco.TBanco.Commit;
      except 
        on E: Exception do
        begin
           if dmBanco.TBanco.InTransaction then
              dmBanco.TBanco.Rollback;

           raise Exception.Create('Ocorreu um erro ao tentar excluir o Usuário'+sLineBreak+
                                  'Erro: '+E.Message);  
        end;
      end;
   finally
      procSelect;
   end;

end;

procedure TpUsuario.sbNovoClick(Sender: TObject);
begin
   cusuario := TcUsuario.Create(Self);
   try
      dmBanco.Usuario.Insert;
      cusuario.ShowModal;
   finally
      cusuario.Free;
      procSelect;
   end;
end;

end.
