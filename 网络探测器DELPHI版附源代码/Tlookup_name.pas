unit Tlookup_name;

interface

uses
  Classes, SysUtils, SyncObjs, ComCtrls, CommCtrl;
type
  TmyLookUp_Name = class(TThread)
  private
    { Private declarations }
    tree_index : Longint;//
    ip_str : AnsiString;
  protected
    procedure Execute; override;
  public
    constructor Create(index : Longint;ip : AnsiString ;CreateSuspended: Boolean);
    procedure set_str;
  end;

implementation

uses function_1, main;

{ TmyLookUp_Name }

constructor TmyLookUp_Name.Create(index: Longint; ip: AnsiString;
  CreateSuspended: Boolean);
begin
  tree_index:=index;
  ip_str:=ip;
  FreeOnTerminate := True;

  inherited Create(CreateSuspended);
end;

procedure TmyLookUp_Name.Execute;
begin
  inherited;
  ip_str:=gethostbyip(ip_str);
  Synchronize(set_str);

end;

procedure TmyLookUp_Name.set_str;
var
  temp_node : TTreeNode;
begin
  temp_node:=frmMain.Tree_port.Items.GetNode(HTREEITEM(tree_index));
  temp_node.Text:=temp_node.Text+' : '+ ip_str;

end;

end.
