unit Untbcaplr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, ExtCtrls, StdCtrls, Buttons, Grids;

type
  Tfmbcaplr = class(TfmBase)
    edticid: TLabeledEdit;
    edtno: TLabeledEdit;
    edtpartno: TLabeledEdit;
    edtperson: TLabeledEdit;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Gridbase: TStringGrid;
    SpeedButton3: TSpeedButton;
    cmbbcbh: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure GridbaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cmbbcbhChange(Sender: TObject);
  private
    { Private declarations }
    flag,pcol:integer;
    procedure forminit;
    procedure readdata;
  public
    { Public declarations }
    person:string;
  end;

var
  fmbcaplr: Tfmbcaplr;

implementation

uses untdatadm, func, Login_Man;

{$R *.dfm}
////////////////
procedure Tfmbcaplr.forminit;
var
  i:integer;
begin
  gridbase.ColWidths[0]:=10;
  for i:=1 to 31 do
  begin
    gridbase.Cells[i,0]:=inttostr(i)+'号';
    gridbase.ColWidths[i]:=70;
  end;
  if dmmain.cdsbcap.Active  then dmmain.cdsbcap.Close;
  dmmain.cdsbcap.Params.ParamByName('no').AsString:=trim(person);
  try
  dmmain.cdsbcap.Open;
  if dmmain.cdsbcap.IsEmpty  then
  begin
    flag:=1;
  end else
  begin
    flag:=2;
  end;
  readdata;
  except
  end;
end;
procedure tfmbcaplr.readdata;
var
  sql:widestring;
  datas:olevariant;
begin
  sql:='select bc_no from dp_bcjg';
  dmmain.CDSexecsql.Close;
  dmmain.CDSexecsql.Data:=null;
  try
    datas:=null;
    datas:=adisp.execSql(sql);
    if not varisnull(datas) then
    begin
      dmmain.CDSexecsql.Data:=datas;
      dmmain.CDSexecsql.Open;
      datas:=null;
    end;
    cmbbcbh.Clear;
    while not dmmain.CDSexecsql.Eof do
    begin
      cmbbcbh.Items.Add(trim(dmmain.CDSexecsql.fieldbyname('bc_no').asstring));
      dmmain.CDSexecsql.Next;
    end;
    dmmain.CDSexecsql.Close;
  except
  end;
end;
////////////////
procedure Tfmbcaplr.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfmbcaplr.GridbaseDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
//ydy add 设置显示颜色
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
  if (gdSelected in state) and (Arow=1) then
  begin
    Cmbbcbh.Top :=Rect.Top+gridbase.Top+2;
    Cmbbcbh.Left :=Rect.Left+gridbase.Left+2;
    cmbbcbh.Width:=gridbase.ColWidths[acol];
    cmbbcbh.Height:=gridbase.RowHeights[1];
    pcol:=acol;
    //其他属性可自主设置
    Cmbbcbh.Visible :=True;
    Cmbbcbh.Text:=trim(gridbase.Cells[acol,1]);
  end
  else Cmbbcbh.Visible :=False;
end;

procedure Tfmbcaplr.FormShow(Sender: TObject);
begin
  inherited;

  forminit;
end;

procedure Tfmbcaplr.btnOkClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if trim(edticid.Text)='' then
  begin
    application.MessageBox('请选择适用人员IC卡号！',pchar(application.Title),mb_iconinformation);
    edticid.SetFocus;
    exit;
  end;
  if flag=1 then
  begin
    dmmain.cdsbcap.Insert;
    dmmain.cdsbcap.FieldByName('person_no').AsString:=trim(edtno.Text);
    dmmain.cdsbcap.FieldByName('ic_id').AsString:=trim(edticid.Text);
    dmmain.cdsbcap.FieldByName('part_no').AsString:=trim(edtpartno.Text);
    dmmain.cdsbcap.FieldByName('person_name').AsString:=trim(edtperson.Text);
  end else
  begin
    dmmain.cdsbcap.Edit;
  end;
  for i:=1 to 31 do
  begin
    dmmain.cdsbcap.Fields.Fields[i+4].AsString:=trim(gridbase.Cells[i,1]);
  end;
  dmmain.cdsbcap.Post;
  try
    dmmain.cdsbcap.ApplyUpdates(-1);
    close;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit; 
  end;
end;

procedure Tfmbcaplr.cmbbcbhChange(Sender: TObject);
begin
  inherited;
  gridbase.Cells[pcol,1]:=trim(cmbbcbh.Text);
end;

end.
