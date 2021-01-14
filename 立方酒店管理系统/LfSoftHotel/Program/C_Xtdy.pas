unit C_Xtdy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, Grids, DBGrids, DosMove, DB, DBTables, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TXtdyForm = class(TStandForm)
    tblXtdy: TTable;
    dsXtdy: TDataSource;
    dbgXtdy: TDBGrid;
    cmbOption: TComboBox;
    cmbExpress: TComboBox;
    edtValue: TEdit;
    btnLoca: TBitBtn;
    btnPrint: TBitBtn;
    lblState: TStaticText;
    procedure dsXtdyStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tblXtdyBeforeDelete(DataSet: TDataSet);
    procedure btnLocaClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure tblXtdyPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tblXtdyBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FTag: Integer;
  public
    { Public declarations }
  end;
const
  infoConfirmDelete = '如果你已经使用了该纪录，删除它会影响数据统计的准确性，你确认一定要删除吗？';
  tagLC = 0;//楼层定义
  tagFX = 1;//房型定义
  tagDQ = 2;//地区定义
  tagGB = 3;//国别定义
  tagMZ = 4;//民族定义
  tagZJ = 5;//证件定义
  tagQZ = 6;//签证定义
  tagFL = 7;//客户分类
  tagCT = 8;//餐厅定义
  tagHC = 9;//会场定义
  tagXYK=10;//信用卡
  tagBM =11;//部门设置

  TableName_XTDY : array[0..11] of string
                   = ('LCDM',
                      'FXDM',
                      'DQDM',
                      'GBDM',
                      'MZDM',
                      'ZJDM',
                      'QZDM',
                      'FLDM',
                      'CTDM',
                      'HCDM',
                      'XYK',
                      'BMDM');
  TitleName_XTDY : array[0..11] of string
                   = ('楼层定义',
                      '房型定义',
                      '地区定义',
                      '国别定义',
                      '民族定义',
                      '证件定义',
                      '签证定义',
                      '客户分类',
                      '餐厅定义',
                      '会场定义',
                      '信用卡',
                      '部门设置');
  FieldName_XTDY : array[0..11,0..2] of string
                   = (('D_LCBH','D_LCMC','D_DM'),
                      ('D_FXBH','D_FXMC','D_DM'),
                      ('D_DQBH','D_DQMC','D_DM'),
                      ('D_GBBH','D_GBMC','D_DM'),
                      ('D_MZBH','D_MZMC','D_DM'),
                      ('D_ZJBH','D_ZJMC','D_DM'),
                      ('D_QZBH','D_QZMC','D_DM'),
                      ('D_FLBH','D_FLMC','D_DM'),
                      ('D_CTBH','D_CTMC','D_DM'),
                      ('D_HCBH','D_HCMC','D_DM'),
                      ('D_XYKBH','D_XYKMC','D_DM'),
                      ('D_BMBH','D_BMMC','D_DM'));

var
  XtdyForm: TXtdyForm;

procedure Xtdy(ATag: Integer);

implementation

uses C_Sysprint;

{$R *.dfm}

//系统定义
procedure Xtdy(ATag: Integer);
var
  AColumn: TColumn;
  I      : Integer;
begin
  XtdyForm := TXtdyForm.Create(Application);
  try
    with XtdyForm do
    begin
      FTag := ATag;
      tblXtdy.TableName := TableName_XTDY[ATag];
      lblTitle.Caption  := TitleName_XTDY[ATag];
      for I:= 0 to 2 do
      begin
        AColumn := dbgXtdy.Columns.Add;
        AColumn.FieldName := FieldName_XTDY[ATag,I];
        AColumn.Title.Alignment := taCenter;
        AColumn.Alignment       := taRightJustify;
        AColumn.Width := (dbgXtdy.Width div 3) - 15;
        case I of
        0: AColumn.Title.Caption := '编      号';
        1: AColumn.Title.Caption := '名      称';
        2: AColumn.Title.Caption := '代      码';
        end;
      end;
      try
        tblXtdy.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      ShowModal;
    end;
  finally
    XtdyForm.Free;
  end;
end;

procedure TXtdyForm.dsXtdyStateChange(Sender: TObject);
begin
  inherited;
  btnClose.Enabled            := tblXtdy.State = dsBrowse;
  btnPrint.Enabled            := btnClose.Enabled;
  dbgXtdy.Columns[0].ReadOnly := not (tblXtdy.State = dsInsert);
  case tblXtdy.State of
    dsInsert:
    begin
      lblState.Caption := '增加';
      lblState.Font.Color := clRed;
    end;
    dsEdit  :
    begin
      lblState.Caption := '修改';
      lblState.Font.Color := clBlue;
    end;
    dsBrowse:
    begin
      lblState.Caption := '浏览';
      lblState.Font.Color := clGreen;
    end;
    else      lblState.Caption := '';
  end;
end;

procedure TXtdyForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := tblXtdy.State = dsBrowse;
end;

procedure TXtdyForm.tblXtdyBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if not Confirm(infoConfirmDelete) then
    Abort;
end;

procedure TXtdyForm.btnLocaClick(Sender: TObject);
var
  LocaFieldName: string;
begin
  inherited;
  if cmbExpress.ItemIndex = 0 then
  begin
    if cmbOption.Text = '编号' then
      LocaFieldName := tblXtdy.Fields[0].FieldName;
    if cmbOption.Text = '名称' then
      LocaFieldName := tblXtdy.Fields[1].FieldName;
    tblXtdy.Locate(LocaFieldName,edtValue.Text,[])
  end;
end;

procedure TXtdyForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := TitleName_XTDY[FTag];
  APrintStru.ADataSet := tblXtdy;
  PrintLb(APrintStru,dbgXtdy);
end;

procedure TXtdyForm.tblXtdyPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  iDBIError: Integer;
begin
  inherited;
  if (E is EDBEngineError) then
  begin
    iDBIError := (E as EDBEngineError).Errors[0].ErrorCode;
    case iDBIError of
      eKeyViol: raise Exception.Create('编号必须唯一！');
      eRequiredFieldMissing: raise Exception.Create('数据不全！');
    end;
  end;
end;

procedure TXtdyForm.tblXtdyBeforePost(DataSet: TDataSet);
begin
  inherited;
  if DataSet.Fields[2].AsString = '' then
    DataSet.Fields[2].AsString := GetIndexStr(DataSet.Fields[1].AsString);
end;

end.
