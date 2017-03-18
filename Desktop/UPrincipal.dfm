object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'PRINCIPAL'
  ClientHeight = 456
  ClientWidth = 673
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
    Left = 25
    Top = 15
    Width = 27
    Height = 13
    Caption = 'HOST'
  end
  object Label2: TLabel
    Left = 152
    Top = 15
    Width = 34
    Height = 13
    Caption = 'PORTA'
  end
  object editHost: TEdit
    Left = 25
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'LOCALHOST'
  end
  object editPorta: TEdit
    Left = 152
    Top = 32
    Width = 129
    Height = 21
    TabOrder = 1
    Text = '211'
  end
  object btnConectar: TButton
    Left = 286
    Top = 30
    Width = 75
    Height = 25
    Caption = 'CONECTAR'
    TabOrder = 2
    OnClick = btnConectarClick
  end
  object DBGridBeleza1: TDBGridBeleza
    Left = 25
    Top = 80
    Width = 624
    Height = 193
    Hint = 'Clique no Titulo da Coluna para Ordenar'
    BorderStyle = bsNone
    DataSource = dsAluno
    FixedColor = 16762447
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Cor_2 = 16773849
    Direcao_Cor2 = dg_Vertical
    Direcao_Enter = dg_Horiz
    ClickTituloOrdenar = True
    MarcarLinhaInteira = False
    CorLinhaMarcada = clSilver
    CorFonteLinhaMarcada = clBlack
    BloquearExportacoes = False
  end
  object DBNavigator1: TDBNavigator
    Left = 409
    Top = 279
    Width = 240
    Height = 25
    DataSource = dsAluno
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 25
    Top = 312
    Width = 624
    Height = 121
    Lines.Strings = (
      'Sobre a conex'#227'o:'
      ''
      'SQLCOnnection1: *Driver = DATASNAP;'
      ''
      
        'DSProviderConnection1: *ServerClassName = TServerMethods1; *SQLC' +
        'onnection = SQLConnection1;'
      ''
      
        'CDSAluno: *RemoteServer = DSProviderConnection1; *ProviderName =' +
        ' pAluno')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=22.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 403
    Top = 16
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = SQLConnection1
    Left = 504
    Top = 16
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    Left = 624
    Top = 16
  end
  object cdsAluno: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pAluno'
    RemoteServer = DSProviderConnection1
    Left = 592
    Top = 16
  end
end
