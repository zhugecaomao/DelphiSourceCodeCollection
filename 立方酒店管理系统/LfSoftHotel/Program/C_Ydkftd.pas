unit C_Ydkftd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, DB, DBTables,
  Mask, DBCtrls, Grids, ValEdit, DateUtils, C_Define;

type
  TYdkftdForm = class(TStdJdForm)
    Label10: TLabel;
    lblKrxm: TLabel;
    Label12: TLabel;
    lblDwmc: TLabel;
    tblYdkf: TTable;
    dsYdkf: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    lblBfh: TLabeledEdit;
    lblEfh: TLabeledEdit;
    lblFj: TLabeledEdit;
    btnInsert: TBitBtn;
    vleKf: TValueListEditor;
    btnYdqr: TBitBtn;
    btnYdqx: TBitBtn;
    lblState: TStaticText;
    btnTdjd: TBitBtn;
    tblYdkfD_YDBH: TStringField;
    tblYdkfD_KFBH: TStringField;
    tblYdkfD_KRBH: TStringField;
    tblYdkfD_KRXM: TStringField;
    tblYdkfD_YDRQ: TDateTimeField;
    tblYdkfD_DDRQ: TDateTimeField;
    tblYdkfD_DDSJ: TDateTimeField;
    tblYdkfD_LDRQ: TDateTimeField;
    tblYdkfD_LDSJ: TDateTimeField;
    tblYdkfD_XFJE: TFloatField;
    tblYdkfD_YDBZ: TStringField;
    tblYdkfD_RZBZ: TStringField;
    tblYdkfD_JSBZ: TStringField;
    tblYdkfD_CZYXM: TStringField;
    tblYdkfD_BZ: TStringField;
    procedure btnCancClick(Sender: TObject);
    procedure tblYdkfNewRecord(DataSet: TDataSet);
    procedure tblYdkfBeforePost(DataSet: TDataSet);
    procedure btnInsertClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnYdqrClick(Sender: TObject);
    procedure btnTdjdClick(Sender: TObject);
  private
    { Private declarations }
    FKrbh: string;
    FYdbh: string;
    FRzbz: string;
    IsAppend: Boolean;
    FDdrq,FDdsj,FLdrq,FLdsj: TDateTime;
    procedure UpdateYdkf;
    procedure ShowYdkf;
    procedure ShowState;
  public
    { Public declarations }
  end;

var
  YdkftdForm: TYdkftdForm;

procedure YdkftdNew(const AKrbh: string);
procedure YdkftdEdit(const AKrbh,AYdbh: string);

implementation

uses C_HotelData, C_Tdjd;

{$R *.dfm}

//新增预定
procedure YdkftdNew(const AKrbh: string);
begin
  YdkftdForm := TYdkftdForm.Create(Application);
  try
    with YdkftdForm do
    begin
      //初始化
      FKrbh    := AKrbh;
      FYdbh    := '';
      IsAppend := True;
      FRzbz    := 'F';
      lblKrxm.Caption := HotelData.FindUserBh('YDXX','D_KRXM','D_KRBH',FKrbh);
      lblDwmc.Caption := HotelData.FindUserBh('YDXX','D_DWMC','D_KRBH',FKrbh);
      
      try
        tblYdkf.Open;
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

      tblYdkf.Insert;

      ShowState;

      ShowModal;
    end;
  finally
    YdkftdForm.tblYdkf.Close;
    YdkftdForm.Free;
  end;
end;

