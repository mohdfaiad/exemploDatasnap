//
// Created by the DataSnap proxy generator.
// 19/03/2017 12:56:34
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
    FFuncaoTeste2Command: TDBXCommand;
    FgetFotoAlunoCommand: TDBXCommand;
    FsetFotoAlunoCommand: TDBXCommand;
    FuploadPictureCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function FuncaoTeste: string;
    function getAlunos: TDataSet;
    function FuncaoTeste2: string;
    function getFotoAluno(codigoAluno: Integer): TStream;
    function setFotoAluno(fotoStream: TMemoryStream; codigoAluno: Integer): Boolean;
    function uploadPicture(jsa: TJSONArray): string;
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

function TServerMethods1Client.FuncaoTeste2: string;
begin
  if FFuncaoTeste2Command = nil then
  begin
    FFuncaoTeste2Command := FDBXConnection.CreateCommand;
    FFuncaoTeste2Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFuncaoTeste2Command.Text := 'TServerMethods1.FuncaoTeste2';
    FFuncaoTeste2Command.Prepare;
  end;
  FFuncaoTeste2Command.ExecuteUpdate;
  Result := FFuncaoTeste2Command.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.getFotoAluno(codigoAluno: Integer): TStream;
begin
  if FgetFotoAlunoCommand = nil then
  begin
    FgetFotoAlunoCommand := FDBXConnection.CreateCommand;
    FgetFotoAlunoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FgetFotoAlunoCommand.Text := 'TServerMethods1.getFotoAluno';
    FgetFotoAlunoCommand.Prepare;
  end;
  FgetFotoAlunoCommand.Parameters[0].Value.SetInt32(codigoAluno);
  FgetFotoAlunoCommand.ExecuteUpdate;
  Result := FgetFotoAlunoCommand.Parameters[1].Value.GetStream(FInstanceOwner);
end;

function TServerMethods1Client.setFotoAluno(fotoStream: TMemoryStream; codigoAluno: Integer): Boolean;
begin
  if FsetFotoAlunoCommand = nil then
  begin
    FsetFotoAlunoCommand := FDBXConnection.CreateCommand;
    FsetFotoAlunoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsetFotoAlunoCommand.Text := 'TServerMethods1.setFotoAluno';
    FsetFotoAlunoCommand.Prepare;
  end;
  FsetFotoAlunoCommand.Parameters[0].Value.SetStream(fotoStream, FInstanceOwner);
  FsetFotoAlunoCommand.Parameters[1].Value.SetInt32(codigoAluno);
  FsetFotoAlunoCommand.ExecuteUpdate;
  Result := FsetFotoAlunoCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethods1Client.uploadPicture(jsa: TJSONArray): string;
begin
  if FuploadPictureCommand = nil then
  begin
    FuploadPictureCommand := FDBXConnection.CreateCommand;
    FuploadPictureCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FuploadPictureCommand.Text := 'TServerMethods1.uploadPicture';
    FuploadPictureCommand.Prepare;
  end;
  FuploadPictureCommand.Parameters[0].Value.SetJSONValue(jsa, FInstanceOwner);
  FuploadPictureCommand.ExecuteUpdate;
  Result := FuploadPictureCommand.Parameters[1].Value.GetWideString;
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
  FFuncaoTeste2Command.DisposeOf;
  FgetFotoAlunoCommand.DisposeOf;
  FsetFotoAlunoCommand.DisposeOf;
  FuploadPictureCommand.DisposeOf;
  inherited;
end;

end.

