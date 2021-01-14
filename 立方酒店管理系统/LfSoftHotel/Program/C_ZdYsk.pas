unit C_ZdYsk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, C_Define, Grids,
  DBGrids, DB, DBTables;

type
  TZdYskForm = class(TStdJdForm)
    Label1: TLabel;
    lblXfje: TLabel;
    Label3: TLabel;
    lblJsje: TLabel;
    Label5: TLabel;
    lblYjje: TLabel;
    Label7: TLabel;
    lblQzje: TLabel;
    Label9: TLabel;
    lblYjkc: TLabel;
    Label11: TLabel;
    lblYhje: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lblJzfs: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    lblJzrq: TLabel;
    lblJzsj: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    edtSjje: TEdit;
    DBGrid1: TDBGrid;
    tblYskjzls: TTable;
    dsYskjzls: TDataSource;
    tblKrjz: TTable;
    qryYskmx: TQuery;
    tblYskjzlsD_KHBH: TStringField;
    tblYskjzlsD_ZDBH: TStringField;
    tblYskjzlsD_HH: TIntegerField;
    tblYskjzlsD_XMBH: TStringField;
    tblYskjzlsD_XFJE: TCurrencyField;
    tblYskjzlsD_YJJE: TCurrencyField;
    tblYskjzlsD_YHJE: TCurrencyField;
    tblYskjzlsD_JZJE: TCurrencyField;
    tblYskjzlsD_JZBZ: TBooleanField;
    tblYskjzlsD_XFXM: TStringField;
    procedure tblYskjzlsBeforeDelete(DataSet: TDataSet);
    procedure tblYskjzlsBeforeInsert(DataSet: TDataSet);
    procedure tblYskjzlsAfterPost(DataSet: TDataSet);
    //procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
//    procedure tblYskjzD_YHJEValidate(Sender: TField);
//    procedure tblYskjzD_SJJEValidate(Sender: TField);
//    procedure edtSjjeExit(Sender: TObject);
  private
    { Private declarations }
    FJzxx: TYskJzxx;
    FXfje: Currency;//消费金额
    FYhje: Currency;//优惠金额
    FYjje: Currency;//预交款
    FSjje: Currency;//实结金额
    FJsje: Currency;//结算金额
    FQzje: Currency;//欠账金额
    FYjkc: Currency;//预交扣除
    FBfjz: Currency;//部分结帐金额
    FJzbh: string;
    FXfje1: Currency;
    FYjje1: Currency;
    FYhje1: Currency;
    procedure ShowJzfs;
    procedure ShowJzxx;
    procedure ShowZdmx;
    //function SumXfje: Currency;
    //function SumYjje: Currency;
    //procedure SumYhje;
    //procedure UpdateKrjz;
    //procedure AddKrjz(AHh: Integer;AXmbh: string;AXfje,AYjje,AYhje: Currency);
    //procedure UpdateYskz;
    //procedure EmptyYskz;
    //procedure BakYskjz;
  public
    { Public declarations }
  end;

var
  ZdYskForm: TZdYskForm;

procedure ZdYsk(AJzxx: TYskJzxx);

implementation

uses C_HotelData;

{$R *.dfm}

procedure ZdYsk(AJzxx: TYskJzxx);
begin
  ZdYskForm := TZdYskForm.Create(Application);
  try
    with ZdYskForm do
    begin
      //tblYskz.Open;
      //tblKrjz.Open;
      FJzxx := AJzxx;
      //FXfje := SumXfje;
      //FYjje := SumYjje;
      //FBfjz := FXfje;
      ShowJzfs;
      ShowJzxx;
      ShowZdmx;
      ShowModal;
    end;
  finally
    //ZdYskForm.tblYskz.Close;
    //ZdYskForm.tblKrjz.Close;
    ZdYskForm.Free;
  end;
end;

procedure TZdYskForm.ShowZdmx;
begin
  qryYskmx.Close;
  qryYskmx.Params[0].AsString := FJzxx.AKhbh;
  qryYskmx.Open;
  tblYskjzls.Close;
  tblYskjzls.EmptyTable;
  tblYskjzls.Open;
  qryYskmx.First;
  while not qryYskmx.Eof do
  begin
    tblYskjzls.Insert;
    tblYskjzlsD_KHBH.Value := FJzxx.AKhbh;
    tblYskjzlsD_ZDBH.Value := qryYskmx.FieldbyName('D_ZDBH').AsString;
    tblYskjzlsD_HH.Value   := qryYskmx.FieldbyName('D_HH').AsInteger;
    tblYskjzlsD_XMBH.Value := qryYskmx.FieldByName('D_XMBH').AsString;
    tblYskjzlsD_XFJE.Value := qryYskmx.FieldByName('D_XFJE').AsCurrency;
    tblYskjzlsD_YJJE.Value := qryYskmx.FieldByName('D_YJJE').AsCurrency;

    tblYskjzls.Post;
    qryYskmx.Next;
  end;
