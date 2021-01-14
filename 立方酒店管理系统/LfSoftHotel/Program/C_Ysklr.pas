unit C_Ysklr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Mask, DB, Grids,
  DBGrids, DBTables, C_Define;

type
  TYsklrForm = class(TStdJdForm)
    Label6: TLabel;
    edtXfrq: TMaskEdit;
    Label7: TLabel;
    edtXfsj: TMaskEdit;
    Label1: TLabel;
    lblKhmc: TLabel;
    qryYsk: TQuery;
    DBGrid1: TDBGrid;
    dsYsk: TDataSource;
    qryYskD_KHBH: TStringField;
    qryYskD_ZDBH: TStringField;
    qryYskD_HH: TIntegerField;
    qryYskD_XMBH: TStringField;
    qryYskD_XFDJ: TFloatField;
    qryYskD_XFSL: TFloatField;
    qryYskD_XFJE: TFloatField;
    qryYskD_XFRQ: TDateTimeField;
    qryYskD_XFSJ: TDateTimeField;
    qryYskD_CZYXM: TStringField;
    qryYskD_BZ: TStringField;
    qryYskD_XMMC: TStringField;
    Label8: TLabel;
    lblHj: TLabel;
    procedure qryYskNewRecord(DataSet: TDataSet);
    procedure qryYskBeforePost(DataSet: TDataSet);
    procedure qryYskAfterPost(DataSet: TDataSet);
    procedure qryYskD_XMBHValidate(Sender: TField);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancClick(Sender: TObject);
    procedure edtXfrqExit(Sender: TObject);
    procedure edtXfsjExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure qryYskD_XFJEValidate(Sender: TField);
  private
    { Private declarations }
    FKhbh: string;
    FZdbh: string;
    FBmbh: string;
    FXfrq: TDateTime;
    FXfsj: TDateTime;
    FHh  : Integer;
    FKey : string;
    FTotals: Currency;
    procedure UpdateTotals;
    procedure UpdateKrzd;
  public
    { Public declarations }
  end;

var
  YsklrForm: TYsklrForm;

procedure Ysklr(const AKhbh: string);

implementation

uses C_HotelData;

{$R *.dfm}

procedure Ysklr(const AKhbh: string);
begin
  YsklrForm := TYsklrForm.Create(Application);
  try
    with YsklrForm do
    begin
      FKhbh := AKhbh;
      FBmbh := HotelData.FindBh('YGDA','D_BMBH','D_YGBH',CZY.CzyBh);
      FZdbh := HotelData.GetBh('D_ZDBH',PREV_ZDBH);
      edtXfrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtXfsj.Text := FormatDateTime('hh:mm',Time);
      FXfrq        := Date;
      FXfsj        := Time;
      FHh          := 1;
      lblKhmc.Caption := HotelData.FindMc('KHDA','D_KHBH','D_KHMC',FKhbh);
      qryYsk.Close;
      qryYsk.ParamByName('KHBH').AsString := FKhbh;
      qryYsk.ParamByName('ZDBH').AsString := FZdbh;
      qryYsk.Open;
      ShowModal;
    end;
  finally
    YsklrForm.qryYsk.Close;
    YsklrForm.Free;
  end;
end;

procedure TYsklrForm.UpdateKrzd;
var
  AHh: Integer;
begin
  AHh := 1;
  qryYsk.First;
  while not qryYsk.Eof do
  begin
    HotelData.InsertKrzd(FZdbh,ZDLB_FYK,'','','',qryYskD_XMBH.Value,JZ_YES,JS_YES,FBmbh,ZDBZ_GZ+FKhbh,AHh,qryYskD_XFJE.Value,0);
    qryYsk.Next;
    Inc(AHh);
  end;
  HotelData.InsertKrzd(FZdbh,ZDLB_FYK,'','','','0',JZ_YES,JS_YES,FBmbh,ZDBZ_GZ+FKhbh,0,FTotals,0);
end;

