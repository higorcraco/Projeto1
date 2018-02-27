object cUsuario: TcUsuario
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o de Usu'#225'rios'
  ClientHeight = 291
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 16
    Top = 96
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 115
    Top = 16
    Width = 70
    Height = 13
    Caption = 'Data Cadastro'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 24
    Height = 13
    Caption = 'Email'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 16
    Top = 176
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = DBEdit6
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 32
    Width = 65
    Height = 21
    DataField = 'USU_CODIGO'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 71
    Width = 233
    Height = 21
    DataField = 'USU_NOME'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 112
    Width = 134
    Height = 21
    DataField = 'USU_DT_NASCIMENTO'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 115
    Top = 32
    Width = 134
    Height = 21
    DataField = 'USU_DT_CADASTRO'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 16
    Top = 152
    Width = 200
    Height = 21
    DataField = 'USU_EMAIL'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 16
    Top = 192
    Width = 186
    Height = 21
    DataField = 'USU_TELEFONE'
    DataSource = DataSource1
    TabOrder = 5
    OnKeyPress = DBEdit6KeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 250
    Width = 328
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    ExplicitLeft = 80
    ExplicitTop = 144
    ExplicitWidth = 185
    object btGravar: TButton
      Left = 0
      Top = 0
      Width = 113
      Height = 41
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btGravarClick
      ExplicitLeft = 145
    end
    object btCancelar: TButton
      Left = 215
      Top = 0
      Width = 113
      Height = 41
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btCancelarClick
      ExplicitLeft = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = dmBanco.Usuario
    Left = 232
    Top = 120
  end
end