end;
{
procedure TZdYskForm.SumYhje;
var
  PrevRecord: TBookMark;
begin
  PrevRecord := tblYskz.GetBookmark;
  try
    tblYskz.DisableControls;
    FYhje := 0;
    FYjkc := 0;
    FBfjz := 0;
    tblYskz.First;
    while not tblYskz.Eof do
    begin
      if tblYskzD_XMBH.Value <> XMBH_YJK then
      begin
        FYhje := FYhje + tblYskzD_YHJE.Value;
        FBfjz := FBfjz + tblYskzD_SJJE.Value;
      end
      else
      begin
        FYjkc := FYjkc + tblYskzD_SJJE.Value;
      end;
      tblYskz.Next;
    end;
  finally
    tblYskz.EnableControls;
    if PrevRecord<>nil then
    begin
      tblYskz.GotoBookmark(PrevRecord);
      tblYskz.FreeBookmark(PrevRecord);
    end;
    ShowJzxx;
  end;
end;

function TZdYskForm.SumYjje: Currency;
var
  SqlStr: string;
begin
  SqlStr := 'select sum(D_XFJE) from YSKZ where '
           +'(D_KHBH="'+FJzxx.AKhbh+'")and(D_XMBH="'+XMBH_YJK+'")';
  Result := 0-HotelData.SumJe(SqlStr);
end;

function TZdYskForm.SumXfje: Currency;
var
  SqlStr: string;
begin
  SqlStr := 'select sum(D_XFJE) from YSKZ where '
           +'(D_KHBH="'+FJzxx.AKhbh+'")and(D_XMBH<>"0")and(D_XMBH<>"'
           +XMBH_YJK+'")';
  Result := HotelData.SumJe(SqlStr);
end;
}
procedure TZdYskForm.ShowJzfs;
begin
  lblJzfs.Caption := FJzxx.AJzfs;
  lblJzrq.Caption := FormatDateTime('yyyy-mm-dd',FJzxx.AJzrq);
  lblJzsj.Caption := FormatDateTime('hh:mm',FJzxx.AJzsj);
end;

procedure TZdYskForm.ShowJzxx;
begin
  FJsje := FBfjz-FYhje-FYjkc;
  if FJsje>=0 then
    FSjje := Trunc(FJsje+0.99)
  else
    FSjje := Trunc(FJsje-0.99);
  FQzje := FXfje-FYjje;
  lblYjkc.Caption := CurrToStr(FYjkc)+'元';
  lblXfje.Caption := CurrToStr(FXfje)+'元';
  lblYjje.Caption := CurrToStr(FYjje)+'元';
  lblYhje.Caption := CurrToStr(FYhje)+'元';
  lblJsje.Caption := CurrToStr(FJsje)+'元';
  lblQzje.Caption := CurrToStr(FQzje)+'元';
  edtSjje.Text := CurrToStr(FSjje);
end;

procedure TZdYskForm.tblYskjzlsBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TZdYskForm.tblYskjzlsBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TZdYskForm.tblYskjzlsAfterPost(DataSet: TDataSet);
begin
  inherited;
  //SumYhje;
