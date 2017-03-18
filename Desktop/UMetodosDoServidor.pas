//
// Created by the DataSnap proxy generator.
// 18/03/2017 14:08:31
// 

unit UMetodosDoServidor;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FFuncaoTesteCommand: TDBXCommand;
    FgetAlunosCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function FuncaoTeste: string;
    function getAlunos: TDataSet;
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.FuncaoTeste: string;
begin
  if FFuncaoTesteCommand = nil then
  begin
    FFuncaoTesteCommand := FDBXConnection.CreateCommand;
    FFuncaoTesteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFuncaoTesteCommand.Text := 'TServerMethods1.FuncaoTeste';
    FFuncaoTesteCommand.Prepare;
  end;
  FFuncaoTesteCommand.ExecuteUpdate;
  Result := FFuncaoTesteCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.getAlunos: TDataSet;
begin
  if FgetAlunosCommand = nil then
  begin
    FgetAlunosCommand := FDBXConnection.CreateCommand;
    FgetAlunosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FgetAlunosCommand.Text := 'TServerMethods1.getAlunos';
    FgetAlunosCommand.Prepare;
  end;
  FgetAlunosCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FgetAlunosCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FgetAlunosCommand.FreeOnExecute(Result);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FFuncaoTesteCommand.DisposeOf;
  FgetAlunosCommand.DisposeOf;
  inherited;
end;

end.
