unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient;

type
  TServerMethods1 = class(TDSServerModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDConnection1: TFDConnection;
    qAluno: TFDQuery;
    pAluno: TDataSetProvider;
    cdsAluno: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function FuncaoTeste(): string;
    function getAlunos(): Tdataset;
    function FuncaoTeste2(): string;
    function getFotoAluno(codigoAluno:integer): TStream;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.FuncaoTeste: string;
begin
  result := 'Oi. Teste!';
end;


function TServerMethods1.FuncaoTeste2: string;
begin
  result := 'teste2';
end;

function TServerMethods1.getAlunos: Tdataset;
begin
  cdsAluno.Close;
  cdsAluno.Open;
  result := cdsAluno;
end;

function TServerMethods1.getFotoAluno(codigoAluno: integer): TStream;
var // http://www.devmedia.com.br/como-transferir-arquivos-entre-aplicacoes-cliente-servidor-com-datasnap/27093
  caminho : string;
begin

  IF (fileExists( 'c:\sogym\img_Aluno\'+ inttostr(codigoAluno) + '.bmp' ))THEN
  BEGIN
    caminho := 'c:\sogym\img_Aluno\'+ inttostr(codigoAluno) + '.bmp';
    Result := TFileStream.Create(caminho, fmOpenRead or fmShareDenyNone);
  end else
  begin
    Result := nil;
  end;


end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

