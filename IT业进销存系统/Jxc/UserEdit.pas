unit UserEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComEdit, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, db;

type
  TfrmUserEdit = class(TfrmComEdit)
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    procedure FormShow(Sender: TObject);override;
    procedure dsOnNewRecord(DataSet: TDataSet);override;
    function HavePopedom(strgName: string): boolean; //判断用户是否有此组所有权限
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserEdit: TfrmUserEdit;

implementation

uses Dm, Main, Common;

{$R *.DFM}

procedure TfrmUserEdit.FormShow(Sender: TObject);
begin
  strKeyFields := 'gName';
  //gName
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select gName from AppUserGroup';
    Open;
    DBComboBox1.Hint := Fields[0].AsString;
    DBComboBox1.Items.Clear;
    while not Eof do
    begin
      if HavePopedom(Fields[0].AsString) then
        DBComboBox1.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
  end;
  inherited;
end;

procedure TfrmUserEdit.dsOnNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsEdits.FieldByName('gName').AsString := DBComboBox1.Hint;
  with Data.Tmpf do
  begin
    Close;
    CommandText := 'select max(ID) from AppUser';
    Open;
    dsEdits.FieldByName('ID').AsInteger := Fields[0].AsInteger + 1;
  end;
end;

//判断用户是否有此组所有权限
function TfrmUserEdit.HavePopedom(strgName: string): boolean;
var
  strUsergName: string;
begin
  if pstrUserCode = 'SYS' then
  begin
    Result := True;
    exit;
  end;
  strUsergName := GetFieldValue('select gName from AppUser where ID=' + IntToStr(pintUserId));
  Result := ( GetFieldValue('select count(*) from AppGroupMenu ' +
        'where gName = ''' + strgName + ''' and ' +
        'mName not in (select mName from AppGroupMenu ' +
        'where gName = ''' + strUsergName + ''')' ) = 0 )
         and ( GetFieldValue('select count(*) from AppAction ' +
        'where mName in (select mName from AppGroupMenu ' +
        'where gname = ''' + strgName + ''') ' +
        'and mName+aName not in ' +
        '(select mName+aName from AppGroupAction ' +
        'where gname = ''' + strgName + ''') ' +
        'and mName+aName not in (select mName+aName from appaction ' +
        'where mname in (select mname from appgroupMenu ' +
        'where gname=''' + strUsergName + ''') ' +
        'and mName+aName not in ' +
        '(select mName+aName from AppGroupAction ' +
        'where gName=''' + strUsergname + '''))' ) = 0 );
end;

end.
