unit UntTotalStaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB;

type
  TfmTotalStaff = class(TfmBase)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnpagedown: TBitBtn;
    BitBtn7: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbtop: TComboBox;
    dsview: TDataSource;
    DBGrid2: TDBGrid;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure gridtitle(grid:tdbgrid;index:integer;days:integer);
  end;

var
  fmTotalStaff: TfmTotalStaff;

implementation

uses untdatadm, Udlgtotalselect,fm_SetColumn, func;

{$R *.dfm}
//////////////////////////
procedure TfmTotalStaff.gridtitle(grid:tdbgrid;index:integer;days:integer);
var
  i,j,t:integer;
  s:string;
begin
  if days in [1,3,5,7,8,10,12] then  j:=31;
  if days= 2 then j:=29;
  if days in [4,6,9,11]then  j:=30;
  t:= j div 3;
  grid.Columns.Clear;
  grid.Columns.add.FieldName:='part_name';
  grid.Columns.Items[0].Title.Caption:='部门名称';
  grid.Columns.Items[0].Width:=100;
  case index of
  1 :begin
       for i:=1 to t do
       begin
         if length(inttostr(i))=2 then
         begin
           s:=inttostr(i)+'日';
         end else
         begin
           s:='0'+inttostr(i)+'日';
         end;
         grid.Columns.add.FieldName:=s;
         grid.Columns[i].Width:=70;
       end;
     end;
   2 :begin
       for i:=11 to j-t do
       begin
         s:=inttostr(i)+'日';
         grid.Columns.add.FieldName:=s;
         grid.Columns[i-10].Width:=70;
       end;
     end;
   3 :begin
       for i:=21 to j do
       begin
         s:=inttostr(i)+'日';
         grid.Columns.add.FieldName:=s;
         grid.Columns[i-20].Width:=70;
       end;
     end;
   4 :begin
       for i:=1 to j do
       begin
         if length(inttostr(i))=2 then
         begin
           s:=inttostr(i)+'日';
         end else
         begin
           s:='0'+inttostr(i)+'日';
         end;
         grid.Columns.add.FieldName:=s;
         grid.Columns[i].Width:=70;
       end;
     end;
  end;
end;
///////////////////////////
procedure TfmTotalStaff.BitBtn7Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmTotalStaff.BitBtn1Click(Sender: TObject);
begin
  inherited;
  dlgtotalselect:=tdlgtotalselect.Create(self);
  dlgtotalselect.ShowModal;
  dlgtotalselect.Free;
end;

procedure TfmTotalStaff.FormShow(Sender: TObject);
begin
  inherited;
  dlgtotalselect:=tdlgtotalselect.Create(self);
  dlgtotalselect.ShowModal;
  dlgtotalselect.Free;
end;

procedure TfmTotalStaff.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if dbgrid1.Visible then
    dbgCur:=dbgrid1;
  if dbgrid2.Visible then
     dbgCur:=dbgrid2;
  with TfmSetColumn.Create(Self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfmTotalStaff.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid2.DataSource.DataSet.Active ) then exit;
   if trim(column.Field.AsString)='' then exit;
    sortgrid(column.Field.FieldName,dmmain.DSquery,dbgrid2,column);

end;

procedure TfmTotalStaff.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmmain.DSquery.close;
  dmmain.DSquery.Data:=null;
end;

procedure TfmTotalStaff.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if (not dbgrid1.DataSource.DataSet.Active ) then exit;
  if trim(column.Field.AsString)='' then exit;
  sortgrid(column.Field.FieldName,dmmain.DSquery,dbgrid1,column);
end;

procedure TfmTotalStaff.DBGrid2DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid2,2);
end;

procedure TfmTotalStaff.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

procedure TfmTotalStaff.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid2,2);
end;

procedure TfmTotalStaff.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  setdbgrid(dbgrid1,2);
end;

end.
