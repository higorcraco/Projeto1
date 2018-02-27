object pUsuario: TpUsuario
  Left = 0
  Top = 0
  Caption = 'Usuarios'
  ClientHeight = 287
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 240
    Width = 694
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object sbExcluir: TSpeedButton
      Left = 224
      Top = 0
      Width = 105
      Height = 47
      Align = alLeft
      Caption = 'Excluir'
      OnClick = sbExcluirClick
      ExplicitLeft = 0
    end
    object sbNovo: TSpeedButton
      Left = 0
      Top = 0
      Width = 112
      Height = 47
      Align = alLeft
      Caption = 'Novo'
      OnClick = sbNovoClick
      ExplicitLeft = -7
    end
    object sbEditar: TSpeedButton
      Left = 112
      Top = 0
      Width = 112
      Height = 47
      Align = alLeft
      Caption = 'Editar'
      OnClick = sbEditarClick
      ExplicitLeft = -7
    end
  end
  object pme: TDBGrid
    Left = 0
    Top = 0
    Width = 694
    Height = 240
    Align = alClient
    DataSource = dUsuario
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USU_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_DT_NASCIMENTO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_DT_CADASTRO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_EMAIL'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_TELEFONE'
        Width = 64
        Visible = True
      end>
  end
  object dUsuario: TDataSource
    AutoEdit = False
    DataSet = dmBanco.Usuario
    Left = 640
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    Left = 640
    Top = 168
    object CopiarUsuario1: TMenuItem
      Caption = 'Copiar Usu'#225'rio'
      OnClick = CopiarUsuario1Click
    end
  end
end
