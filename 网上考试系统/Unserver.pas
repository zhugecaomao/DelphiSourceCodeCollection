unit Unserver;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Proserver_TLB, StdVcl, DB, Provider, ADODB;

type
  Texamserver = class(TRemoteDataModule, Iexamserver)
    ADOConnection1: TADOConnection;
    DSManerge: TADODataSet;
    DSPManerge: TDataSetProvider;
    DSStudent: TADODataSet;
    DSExam: TADODataSet;
    DSInformation: TADODataSet;
    DSStatus: TADODataSet;
    DSPStudent: TDataSetProvider;
    DSPExam: TDataSetProvider;
    DSPInformation: TDataSetProvider;
    DSPStatus: TDataSetProvider;
    DSManergeDSDesigner: TWideStringField;
    DSManergeDSDesigner2: TWideStringField;
    DSManergeDSDesigner3: TSmallintField;
    DSkaojuan: TADODataSet;
    DSPKaojuan: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure Texamserver.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, Texamserver,
    Class_examserver, ciMultiInstance, tmApartment);
end.
