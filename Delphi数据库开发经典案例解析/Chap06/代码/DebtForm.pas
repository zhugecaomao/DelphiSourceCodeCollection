unit DebtForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TDebt = class(TParent)
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    MonthCalendar1: TMonthCalendar;
    BitBtn2: TBitBtn;
    DBEdit3: TDBEdit;
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure DBComboBox2DropDown(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Debt: TDebt;

implementation

{$R *.dfm}
uses ResideForm,MainForm;
//-------------------------------------------------------
//--------------------处理日历-----------------------
procedure TDebt.MonthCalendar1DblClick(Sender: TObject);
begin
  inherited;
  dbcombobox2.SelText:=datetostr(monthcalendar1.Date);
  monthcalendar1.Visible:=false;

end;

procedure TDebt.DBComboBox2DropDown(Sender: TObject);
begin
  inherited;
  //将数据文本框中的时间赋给日历
  if dbcombobox2.Text<>'' then
   monthcalendar1.Date:=strtodate(dbcombobox2.Text);
  //确定日历显示的位置
  monthcalendar1.Top:=dbcombobox2.Top+panel2.Top-monthcalendar1.Height;
  monthcalendar1.Left:=dbcombobox2.Left;
  monthcalendar1.Visible:=true;


end;

procedure TDebt.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  monthcalendar1.Visible:=false;
end;
//-------------------------------------------------------


procedure TDebt.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //设置表格宽度
  dbgrid1.Columns[0].Width:=80;
  dbgrid1.Columns[1].Width:=100;
  dbgrid1.Columns[2].Width:=100;
  dbgrid1.Columns[3].Width:=80;
  dbgrid1.Columns[4].Width:=80;
  dbgrid1.Columns[5].Width:=100;
end;

//---------------新建窗口选择入住单号------------------
procedure TDebt.BitBtn2Click(Sender: TObject);
var
 newform:TReside;
begin
 newform:=TReside.Create(application);
 newform.ToolButton6.Enabled:=false;
 newform.ToolButton7.Enabled:=false;
 newform.ToolButton8.Enabled:=false;
 newform.ToolButton10.Enabled:=false;
 newform.ToolButton11.Enabled:=false;
 newform.Caption:='双击表格选择入住单号';
end;

//-------------读入入住单-------------
procedure TDebt.FormActivate(Sender: TObject);
begin
  inherited;

  if panel2.Enabled=true then
    dbedit1.Text:=trim(main.RZNum);
end;

end.
