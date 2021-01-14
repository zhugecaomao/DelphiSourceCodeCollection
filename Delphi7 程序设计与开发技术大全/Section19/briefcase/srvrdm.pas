unit srvrdm;

{
  This is the server DataModule of the Briefcase demo.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, DBClient, Server_TLB,
  Db, DBTables, Provider;

type
  TBriefCaseDemo = class(TRemoteDataModule, IBriefCaseDemo)
    Query1: TQuery;
    Session1: TSession;
    Database1: TDatabase;
    DataSetProvider1: TDataSetProvider;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BriefCaseDemo: TBriefCaseDemo;

implementation

class procedure TBriefCaseDemo.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

{$R *.dfm}

initialization
  TComponentFactory.Create(ComServer, TBriefCaseDemo,
    Class_BriefCaseDemo, ciMultiInstance, tmApartment);
end.
