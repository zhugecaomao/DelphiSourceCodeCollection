unit ChooseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls;

type
  Tchoose = class(TParent)
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  choose: Tchoose;


implementation

{$R *.dfm}
uses MainForm;
procedure Tchoose.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
      //设置表的字段宽度
  dbgrid1.Columns[0].Width:=96;
  dbgrid1.Columns[1].Width:=48;
  dbgrid1.Columns[2].Width:=128;
  dbgrid1.Columns[3].Width:=128;
  dbgrid1.Columns[4].Width:=80;
  dbgrid1.Columns[5].Width:=80;
  dbgrid1.Columns[6].Width:=80;
  dbgrid1.Columns[7].Width:=96;
  dbgrid1.Columns[8].Width:=80;
  dbgrid1.Columns[9].Width:=80;
  dbgrid1.Columns[10].Width:=80;
  dbgrid1.Columns[11].Width:=80;
  dbgrid1.Columns[12].Width:=80;
  dbgrid1.Columns[13].Width:=64;
  dbgrid1.Columns[14].Width:=64;
  dbgrid1.Columns[15].Width:=64;

end;

procedure Tchoose.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  //将选择的图书编号存入主窗体的储存区中并关闭窗体
  main.storestr:=dbgrid1.Fields[1].Text;
  close;

  


end;

end.