//累计消费
procedure TYsklrForm.UpdateTotals;
var
  PrevRecord: TBookMark;
begin
  PrevRecord := qryYsk.GetBookmark;
  try
    qryYsk.DisableControls;
    FTotals := 0;
    qryYsk.First;
    while not qryYsk.Eof do
    begin
      FTotals := FTotals + qryYskD_XFJE.Value;
      qryYsk.Next;
    end;
    lblHj.Caption := CurrToStr(FTotals)+'元';
  finally
    qryYsk.EnableControls;
    if PrevRecord<>nil then
    begin
      qryYsk.GotoBookmark(PrevRecord);
      qryYsk.FreeBookmark(PrevRecord);
    end;
  end;
end;


procedure TYsklrForm.qryYskNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryYskD_KHBH.Value := FKhbh;
  qryYskD_ZDBH.Value := FZdbh;
  qryYskD_XFRQ.Value := FXfrq;
  qryYskD_XFSJ.Value := FXfsj;
  qryYskD_CZYXM.Value := CZY.CzyXm;
  
end;

procedure TYsklrForm.qryYskBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryYskD_HH.Value := FHh;
end;

procedure TYsklrForm.qryYskAfterPost(DataSet: TDataSet);
begin
  inherited;
  Inc(FHh);
  UpdateTotals;
end;

procedure TYsklrForm.qryYskD_XMBHValidate(Sender: TField);
begin
  inherited;
  if qryYskD_XMBH.Value = '' then
    raise Exception.Create('请录入消费项目！');
  //if qryYskD_XMBH.Value = XMBH_YJK then
    //raise Exception.Create('预交款不能录入！');
  if qryYskD_XMBH.Value = XMBH_CF then
    raise Exception.Create('请在餐饮管理系统->非餐费结帐中录入');
end;

procedure TYsklrForm.btnOKClick(Sender: TObject);
begin
  inherited;

  if qryYsk.IsEmpty then
  begin
    ShowWarning('请录入消费项目！');
    Exit;
  end;

  if not Confirm('你确认该客人的消费吗？') then
    Exit;

  if qryYsk.State in [dsInsert,dsEdit] then
  begin
    if qryYsk.FieldByName('D_XMBH').AsString = '' then
      qryYsk.Cancel
    else
      qryYsk.Post;
  end;

  //事务启动
  HotelData.DatabaseUser.StartTransaction;
  try
    qryYsk.ApplyUpdates;
    UpdateKrzd;
    //事务提交
    HotelData.DatabaseUser.Commit;
  except
    //事务回滚
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  qryYsk.CommitUpdates;

  Close;

end;

procedure TYsklrForm.btnCancClick(Sender: TObject);
begin
  inherited;
  qryYsk.CancelUpdates;
end;

procedure TYsklrForm.edtXfrqExit(Sender: TObject);
begin
  inherited;
  FXfrq := StrToDate(edtXfrq.Text);
end;

procedure TYsklrForm.edtXfsjExit(Sender: TObject);
begin
  inherited;
  FXfsj := StrToTime(edtXfsj.Text);
  DBGrid1.SetFocus;
end;

procedure TYsklrForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if DBGrid1.SelectedIndex=0 then
  begin
    if Ord(Key)=VK_BACK then FKey := ''
    else
    begin
      FKey := FKey + Key;
      if HotelData.tblXMDM.Locate('D_DM',FKey,[loPartialKey]) then
      begin
        qryYsk.Edit;
        qryYskD_XMBH.Value := HotelData.tblXMDM.FieldByName('D_XMBH').AsString;
      end;
    end;
  end;
end;

procedure TYsklrForm.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedIndex=0 then FKey := '';
end;

procedure TYsklrForm.qryYskD_XFJEValidate(Sender: TField);
begin
  inherited;
  if (qryYskD_XFJE.Value<=0)and(CZY.CzyXm <> '巢经理') then
    raise Exception.Create('消费金额必须大于零！');
end;

end.
