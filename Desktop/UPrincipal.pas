unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect,
  Data.SqlExpr, MIDASLIB;

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
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

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

end.
