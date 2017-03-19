unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect,
  Data.SqlExpr, MIDASLIB, System.JSON, Data.DBXJSONCommon, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxImage;

type
  TfrmPrincipal = class(TForm)
    editHost: TEdit;
    editPorta: TEdit;
    btnConectar: TButton;
    DBGridBeleza1: TDBGridBeleza;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    dsAluno: TDataSource;
    cdsAluno: TClientDataSet;
    Memo1: TMemo;
    Button1: TButton;
    cdsAlunoidAluno: TIntegerField;
    cdsAlunonomeAluno: TStringField;
    cdsAlunoidade: TIntegerField;
    cdsAlunodataNascimento: TDateField;
    cdsAlunoemail: TStringField;
    cdsAlunosexo: TStringField;
    cdsAlunocidade: TStringField;
    cdsAlunobairro: TStringField;
    cdsAlunorua: TStringField;
    cdsAlunonumero: TIntegerField;
    cdsAlunocep: TIntegerField;
    cdsAlunotel1: TStringField;
    cdsAlunotel2: TStringField;
    cdsAlunonomeResponsavel: TStringField;
    cdsAlunoparentescoResponsavel: TStringField;
    cdsAlunotelResponsavel: TStringField;
    cdsAlunopeso: TSingleField;
    cdsAlunoaltura: TSingleField;
    cdsAlunofrequenciaAtividadeFisica: TIntegerField;
    cdsAlunoqtdRefeicoesDia: TIntegerField;
    cdsAlunoqtdHorasSono: TIntegerField;
    cdsAlunosuplementacao: TBooleanField;
    cdsAlunodieta: TBooleanField;
    cdsAlunofumante: TBooleanField;
    cdsAlunoconsomeBebidaAlcoolica: TBooleanField;
    cdsAlunodataCadastro: TDateField;
    cdsAlunoativo: TBooleanField;
    cdsAlunocpf: TStringField;
    cdsAlunoinformacaoAdicional: TStringField;
    cdsAlunoidObjetivo: TIntegerField;
    cdsAlunodataComposicaoFicha: TDateField;
    cdsAlunoidInstrutorFicha: TIntegerField;
    Image1: TcxImage;
    Button2: TButton;
    button3: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UMetodosDoServidor, IWSystem ;

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
begin
  //
  if btnConectar.Caption = 'CONECTAR' then
  begin
      SQLConnection1.Close;
      cdsAluno.close; //

      SQLConnection1.Params.Clear;
      SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
      SQLConnection1.Params.Add('HostName='+ editHost.Text);
      SQLConnection1.Params.Add('Port='+editPorta.Text);
      SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
      SQLConnection1.Params.Add('DatasnapContext=datasnap/');
      SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=20.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
      SQLConnection1.Params.Add('Filters={}');

      SQLConnection1.Open; //
      SQLConnection1.Connected := True;
      cdsAluno.Open;
      if SQLConnection1.Connected then
      begin
        editHost.Enabled := false;
        editPorta.Enabled := false;
        btnConectar.Caption := 'DESCONECTAR';
      end else
      begin
        editHost.Enabled := true;
        editPorta.Enabled := true;
        btnConectar.Caption := 'CONECTAR';
      end;
  end else
  begin
      cdsAluno.Close;
      SQLConnection1.Connected := false;
      SQLConnection1.Close;

      if Not SQLConnection1.Connected then
      begin
        editHost.Enabled := true;
        editPorta.Enabled := true;
        btnConectar.Caption := 'CONECTAR';
      end;
  end;

end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
ser: TServerMethods1Client;
cdsteste: TDataSet;
arquivoJson: TJSONArray;
fotoStream : TStream;
begin
  // memo1.Lines.Text :=(gsAppPath);

  {
  if SQLConnection1.Connected then
  begin
      ser := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
      showmessage(ser.FuncaoTeste);
      cdsteste := ser.getAlunos;

      while not(cdsteste.Eof ) do
      begin
          ShowMessage(cdsteste.FieldByName('nomealuno').AsString);
          cdsteste.Next;
      end;
  end;
  }

  // Assimila foto do servidor
  if SQLConnection1.Connected then
  begin
      ser := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
      fotoStream := ser.getFotoAluno(cdsAlunoidAluno.AsInteger);
      if not(fotoStream = nil)then
      begin
        Image1.Picture.Bitmap.LoadFromStream(fotoStream);
      end else
      begin
        Image1.Picture := nil;
      end;

  end;

end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
ser: TServerMethods1Client;
fotoStream : TmemoryStream;
begin
  // Assimila foto do servidor
  if SQLConnection1.Connected then
  begin
      ser := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
      {
      fotoStream := TMemoryStream.Create; //Memory
      Image1.Picture.Bitmap.SaveToStream(fotoStream);
      ShowMessage(IntToStr(fotoStream.Size));
      if(ser.setFotoAluno(fotoStream, cdsAlunoidAluno.AsInteger) = true)then
      begin
        ShowMessage('imagem enviada com sucesso.');
        ShowMessage(IntToStr(fotoStream.Size));
      end else
      begin
        ShowMessage('falha ao enviar imagem.');
      end;
      }

  end;
end;

procedure TfrmPrincipal.button3Click(Sender: TObject);
var
  ser: TServerMethods1Client;
  ms: TStream;
  jsa: TJSONArray;
  picType : integer;
begin
  if SQLConnection1.Connected then
  begin
    ser := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
    ms := TMemoryStream.Create;
    Image1.Picture.Graphic.SaveToStream(ms);
    ms.Position := 0;
    jsa := TJSONArray.Create;
    jsa := TDBXJSONTools.StreamToJSON(ms, 0, ms.Size) ;
    ser.uploadPicture(jsa);
  end;

end;

end.