//编辑预定
procedure YdkftdEdit(const AKrbh,AYdbh: string);
begin
  YdkftdForm := TYdkftdForm.Create(Application);
  try
    with YdkftdForm do
    begin
      FKrbh    := AKrbh;
      FYdbh    := AYdbh;
      IsAppend := False;
      lblKrxm.Caption := HotelData.FindUserBh('YDXX','D_KRXM','D_KRBH',FKrbh);
      lblDwmc.Caption := HotelData.FindUserBh('YDXX','D_DWMC','D_KRBH',FKrbh);
      try
        tblYdkf.Open;
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

      //显示已经预定的客房
      ShowYdkf;

      //编辑总单
      if tblYdkf.FindKey([FYdbh,'0']) then
      begin
        FRzbz := tblYdkfD_RZBZ.Value;
        tblYdkf.Edit;
      end;

      ShowState;
      
      ShowModal;
    end;
  finally
    YdkftdForm.tblYdkf.Close;
    YdkftdForm.Free;
  end;
end;

procedure TYdkftdForm.ShowState;
begin
  if FRzbz='T' then
  begin
    lblState.Caption    := '已确认';
    lblState.Font.Color := clGreen;
  end
  else
  begin
    lblState.Caption    := '未确认';
    lblState.Font.Color := clYellow;
  end;

  btnYdqr.Enabled := FRzbz<>'T';
  btnYdqx.Enabled := btnYdqr.Enabled;
  btnTdjd.Enabled := FRzbz<>'F';
end;

//显示预定客房
procedure TYdkftdForm.ShowYdkf;
begin
  tblYdkf.First;
  while not tblYdkf.Eof do
  begin
    if (tblYdkfD_YDBH.Value=FYdbh)and(tblYdkfD_KFBH.Value<>'0') then
    begin
      vleKf.InsertRow(tblYdkfD_KFBH.Value,tblYDkfD_XFJE.AsString,True);
    end;
    tblYdkf.Next;
  end;
end;

procedure TYdkftdForm.btnCancClick(Sender: TObject);
begin
  inherited;
  tblYdkf.Cancel;
end;

procedure TYdkftdForm.tblYdkfNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblYdkfD_YDRQ.Value := Date;
  tblYdkfD_DDRQ.Value := Tomorrow;
  tblYdkfD_DDSJ.Value := EnCodeTime(8,0,0,0);
  tblYdkfD_LDRQ.Value := IncDay(Tomorrow,1);
  tblYdkfD_LDSJ.Value := EnCodeTime(8,0,0,0);
  tblYdkfD_YDBZ.Value := YDKF_TD;
  tblYdkfD_KRBH.Value := FKrbh;
  tblYdkfD_KRXM.Value := lblKrxm.Caption;
  tblYdkfD_RZBZ.Value := 'F';
  tblYdkfD_JSBZ.Value := JS_NO;
  tblYdkfD_CZYXM.Value:= CZY.CzyXm;
end;

procedure TYdkftdForm.tblYdkfBeforePost(DataSet: TDataSet);
begin
  inherited;
  if IsAppend then
  begin
    FYdbh := HotelData.GetBh('D_YDBH',PREV_YDBH);
    tblYdkfD_YDBH.Value := FYdbh;
    tblYdkfD_KFBH.Value := '0';
  end;
end;

//插入客房
procedure TYdkftdForm.btnInsertClick(Sender: TObject);
var
  ABfh,AEfh,I,Row: Integer;
begin
  inherited;
  try
    if (lblBfh.Text='')or(lblEfh.Text='')or(lblFj.Text='') then
      raise Exception.Create('请输入完整数据！');

    ABfh := StrToInt(lblBfh.Text);
    AEfh := StrToInt(lblEfh.Text);
    
    if HotelData.CheckKfzt(IntToStr(AEfh))='' then Exit;
    if HotelData.CheckKfzt(IntToStr(ABfh))='' then Exit;

    if AEfh>=ABfh then
      for I := ABfh to AEfh do
        if (not vleKf.FindRow(IntToStr(I),Row))
          and(HotelData.IsValidKfyd(IntToStr(I),FYdbh,tblYdkfD_DDRQ.Value,tblYdkfD_LDRQ.Value)) then
            vleKf.InsertRow(IntToStr(I),lblFj.Text,True);

    lblBfh.Text := '';
    lblEfh.Text := '';
    lblFj.Text  := '';
    lblBfh.SetFocus;
  except
    raise;
  end;
