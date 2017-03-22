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
    Text = '192.168.1.200'
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
    Width = 312
    Height = 193
    Hint = 'Clique no Titulo da Coluna para Ordenar'
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
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
    Align = alCustom
    Anchors = [akTop, akRight]
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 25
    Top = 312
    Width = 624
    Height = 121
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '=========================== SERVIDOR ==========================='
      
        'novo> other > DATASnapServer > marcar Form Application >  marcar' +
        ' vclAplication '
      
        '> marcar autentication (nos 2 lugares) e marcar mobile connectio' +
        'rs > Escolher porta '
      
        '> marcar TDSServerMmodule > Escolher pasta para onde salvar apli' +
        'ca'#231#227'o.'
      ''
      ''
      
        'O delphi deve criar  um FORM, um serverMethosUnit e um serverCon' +
        'tainerUnit.'
      'Form = form Principal;'
      
        'serverMethosUnit = local dos componentes de conex'#227'o a dados e me' +
        'thodos.'
      
        'serverContainerUnit = far'#225' a comunica'#231#227'o da nossa maquina com as' +
        ' outras maquinas. '
      ''
      ''
      'OBS:'
      '* no serverContainerUnit; '
      '-DSTCPServerTransport1 = configurar porta(port);'
      
        '-DSAutenticationManager1 = Se vc quiser validar, derer'#225' ir em EV' +
        'ENTS> OnUserAutenticaion e fazer a regra de autentica'#231#227'o nesse e' +
        'vento.'
      ''
      ''
      'CONFIGURA'#199#213'ES '
      '*ServerMethodsUnit1: '
      
        '-Colocar um FDGuixwaitCursor e um FDPHPMySQLDriverLink (apenas c' +
        'olocar para n'#227'o da erro);'
      
        '-Colocar um FDConnection (configura-lo; desmarcar a op'#231#227'o loginP' +
        'rompt) e um TFDQuery (Ligar com fdConnection e colocar o SQL);'
      '-Colocar um TdataSetProvider e linkar com a TFDQuery criada;'
      '... Com essas configura'#231#245'es vc libera uma tabela para consulta.'
      ''
      ''
      '=========================== CLIENTE ==========================='
      'Sobre a conex'#227'o base:'
      ''
      'SQLCOnnection1: *Driver = DATASNAP;'
      ''
      
        'DSProviderConnection1: *ServerClassName = TServerMethods1; *SQLC' +
        'onnection = SQLConnection1;'
      ''
      
        '________________________________________________________________' +
        '________________'
      ''
      'Sobre a conex'#227'o com dataset:'
      ''
      
        'CDSAluno: *RemoteServer = DSProviderConnection1; *ProviderName =' +
        ' pAluno'
      ''
      
        '________________________________________________________________' +
        '________________'
      ''
      'Sobre a conex'#227'o para usar m'#233'todos do servidor:'
      ''
      
        '* os m'#233'todos ser'#227'o criados na servermethodsUnit1 do projeto serv' +
        'idor;'
      
        '* na Aplica'#231#227'ocliente, clica com o bot'#227'o direito sobre SQLCOnnec' +
        'tion1 e click em "Genereta Datasnap client clases", ent'#227'o uma un' +
        'it se abrir'#225', salve-a. ela '#233' respons'#225'vel por chamar os metodos c' +
        'riados no servidor.'
      '*exemplo para se chamar um metodo do servidor no buttom1'
      'https://www.youtube.com/watch?v=MWu1VZPoBUM&t=1s')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object Button1: TButton
    Left = 25
    Top = 279
    Width = 112
    Height = 25
    Caption = 'Visualizar Foto Strem'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Image1: TcxImage
    Left = 400
    Top = 80
    Align = alCustom
    Anchors = [akTop, akRight]
    Style.Color = 3026478
    TabOrder = 7
    Height = 193
    Width = 249
  end
  object button3: TButton
    Left = 262
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Mudar Foto'
    TabOrder = 8
    OnClick = button3Click
  end
  object Button2: TButton
    Left = 141
    Top = 279
    Width = 117
    Height = 25
    Caption = 'Visualizar foto json'
    TabOrder = 9
    OnClick = Button2Click
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
    UniqueId = '{4C2681FA-B866-41D7-ABEB-4AC8F5744CDC}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = SQLConnection1
    Left = 504
    Top = 16
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    OnDataChange = dsAlunoDataChange
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
    object cdsAlunoidAluno: TIntegerField
      FieldName = 'idAluno'
      Required = True
    end
    object cdsAlunonomeAluno: TStringField
      FieldName = 'nomeAluno'
      Required = True
      Size = 80
    end
    object cdsAlunoidade: TIntegerField
      FieldName = 'idade'
    end
    object cdsAlunodataNascimento: TDateField
      FieldName = 'dataNascimento'
    end
    object cdsAlunoemail: TStringField
      FieldName = 'email'
      Size = 60
    end
    object cdsAlunosexo: TStringField
      FieldName = 'sexo'
      FixedChar = True
      Size = 1
    end
    object cdsAlunocidade: TStringField
      FieldName = 'cidade'
      Size = 50
    end
    object cdsAlunobairro: TStringField
      FieldName = 'bairro'
      Size = 50
    end
    object cdsAlunorua: TStringField
      FieldName = 'rua'
      Size = 50
    end
    object cdsAlunonumero: TIntegerField
      FieldName = 'numero'
    end
    object cdsAlunocep: TIntegerField
      FieldName = 'cep'
    end
    object cdsAlunotel1: TStringField
      FieldName = 'tel1'
      Size = 50
    end
    object cdsAlunotel2: TStringField
      FieldName = 'tel2'
      Size = 50
    end
    object cdsAlunonomeResponsavel: TStringField
      FieldName = 'nomeResponsavel'
      Size = 80
    end
    object cdsAlunoparentescoResponsavel: TStringField
      FieldName = 'parentescoResponsavel'
      Size = 50
    end
    object cdsAlunotelResponsavel: TStringField
      FieldName = 'telResponsavel'
      Size = 50
    end
    object cdsAlunopeso: TSingleField
      FieldName = 'peso'
    end
    object cdsAlunoaltura: TSingleField
      FieldName = 'altura'
    end
    object cdsAlunofrequenciaAtividadeFisica: TIntegerField
      FieldName = 'frequenciaAtividadeFisica'
    end
    object cdsAlunoqtdRefeicoesDia: TIntegerField
      FieldName = 'qtdRefeicoesDia'
    end
    object cdsAlunoqtdHorasSono: TIntegerField
      FieldName = 'qtdHorasSono'
    end
    object cdsAlunosuplementacao: TBooleanField
      FieldName = 'suplementacao'
    end
    object cdsAlunodieta: TBooleanField
      FieldName = 'dieta'
    end
    object cdsAlunofumante: TBooleanField
      FieldName = 'fumante'
    end
    object cdsAlunoconsomeBebidaAlcoolica: TBooleanField
      FieldName = 'consomeBebidaAlcoolica'
    end
    object cdsAlunodataCadastro: TDateField
      FieldName = 'dataCadastro'
    end
    object cdsAlunoativo: TBooleanField
      FieldName = 'ativo'
    end
    object cdsAlunocpf: TStringField
      FieldName = 'cpf'
      Size = 50
    end
    object cdsAlunoinformacaoAdicional: TStringField
      FieldName = 'informacaoAdicional'
      Size = 500
    end
    object cdsAlunoidObjetivo: TIntegerField
      FieldName = 'idObjetivo'
    end
    object cdsAlunodataComposicaoFicha: TDateField
      FieldName = 'dataComposicaoFicha'
    end
    object cdsAlunoidInstrutorFicha: TIntegerField
      FieldName = 'idInstrutorFicha'
    end
  end
end
