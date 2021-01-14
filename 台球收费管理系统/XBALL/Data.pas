unit Data;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM = class(TDataModule)
    Ball01: TTable;
    Ball01s: TDataSource;
    Ball00: TTable;
    Ball00s: TDataSource;
    Rate: TTable;
    Rates: TDataSource;
    PassWord: TTable;
    Passs: TDataSource;
    Water: TTable;
    Waters: TDataSource;
    Ball02: TTable;
    Ball02s: TDataSource;
    State: TQuery;
    States: TDataSource;
    Ball03: TTable;
    Ball03s: TDataSource;
    procedure FlushBuffer(DataSet: TDataSet);
    procedure CommCardBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

procedure TDM.FlushBuffer(DataSet: TDataSet);
begin
  TTable(DataSet).FlushBuffers;
end;

procedure TDM.CommCardBeforePost(DataSet: TDataSet);
begin
  DataSet['Óà¶î'] :=
    DataSet.FieldByName('½ð¶î').AsCurrency -
    DataSet.FieldByName('´ÎÊý').AsInteger * 50;
end;

end.
