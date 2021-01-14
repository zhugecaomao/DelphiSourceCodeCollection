unit C_Yjxf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Stand, DosMove, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids,
  DBGrids, DB, DBTables, C_Define;

type
  TYjxfForm = class(TStandForm)
    DBGrid1: TDBGrid;
    ListView1: TListView;
    qryKrzd: TQuery;
    dsKrzd: TDataSource;
    qryXx: TQuery;
    btnBjyj: TBitBtn;
    qryKrzdD_ZDBH: TStringField;
    qryKrzdD_KRBH: TStringField;
    qryKrzdD_YJBH: TStringField;
    qryKrzdD_ZDLB: TStringField;
    qryKrzdD_KFBH: TStringField;
    qryKrzdD_KRXM: TStringField;
    qryKrzdD_SJFJ: TCurrencyField;
    qryKrzdD_YFJE: TCurrencyField;
    qryKrzdD_XFJE: TCurrencyField;
    qryKrzdD_YJYE: TCurrencyField;
    procedure dsKrzdDataChange(Sender: TObject; Field: TField);
    procedure btnBjyjClick(Sender: TObject);
    procedure qryKrzdCalcFields(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    //FFkfs: string;
    FKfbh: string;
    FKrxm: string;
    FZdbh: string;
    FKrbh: string;
    FYjbh: string;
    FYfje: Currency;
    FXfje: Currency;
    procedure ShowKfxx;
    function ShowYjxx(const AYjbh: string): Currency;
    function ShowXfxx(const AZdbh: string): Currency;
  public
    { Public declarations }
  end;

var
  YjxfForm: TYjxfForm;

procedure Yjxf;
procedure YjxfEnter(const AKfbh: string);
procedure YjxfEnter1(const AKrbh: string);

implementation

uses C_HotelData, C_Bjyj;

{$R *.dfm}

procedure Yjxf;
begin
  YjxfForm := TYjxfForm.Create(Application);
  try
    with YjxfForm do
    begin
      qryKrzd.Open;
      ShowModal;
    end;

  finally
    YjxfForm.qryKrzd.Close;
    YjxfForm.Free;
  end;

end;

procedure YjxfEnter(const AKfbh: string);
begin
  YjxfForm := TYjxfForm.Create(Application);
  try
    with YjxfForm do
    begin
      qryKrzd.Open;
      qryKrzd.Locate('D_KFBH',AKfbh,[]);
      ShowModal;
    end;

  finally
    YjxfForm.qryKrzd.Close;
    YjxfForm.Free;
  end;

end;

procedure YjxfEnter1(const AKrbh: string);
begin
  YjxfForm := TYjxfForm.Create(Application);
  try
    with YjxfForm do
    begin
      qryKrzd.Open;
      qryKrzd.Locate('D_KRBH',AKrbh,[]);
      ShowModal;
    end;

  finally
    YjxfForm.qryKrzd.Close;
    YjxfForm.Free;
  end;

end;

procedure TYjxfForm.ShowKfxx;
begin
  FKfbh := qryKrzd.FieldbyName('D_KFBH').AsString;
  FKrxm := qryKrzd.FieldbyName('D_KRXM').AsString;
  FZdbh := qryKrzd.FieldbyName('D_ZDBH').AsString;
  FKrbh := qryKrzd.FieldbyName('D_KRBH').AsString;
  FYjbh := qryKrzd.FieldbyName('D_YJBH').AsString;
  FYfje := qryKrzdD_YFJE.Value;
  FXfje := qryKrzdD_XFJE.Value;
  //FFkfs := HotelData.FindUserBh('KRYJ.DB','D_FKFS','D_YJBH',FYjbh);
end;

function TYjxfForm.ShowYjxx(const AYjbh: string): Currency;
var
  s: string;
begin
  s := 'select sum(D_YFJE) from KRYJ where (D_YJBH="'+AYjbh+'")and(D_FKFS="'+FKFS_RMB+'")';
  Result := HotelData.SumJe(s);
end;

function TYjxfForm.ShowXfxx(const AZdbh: string): Currency;
var
  s: string;
begin
  s := 'select sum(D_XFJE) from KRZD where (D_ZDBH="'+AZdbh+'")and(D_HH<>0)';
  Result := HotelData.SumJe(s);
end;

procedure TYjxfForm.dsKrzdDataChange(Sender: TObject; Field: TField);
var
  AListItem: TListItem;
  s : string;
begin
  inherited;
  ShowKfxx;
  with ListView1 do
  begin
    Items.BeginUpdate;
    Items.Clear;
    //if ((FYfje-FXfje)<100)and(FFkfs=FKFS_RMB) then
    if (FYfje-FXfje)<100 then
      Color := clRed
    else
      Color := clMoneyGreen;
    AListItem := Items.Add;
    AListItem.Caption := '房间号：';
    AListItem.SubItems.Add(FKfbh);
    AListItem.SubItems.Add('客人姓名：');
    AListItem.SubItems.Add(FKrxm);
    AListItem.SubItems.Add('押金余额：');
    //if FFkfs=FKFS_RMB then
      AListItem.SubItems.Add(CurrToStr(FYfje-FXfje)+'元');
    //else
      //AListItem.SubItems.Add('0元');
    AListItem := Items.Add;
    AListItem.Caption := '';
    AListItem := Items.Add;
    s := 'select * from KRYJ where (D_YJBH="'+FYjbh+'")and(D_FKFS="'+FKFS_RMB+'")';
    qryXx.Close;
    qryXx.SQL.Clear;
    qryXx.SQL.Add(s);
    qryXx.Open;
    qryXx.First;
    AListItem.Caption := '押金';
    AListItem.SubItems.Add('');
    AListItem.SubItems.Add('');
    AListItem.SubItems.Add('');
    AListItem.SubItems.Add('押金总计：');
    AListItem.SubItems.Add(CurrToStr(FYfje)+'元');
    while not qryXx.Eof do
    begin
      AListItem := Items.Add;
      AListItem.SubItems.Add(qryXx.FieldByName('D_YFRQ').AsString);
      AListItem.SubItems.Add(qryXx.FieldByName('D_FKFS').AsString);
      AListItem.SubItems.Add(qryXx.FieldByName('D_YFJE').AsString+'元');
      qryXx.Next;
    end;
    AListItem := Items.Add;
    AListItem.Caption := '';
    s := 'select * from KRZD where (D_ZDBH="'+FZdbh+'")and(D_HH<>0)';
    qryXx.Close;
    qryXx.SQL.Clear;
    qryXx.SQL.Add(s);
    qryXx.Open;
    qryXx.First;
    AListItem := Items.Add;
    AListItem.Caption := '消费';
    AListItem.SubItems.Add('');
    AListItem.SubItems.Add('');
    AListItem.SubItems.Add('');
    AListItem.SubItems.Add('消费总计：');
    AListItem.SubItems.Add(CurrToStr(FXfje)+'元');
    while not qryXx.Eof do
    begin
      AListItem := Items.Add;
      AListItem.SubItems.Add(qryXx.FieldByName('D_XFRQ').AsString);
      AListItem.SubItems.Add(HotelData.FindMc('XMDM.DB','D_XMBH','D_XMMC',qryXx.FieldByName('D_XMBH').AsString));
      AListItem.SubItems.Add(qryXx.FieldByName('D_XFJE').AsString+'元');
      qryXx.Next;
    end;

    Items.EndUpdate;
  end;
end;

procedure TYjxfForm.btnBjyjClick(Sender: TObject);
begin
  inherited;
  if qryKrzd.FieldByName('D_ZDLB').AsString = ZDLB_YK then
    BjyjEnter(FKfbh)
  else
    BjyjTd(FKrbh);
  qryKrzd.Close;
  qryKrzd.Open;
end;

procedure TYjxfForm.qryKrzdCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryKrzdD_YFJE.Value := ShowYjxx(qryKrzdD_YJBH.Value);
  qryKrzdD_XFJE.Value := ShowXfxx(qryKrzdD_ZDBH.Value);
  qryKrzdD_YJYE.Value := qryKrzdD_YFJE.Value-qryKrzdD_XFJE.Value;
end;

procedure TYjxfForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryKrzdD_YJYE.Value < 100 then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
