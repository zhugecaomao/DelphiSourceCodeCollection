unit Hp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList, db, IniFiles;

type
  TfrmHp = class(TfrmComJbzl)
    pnlList: TPanel;
    Splitter1: TSplitter;
    aList: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    N3: TMenuItem;
    I1: TMenuItem;
    N6: TMenuItem;
    I2: TMenuItem;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    StringGrid1: TStringGrid;
    procedure OpenDataSet;override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
    procedure dsAfterScroll(DataSet: TDataSet);override;
    procedure FormShow(Sender: TObject);override;
    procedure aListExecute(Sender: TObject);
    procedure pnlListResize(Sender: TObject);
    procedure aModifyExecute(Sender: TObject);override;
    procedure aNewExecute(Sender: TObject);override;
    procedure aSearchExecute(Sender: TObject);override;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHp: TfrmHp;

implementation

uses Dm, ComEdit, HpEdit, Main, Common;
{$R *.DFM}

procedure TfrmHp.OpenDataSet;
var
  strWhere: string;
begin
  //同时更新 frmHelp.FormShow
  dsJbzl.Close;
  case RadioGroup1.ItemIndex of
    0:   strWhere := 'where not H.ZT';
    1:   strWhere := 'where H.ZT';
    else strWhere := '';
  end;
//    '(select ID from HP where HP.ID=H.ID) as Tmp, ' +
  dsJbzl.CommandText :=
    'select H.*, ' +
    '(select top 1 0 from HP ) as Tmp, ' +
    '(select sum(JCS) from HPKC where HPID=H.ID) as aZKCL, ' +
    'iif(ZT,''是'',''否'') as aZT, ' +
    'switch(HPSXID=1,''库存商品'', HPSXID=2,''服务/劳务'', ' +
    'HPSXID=3,''其它收入'', HPSXID=4,''其它支出'', ' +
    'HPSXID=5,''折扣'') as aHPSX, ' +
    'L.MC as aHPLBMC ' +
    'from HP H inner join HPLB L on H.HPLBID=L.ID ' + strWhere + ' ' +
    'order by BH';
  inherited;
end;

procedure TfrmHp.FormShow(Sender: TObject);
var
  iniPos: TIniFile;
  i: integer;
begin
  inherited;
  //StringGrid
  with StringGrid1 do
  begin
    ColWidths[0] := 0;
    RowCount := DBGrid1.Columns.Count;
    for i := 0 to DBGrid1.Columns.Count - 1 do
    begin
      Cells[0, i] := DBGrid1.Columns[i].FieldName;
      Cells[1, i] := DBGrid1.Columns[i].Title.Caption;
      if (self.Canvas.TextWidth(Cells[1, i]) + 8) > ColWidths[1] then
        ColWidths[1] := self.Canvas.TextWidth(Cells[1, i]) + 8 + 20;
    end;
  end;
  //Pos
  iniPos := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\Lbzl.ini');
  with iniPos do
  begin
    pnlList.Width := ReadInteger(FormatFloat('0000', pintUserID) + self.Name, 'Width', pnlList.Width);
    aList.Checked := ReadBool(FormatFloat('0000', pintUserID) + self.Name, 'Show', aList.Checked);
  end;
  //Scroll
  if aList.Checked then
    dsAfterScroll(nil)
  else
    pnlList.Visible := aList.Checked;
end;

procedure TfrmHp.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmHpEdit.Create(self)) ;
	inherited;
end;

procedure TfrmHp.aDelExecute(Sender: TObject);
begin
  //同时更新 HpHelp
  strDetailTables := 'CGDD; CGSH; CGTH; XSDD; XSKD; XSTH; LL; TL; CPJC; ' +
    'QTKCBD; KCPD; CHTJ; CKDB';
  strDetailWheres := 'HPID = [ID]';
  inherited;
end;

procedure TfrmHp.dsAfterScroll(DataSet: TDataSet);
var
  i: integer;
begin
  inherited;
  if not pnlList.Visible then exit;
  if (StringGrid1.Cells[0, 0] = '') then exit;
  with StringGrid1 do
    for i := 0 to RowCount - 1 do
    begin
      Cells[2, i] := DBGrid1.DataSource.DataSet.FieldByName(Cells[0, i]).DisplayText;
    end;
  if dsJbzl.FieldByName('ID').AsString <> '' then
  begin
    //CK
    with Data.HpCkXx do
    begin
      Close;
      CommandText := 'select MC, ' +
        '(select JCS from HPKC where CKID = CK.ID and HPID = ' + dsJbzl.FieldByName('ID').AsString + ') as JCS ' +
        'from CK order by XH';
      Open;
    end;
    //SJ
    with Data.HpSjXx do
    begin
      Close;
      CommandText := 'select MC, ' +
        '(select SJ from HPSJ where SJZLID = SJZL.ID and HPID = ' + dsJbzl.FieldByName('ID').AsString + ') as SJ ' +
        'from SJZL order by XH';
      Open;
    end;
  end
  else
  begin
    //CK
    with Data.HpCkXx do
    begin
      Close;
      CommandText := 'select MC, ' +
        '0.0000001 as JCS ' +
        'from CK order by XH';
      Open;
    end;
    //SJ
    with Data.HpSjXx do
    begin
      Close;
      CommandText := 'select MC, ' +
        '0.0000001  as SJ ' +
        'from SJZL order by XH';
      Open;
    end;
  end;
end;

procedure TfrmHp.aListExecute(Sender: TObject);
begin
  aList.Checked := not aList.Checked;
  pnlList.Visible := aList.Checked;
  if aList.Checked then
    dsAfterScroll(nil);
  Splitter1.Visible := aList.Checked;
end;

procedure TfrmHp.pnlListResize(Sender: TObject);
begin
  StringGrid1.ColWidths[2] := StringGrid1.Width - StringGrid1.ColWidths[1] - 28 + 20;
  with DBGrid2 do
  begin
    Columns[0].Width := (Width - 28) div 2;
    Columns[1].Width := (Width - 28) - Columns[0].Width;
  end;
  with DBGrid3 do
  begin
    Columns[0].Width := (Width - 28) div 2;
    Columns[1].Width := (Width - 28) - Columns[0].Width;
  end;
end;

procedure TfrmHp.FormClose(Sender: TObject; var Action: TCloseAction);
var
  iniPos: TIniFile;
begin
  inherited;
  //Pos
  iniPos := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\Lbzl.ini');
  with iniPos do
  begin
    WriteInteger(FormatFloat('0000', pintUserID) + self.Name, 'Width', pnlList.Width);
    WriteBool(FormatFloat('0000', pintUserID) + self.Name, 'Show', aList.Checked);
  end;
end;

procedure TfrmHp.aModifyExecute(Sender: TObject);
begin
  inherited;
  dsAfterScroll(nil);
end;

procedure TfrmHp.aNewExecute(Sender: TObject);
begin
  inherited;
  dsAfterScroll(nil);
end;

procedure TfrmHp.aSearchExecute(Sender: TObject);
begin
  inherited;
  dsAfterScroll(nil);
end;

procedure TfrmHp.RadioGroup1Click(Sender: TObject);
begin
  OpenDataSet;
  DBGrid1.SetFocus;
end;

end.