end;
{
procedure TZdYskForm.btnCancClick(Sender: TObject);
begin
  inherited;
  //tblYskz.CancelUpdates;
end;
{
procedure TZdYskForm.AddKrjz(AHh: Integer;AXmbh: string;AXfje,AYjje,AYhje: Currency);
begin
  tblKrjz.Insert;
  tblKrjz.FieldByName('D_JZBH').AsString := FJzbh;
  tblKrjz.FieldByName('D_HH').AsInteger  := AHh;
  tblKrjz.FieldByName('D_XMBH').AsString := AXmbh;
  tblKrjz.FieldByName('D_XFJE').AsCurrency := AXfje;
  tblKrjz.FieldByName('D_YJJE').AsCurrency := AYjje;
  tblKrjz.FieldByName('D_YHJE').AsCurrency := AYhje;
  tblKrjz.FieldByName('D_JZFS').AsString := FJzxx.AJzfs;
  tblKrjz.FieldByName('D_JZLX').AsString := JZLX_YSK;
  tblKrjz.FieldByName('D_XYKBH').AsString := FJzxx.AXykbh;
  tblKrjz.FieldByName('D_KHBH').AsString  := FJzxx.AKhbh;
  tblKrjz.FieldByName('D_JZRQ').AsDateTime:= FJzxx.AJzrq;
  tblKrjz.FieldByName('D_JZSJ').AsDateTime:= FJzxx.AJzsj;
  tblKrjz.Post;
end;

procedure TZdYskForm.UpdateKrjz;
var
  AHh: Integer;
  AXmbh: string;
  AXfje,AYjje,AYhje: Currency;
begin
  FJzbh := HotelData.GetBh('D_JZBH',PREV_JZBH);
  AHh := 0;
  FXfje1 := 0;FYjje1 := 0;FYhje1 := 0;
  tblYskz.First;
  while not tblYskz.Eof do
  begin
    Inc(AHh);
    if tblYskzD_XMBH.Value<>XMBH_YJK then
      AXfje := tblYskzD_SJJE.Value
    else
      AXfje := 0-tblYskzD_SJJE.Value;
    AYjje := tblYskzD_YJJE.Value;
    AYhje := tblYskzD_YHJE.Value;
    AXmbh := tblYskzD_XMBH.Value;
    AddKrjz(AHh,AXmbh,AXfje,AYjje,AYhje);
    FXfje1 := FXfje1 + AXfje;
    FYjje1 := FYjje1 + AYjje;
    FYhje1 := FYhje1 + AYhje;
    tblYskz.Next;
  end;
  AHh := 0;
  AddKrjz(AHh,'0',FSjje+FYhje,FYjje1,FYhje1);
end;

procedure TZdYskForm.UpdateYskz;
begin
  tblYskz.First;
  while not tblYskz.Eof do
  begin
    tblYskz.Edit;
    if tblYskzD_XMBH.Value<>'0' then
    begin
      if tblYskzD_XMBH.Value<>XMBH_YJK then
        tblYskzD_XFJE.Value := tblYskzD_XFJE.Value-tblYskzD_SJJE.Value
      else
        tblYskzD_XFJE.Value := tblYskzD_XFJE.Value + tblYskzD_SJJE.Value;
      tblYskzD_SJJE.Value := 0;
    end
    else
    begin
      tblYskzD_XFJE.Value := tblYskzD_XFJE.Value - FXfje1;
      tblYskzD_YJJE.Value := tblYskzD_YJJE.Value + FYjje1;
      tblYskzD_YHJE.Value := tblYskzD_YHJE.Value + FYhje1;
    end;
    tblYskz.Post;
    tblYskz.Next;
  end;
end;

procedure TZdYskForm.EmptyYskz;
begin
  HotelData.EmptyData('select * from YSKZ where D_XFJE=0');
end;

procedure TZdYskForm.BakYskjz;
var
  SqlStr: string;
begin
  SqlStr := 'select * from KRJZ where D_JZBH="'+FJzbh+'"';
  HotelData.BakData(SqlStr,'YSKJZ.DB');
end;
}
procedure TZdYskForm.btnOKClick(Sender: TObject);
begin
  inherited;
{  try
    if FSjje<0 then
    begin
      ShowWarning('实结金额不能小于零！');
      Exit;
    end;
    tblYskz.DisableControls;
    UpdateKrjz;
    tblKrjz.ApplyUpdates;
    tblYskz.ApplyUpdates;
    tblYskz.CancelUpdates;
    tblYskz.Filtered := False;
    tblYskz.Filter := 'D_KHBH='''+FJzxx.AKhbh+'''';
    tblYskz.Filtered := True;
    UpdateYskz;
    tblYskz.ApplyUpdates;
    tblYskz.CancelUpdates;
    EmptyYskz;
  finally
    BakYskjz;
    tblYskz.EnableControls;
    Close;
  end;}
end;
{
procedure TZdYskForm.tblYskjzD_YHJEValidate(Sender: TField);
begin
  inherited;
  if tblYskzD_XMBH.Value='0' then Exit;
  if tblYskzD_XMBH.Value<>XMBH_YJK then
  begin
    if (tblYskzD_YHJE.Value>tblYskzD_XFJE.Value) then
      raise Exception.Create('优惠金额必须小于消费金额！');
  end
  else
  begin
    if not tblYskzD_YHJE.IsNull then
      raise Exception.Create('预交款不能优惠！');
  end;
end;

procedure TZdYskForm.tblYskjzD_SJJEValidate(Sender: TField);
begin
  inherited;
  if tblYskzD_XMBH.Value='0' then Exit;
  if tblYskzD_XMBH.Value<>XMBH_YJK then
  begin
    if (tblYskzD_SJJE.Value>tblYskzD_XFJE.Value) then
        raise Exception.Create('实结金额必须小于消费金额！');
  end
  else
  begin
    if (tblYskzD_SJJE.Value>0-tblYskzD_XFJE.Value) then
        raise Exception.Create('预交款扣除金额必须大于零并且小于预交款！');
  end;
end;

procedure TZdYskForm.edtSjjeExit(Sender: TObject);
var
  ASjje: Currency;
begin
  inherited;
  ASjje := StrToCurr(edtSjje.Text);
  if Abs(ASjje-FJsje)<=10 then FSjje := ASjje
  else
  begin
    ShowWarning('实结金额差额必须小于10元！');
    edtSjje.SetFocus;
  end;
end;
}
end.
