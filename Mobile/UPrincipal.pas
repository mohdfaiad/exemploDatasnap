unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Data.SqlExpr, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.StdCtrls, System.Actions, FMX.ActnList, FMX.Objects,
  Fmx.Bind.Navigator;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    tiPrincipal: TTabItem;
    tiDetalhe: TTabItem;
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    cdsAluno: TClientDataSet;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    COD: TLabel;
    editCod: TEdit;
    NOME: TLabel;
    editNome: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    Rectangle1: TRectangle;
    EditHost: TEdit;
    EditPorta: TEdit;
    btnConectar: TButton;
    LinkListControlToField1: TLinkListControlToField;
    LiveBindingsBindNavigatePost1: TFMXBindNavigatePost;
    LiveBindingsBindNavigateCancel1: TFMXBindNavigateCancel;
    ChangeTabAction2: TChangeTabAction;
    CANCELAR: TButton;
    GRAVAR: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LiveBindingsBindNavigatePost1Execute(Sender: TObject);
    procedure LiveBindingsBindNavigateCancel1Execute(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.Surface.fmx MSWINDOWS}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm1.btnConectarClick(Sender: TObject);
begin {
      try
      SQLConnection1.Close;
      cdsAluno.close; //

      SQLConnection1.Params.Clear;
      SQLConnection1.Params.Add('DriverUnit=Data.DBXDataSnap');
      SQLConnection1.Params.Add('HostName='+ editHost.Text);
      SQLConnection1.Params.Add('Port='+ editPorta.Text);
      SQLConnection1.Params.Add('CommunicationProtocol=tcp/ip');
      SQLConnection1.Params.Add('DatasnapContext=datasnap/');
      SQLConnection1.Params.Add('DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Version=20.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b');
  }//    SQLConnection1.Params.Add('Filters={}');
  {
      SQLConnection1.Open; //
      SQLConnection1.Connected := True;
      cdsAluno.Open;
      except
        on E: Exception  do
        begin
        ShowMessage(e.message);
        end;
      end;
  }
  try
      if btnConectar.text = 'CONECTAR' then
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
            btnConectar.text := 'DESCONECTAR';
          end else
          begin
            editHost.Enabled := true;
            editPorta.Enabled := true;
            btnConectar.text := 'CONECTAR';
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
            btnConectar.text := 'CONECTAR';
          end;
      end;
  except
        on E: Exception  do
        begin
        ShowMessage(e.message);
        end;
      end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if(SQLConnection1.Connected = true)then
  begin
      try
        //Encerra conexão
        cdsAluno.Close;
        SQLConnection1.Connected := false;
        SQLConnection1.Close;
      except
        on E: Exception  do
        begin
        ShowMessage('Falha de Conexão. ' + #13 + e.message);
        end;
      end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
{
  try
  SQLConnection1.open;
  SQLConnection1.connected := True;
  cdsAluno.Open;
  Except
      On E:Exception Do
      begin
        ShowMessage( E.ClassType.ClassName + #13+ E.Message);
      end;
  End;
  }
end;

procedure TForm1.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  //
  ChangeTabAction1.ExecuteTarget(self);
end;

procedure TForm1.LiveBindingsBindNavigateCancel1Execute(Sender: TObject);
begin
  ChangeTabAction2.ExecuteTarget(self);
end;

procedure TForm1.LiveBindingsBindNavigatePost1Execute(Sender: TObject);
begin
   ChangeTabAction2.ExecuteTarget(self);
end;

end.
