object dmBanco: TdmBanco
  OldCreateOrder = False
  Height = 230
  Width = 338
  object Banco: TIBDatabase
    Connected = True
    DatabaseName = '192.168.1.10/3050:D:\Bancos\TESTE.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 40
    Top = 40
  end
  object TBanco: TIBTransaction
    Active = True
    DefaultDatabase = Banco
    Left = 112
    Top = 40
  end
  object Usuario: TIBQuery
    Database = Banco
    Transaction = TBanco
    AfterInsert = UsuarioAfterInsert
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT A.*'
      'FROM USUARIO A'
      'WHERE USU_CODIGO = -1')
    UpdateObject = uUsuario
    Left = 174
    Top = 40
    object UsuarioUSU_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'USU_CODIGO'
      Origin = '"USUARIO"."USU_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object UsuarioUSU_NOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'USU_NOME'
      Origin = '"USUARIO"."USU_NOME"'
      Required = True
      Size = 60
    end
    object UsuarioUSU_DT_NASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'USU_DT_NASCIMENTO'
      Origin = '"USUARIO"."USU_DT_NASCIMENTO"'
      EditMask = '!99/99/0000;1;_'
    end
    object UsuarioUSU_EMAIL: TIBStringField
      DisplayLabel = 'Email'
      FieldName = 'USU_EMAIL'
      Origin = '"USUARIO"."USU_EMAIL"'
      Size = 60
    end
    object UsuarioUSU_TELEFONE: TIBStringField
      DisplayLabel = 'Telefone'
      FieldName = 'USU_TELEFONE'
      Origin = '"USUARIO"."USU_TELEFONE"'
      Size = 14
    end
    object UsuarioUSU_DT_CADASTRO: TDateTimeField
      FieldName = 'USU_DT_CADASTRO'
      Origin = '"USUARIO"."USU_DT_CADASTRO"'
    end
  end
  object uUsuario: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  USU_CODIGO,'
      '  USU_NOME,'
      '  USU_DT_NASCIMENTO,'
      '  USU_DT_CADASTRO,'
      '  USU_EMAIL,'
      '  USU_TELEFONE'
      'from USUARIO '
      'where'
      '  USU_CODIGO = :USU_CODIGO')
    ModifySQL.Strings = (
      'update USUARIO'
      'set'
      '  USU_CODIGO = :USU_CODIGO,'
      '  USU_NOME = :USU_NOME,'
      '  USU_DT_NASCIMENTO = :USU_DT_NASCIMENTO,'
      '  USU_DT_CADASTRO = :USU_DT_CADASTRO,'
      '  USU_EMAIL = :USU_EMAIL,'
      '  USU_TELEFONE = :USU_TELEFONE'
      'where'
      '  USU_CODIGO = :OLD_USU_CODIGO')
    InsertSQL.Strings = (
      'insert into USUARIO'
      
        '  (USU_CODIGO, USU_NOME, USU_DT_NASCIMENTO, USU_DT_CADASTRO, USU' +
        '_EMAIL, '
      '   USU_TELEFONE)'
      'values'
      
        '  (:USU_CODIGO, :USU_NOME, :USU_DT_NASCIMENTO, :USU_DT_CADASTRO,' +
        ' :USU_EMAIL, '
      '   :USU_TELEFONE)')
    DeleteSQL.Strings = (
      'delete from USUARIO'
      'where'
      '  USU_CODIGO = :OLD_USU_CODIGO')
    Left = 176
    Top = 96
  end
end
