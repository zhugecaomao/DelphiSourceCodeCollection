unit Untbasegrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, ExtCtrls, Grids,inifiles, Buttons;

type
  TfmBasegrid = class(TfmBase)
    Panel1: TPanel;
    Gridbase: TStringGrid;
    Panel2: TPanel;
    RD: TRadioGroup;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure GridbaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridbaseSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridbaseDblClick(Sender: TObject);
    procedure RDClick(Sender: TObject);
    procedure GridbaseKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    pcol,prow:integer;
    procedure forminit;
    procedure refiledata(itemindexs:integer);
    procedure savefiledata(itemindexs:integer);
  public
    { Public declarations }
  end;

var
  fmBasegrid: TfmBasegrid;

implementation

{$R *.dfm}
procedure tfmBasegrid.forminit;
begin
  gridbase.Cells[0,0]:='序号';
  gridbase.Cells[1,0]:='字段名称';
  gridbase.Cells[2,0]:='字段宽度';
  gridbase.Cells[3,0]:='是否显示';
  gridbase.ColWidths[0]:=30;
  refiledata(rd.ItemIndex);
end;
procedure tfmBasegrid.refiledata(itemindexs:integer);
var
  fl:tinifile;
  colcounts,i:integer;
  colsum,j,d:string;
begin
  for i:=1 to gridbase.RowCount-1 do
  begin
    gridbase.Rows[i].Clear;
  end;
  gridbase.RowCount:=2;
  fl:=Tinifile.Create(ExtractFilePath(application.ExeName)+'SetCols.ini');    //字段列名
  j:=inttostr(itemindexs);
  colsum:=fl.ReadString(j,'ColSum','');  //字段总数;
  if trim(colsum)<>'' then
  begin
    colcounts:=strtoint(colsum);
    gridbase.RowCount:=colcounts+1;
    for i:=1 to colcounts do
    begin
      gridbase.Cells[0,i]:=inttostr(i);
      gridbase.Cells[1,i]:=fl.ReadString(j,'ColName'+inttostr(i),'');
      gridbase.Cells[2,i]:=fl.ReadString(j,'ColSize'+inttostr(i),'');
      d:=fl.ReadString(j,'ViewFlag'+inttostr(i),'');
      if d<>'' then
      begin
        case strtoint(d) of
          1: begin
               gridbase.Cells[3,i]:='√';
             end;
          2: begin
               gridbase.Cells[3,i]:='';
             end;
        end;
      end;
    end;
  end;
  fl.Free;
  fl:=nil;
end;
procedure TfmBasegrid.savefiledata(itemindexs:integer);
var
  fl:tinifile;
  i:integer;
  j:string;
begin
  fl:=Tinifile.Create(ExtractFilePath(application.ExeName)+'SetCols.ini');    //字段列名
  j:=inttostr(itemindexs);
  /////////删除以前的
  fl.DeleteKey(j,'ColSum');
  fl.DeleteKey(j,'ColName');
  fl.DeleteKey(j,'ViewFlag');
  fl.DeleteKey(j,'ColSize');
  ////////////////////////
  fl.WriteString(j,'ColSum',inttostr(gridbase.RowCount-1));
  for i:=1 to gridbase.RowCount-1 do
  begin
    fl.WriteString(j,'ColName'+inttostr(i),trim(gridbase.Cells[1,i]));
    fl.WriteString(j,'ColSize'+inttostr(i),trim(gridbase.Cells[2,i]));
    if trim(gridbase.Cells[3,i])='' then
    begin
      fl.WriteString(j,'ViewFlag'+inttostr(i),'2');
    end else
    begin
      fl.WriteString(j,'ViewFlag'+inttostr(i),'1');
    end;
  end;
  fl.Free;
  fl:=nil;
end;
///////////////////////////////////////////
procedure TfmBasegrid.FormShow(Sender: TObject);
begin
  inherited;
  forminit;
end;

procedure TfmBasegrid.GridbaseDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
 with Sender as Tstringgrid do
        begin
        if gdSelected in State then
        Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
        Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
        if gdFocused in State then
        Canvas.DrawFocusRect(Rect);
        end;

//不但水平居中，还垂直居中
with Sender as Tstringgrid do
    begin
      Canvas.FillRect(Rect);
      s:=Cells[ACol,ARow];
      r:=Rect;
      DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
    end;

end;

procedure TfmBasegrid.GridbaseSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
  if pcol=2 then
  begin
    gridbase.Options:=gridbase.Options+[goediting];
  end;
end;

procedure TfmBasegrid.GridbaseDblClick(Sender: TObject);
begin
  inherited;
  if pcol=3 then
  begin
    if prow=0 then exit;
    if trim(gridbase.Cells[3,prow])='' then
    begin
      gridbase.Cells[3,prow]:='√';
    end else
    begin
      gridbase.Cells[3,prow]:='';
    end;
  end;
end;

procedure TfmBasegrid.RDClick(Sender: TObject);
begin
  inherited;
  refiledata(rd.ItemIndex);
end;

procedure TfmBasegrid.GridbaseKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TfmBasegrid.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmBasegrid.btnOkClick(Sender: TObject);
begin
  inherited;
  savefiledata(rd.ItemIndex);
end;

end.