end;

//更新预定客房
procedure TYdkftdForm.UpdateYdkf;
var
  i: Integer;
begin
  tblYdkf.DisableControls;
  for I:=1 to vleKf.RowCount-1 do
  begin
    if tblYdkf.FindKey([FYdbh,vleKf.Keys[i]]) then
    begin
      tblYdkf.Edit;
      tblYdkfD_KFBH.Value := vleKf.Keys[i];
      tblYdkfD_XFJE.Value := StrToCurr(vleKf.Values[vleKf.Keys[I]]);
      tblYdkfD_DDRQ.Value := FDdrq;
      tblYdkfD_DDSJ.Value := FDdsj;
      tblYdkfD_LDRQ.Value := FLdrq;
      tblYdkfD_LDSJ.Value := FLdsj;
      tblYdkfD_RZBZ.Value := FRzbz;
      tblYdkf.Post;
    end
    else
    begin
      tblYdkf.Insert;
      tblYdkfD_YDBH.Value := FYdbh;
      tblYdkfD_KFBH.Value := vleKf.Keys[i];
      tblYdkfD_XFJE.Value := StrToCurr(vleKf.Values[vleKf.Keys[I]]);
      tblYdkfD_DDRQ.Value := FDdrq;
      tblYdkfD_DDSJ.Value := FDdsj;
      tblYdkfD_LDRQ.Value := FLdrq;
      tblYdkfD_LDSJ.Value := FLdsj;
      tblYdkfD_RZBZ.Value := FRzbz;
      tblYdkf.Post;
    end;
  end;
  tblYdkf.EnableControls;
end;

//确定
procedure TYdkftdForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定修改') then Exit;
  if vleKf.Cells[0,1]='' then
    raise Exception.Create('请添加客房！');

  HotelData.DatabaseUser.StartTransaction;
  try
    //总单
    tblYdkfD_RZBZ.Value := FRzbz;
    tblYdkf.Post;
    FDdrq := tblYdkfD_DDRQ.Value;
    FDdsj := tblYdkfD_DDSJ.Value;
    FLdrq := tblYdkfD_LDRQ.Value;
    FLdsj := tblYdkfD_LDSJ.Value;

    IsAppend := False;
    UpdateYdkf;

    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;

  Close;
end;

procedure TYdkftdForm.btnYdqrClick(Sender: TObject);
begin
  inherited;
  if not HotelData.CheckYgqx(CZY.CzyBh,'预定确认') then Exit;
  if Confirm('你确认该团队的预定吗？') then
  begin
    FRzbz := 'T';
    ShowState;
  end;
end;

procedure TYdkftdForm.btnTdjdClick(Sender: TObject);
var
  AKfh,ASjfj: TDynamicArray;
  i         : Integer;
begin
  inherited;
  SetLength(AKfh,vleKf.RowCount-1);
  SetLength(ASjfj,vleKf.RowCount-1);

  for i:=1 to vleKf.RowCount - 1 do
  begin
    AKfh[i-1] := vleKf.Keys[i];
    ASjfj[i-1]:= vleKf.Values[vleKf.Keys[I]];
  end;

  //团队接待
  TdjdYd(tblYdkfD_KRXM.Value,AKfh,ASjfj);

  HotelData.DatabaseUser.StartTransaction;
  try
    //如果OK
    if TdjdForm.ModalResult <> mrOK then
      //HotelData.EmptyData('select * from YDKF where D_YDBH="'+FYdbh+'"');
      HotelData.EmptyData('delete from YDKF where D_YDBH="'+FYdbh+'"');
    HotelData.DatabaseUser.Commit;
  except
    HotelData.DatabaseUser.Rollback;
    raise;
  end;
  Close;
end;

end.
