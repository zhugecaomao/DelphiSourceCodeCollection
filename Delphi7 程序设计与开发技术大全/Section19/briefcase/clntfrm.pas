unit clntfrm;

{
  This is the client side of the Briefcase demo.  The Connected checkbox shows
  if the server is connected or not.  Notice that the FileName property of the
  ClientDataSet is set.  This causes the ClientDataSet to load from the file
  when it is opened and save to the file when it is closed.  It also has the
  ProviderName property set.  This allows it to ApplyUpdates and retrieve data
  if the file does not exist.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, MConnect, StdCtrls, Db, Grids, DBGrids, ActnList, ExtCtrls;

type
  TForm1 = class(TForm)
    DCOMConnection1: TDCOMConnection;
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    CheckBox1: TCheckBox;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure Action1Update(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action2Update(Sender: TObject);
    procedure ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses recerror;

{$R *.dfm}

procedure TForm1.Action1Update(Sender: TObject);
begin
  Action1.Checked := DCOMConnection1.Connected;
end;

procedure TForm1.Action1Execute(Sender: TObject);
begin
  DCOMConnection1.Connected := not Action1.Checked;
end;

procedure TForm1.Action2Update(Sender: TObject);
begin
  Action2.Enabled := ClientDataSet1.ChangeCount > 0;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  ClientDataSet1.ApplyUpdates(-1);
end;

procedure TForm1.ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
