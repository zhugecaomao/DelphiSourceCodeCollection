unit C_Ctkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DosMove, DB, DBTables, Buttons, Mask,
  DBCtrls, C_CtDefine;

type
  TCtktForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    tblCtdc: TTable;
    dsCtdc: TDataSource;
    DosMove1: TDosMove;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Bevel1: TBevel;
    lstCtmc: TListBox;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Edit3: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    tblCtdcD_DCBH: TStringField;
    tblCtdcD_CTBH: TStringField;
    tblCtdcD_XMBH: TStringField;
    tblCtdcD_DCLB: TStringField;
    tblCtdcD_XFRQ: TDateTimeField;
    tblCtdcD_XFSJ: TDateTimeField;
    tblCtdcD_SJDM: TStringField;
    tblCtdcD_KRSL: TIntegerField;
    tblCtdcD_YCBZ: TStringField;
    tblCtdcD_KRXM: TStringField;
    tblCtdcD_JSBZ: TStringField;
    tblCtdcD_JZFS: TStringField;
    tblCtdcD_KHBH: TStringField;
    tblCtdcD_XYKBH: TStringField;
    tblCtdcD_XFJE: TFloatField;
    tblCtdcD_YHJE: TFloatField;
    tblCtdcD_CZYXM: TStringField;
    tblCtdcD_YDBH: TStringField;
    tblCtdcD_BZ: TStringField;
    procedure tblCtdcNewRecord(DataSet: TDataSet);
    procedure tblCtdcBeforePost(DataSet: TDataSet);
    procedure btnCancClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    IsAppend: Boolean;
    FMulti: Boolean;
    FCtzt: TCtzt;
    FCtzts: TCtzts;
    FYcje: Currency;
    FYcbz: string;
    function IsValid: Boolean;
  public
    { Public declarations }
  end;

var
  CtktForm: TCtktForm;

procedure Ctkt(var ACtzt: TCtzt);
procedure Ctktxg(const ADcbh: string);
procedure Ctktm(ACtzts: TCtzts);

implementation

uses C_CtData, C_dcmx, C_ctdc;

{$R *.dfm}

//单个开台
procedure Ctkt(var ACtzt: TCtzt);
begin
  CtktForm := TCtktForm.Create(Application);
  try
    with CtktForm do
    begin
    //初始化
    IsAppend := True;
    FMulti := False;
    FCtzt := ACtzt;
    lstCtmc.Items.Clear;
    lstCtmc.Items.Add(FCtzt.ACtbh+' '+FCtzt.ACtmc);
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    RadioGroup1.ItemIndex := 0;

    tblCtdc.Open;
    tblCtdc.Insert;
    ShowModal;

    ACtzt := FCtzt;
    tblCtdc.Close;
    end;
  finally
    CtktForm.Free;
  end;

end;

//多个开台
procedure Ctktm(ACtzts: TCtzts);
var
  i: Integer;
begin
  CtktForm := TCtktForm.Create(Application);
  try
    with CtktForm do
    begin
    //初始化
    IsAppend := True;
    FMulti := True;
    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    RadioGroup1.ItemIndex := 0;
    FCtzts := ACtzts;
    FCtzt := FCtzts[0];
    lstCtmc.Items.Clear;
    for i:= Low(FCtzts) to High(FCtzts) do
      lstCtmc.Items.Add(FCtzts[i].ACtbh+' '+FCtzts[i].ACtmc);

    tblCtdc.Open;
    tblCtdc.Insert;

    ShowModal;
    tblCtdc.Close;

    end;
  finally
    CtktForm.Free;
  end;

end;

//修改
procedure Ctktxg(const ADcbh: string);
var
  ACtzt: TCtzt;
begin
  CtktForm := TCtktForm.Create(Application);
  try
    with CtktForm do
    begin
    IsAppend := False;
    FMulti := False;
    tblCtdc.Open;
    if tblCtdc.FindKey([ADcbh,'0']) then
    begin
      tblCtdc.Edit;
      ACtzt := CtData.GetCtzt(tblCtdcD_CTBH.Value);
    end;
    ShowModal;
    tblCtdc.Close;
    end;
  finally
    CtktForm.Free;
  end;

end;


procedure TCtktForm.tblCtdcNewRecord(DataSet: TDataSet);
begin
  tblCtdcD_CTBH.Value := FCtzt.ACtbh;
  tblCtdcD_KRSL.Value := 1;
  tblCtdcD_KRXM.Value := '零客';
  tblCtdcD_XFRQ.Value := Date;
  tblCtdcD_XFSJ.Value := Time;
  tblCtdcD_SJDM.Value := GetSjdm(Time);
  tblCtdcD_XMBH.Value := '0';
  tblCtdcD_DCLB.Value := DCLB_YC;
  tblCtdcD_JSBZ.Value := JS_NO;
  tblCtdcD_CZYXM.Value:= CZY.CzyXm;
end;

procedure TCtktForm.tblCtdcBeforePost(DataSet: TDataSet);
begin
  if IsAppend then
    tblCtdcD_DCBH.Value := CtData.GetBh('D_DCBH',PREV_DCBH);
end;

procedure TCtktForm.btnCancClick(Sender: TObject);
begin
  tblCtdc.Cancel;
end;

procedure TCtktForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (not(Key in ['0'..'9']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

function TCtktForm.IsValid: Boolean;
begin
  Result := True;
  FYcje  := 0;
  FYcbz  := '点菜';
  case RadioGroup1.ItemIndex of
    1:
    begin
      if Edit1.Text='' then
      begin
        ShowWarning('请输入用餐标准！');
        Result := False;
        Exit;
      end;
      try
        FYcje := StrToCurr(Edit1.Text);
        FYcbz := '1桌X'+Edit1.Text+'元';
      except
        Exit;
        raise;
      end;
    end;
    2:
    begin
      if (Edit2.Text='')or(Edit3.Text='') then
      begin
        ShowWarning('请输入用餐标准！');
        Result := False;
        Exit;
      end;
      try
        FYcje := StrToInt(Edit2.Text)*StrToCurr(Edit3.Text);
        FYcbz := Edit2.Text+'人X'+Edit3.Text+'元';
      except
        Exit;
        raise;
      end;

    end;
  end;
end;

//确认
procedure TCtktForm.btnOKClick(Sender: TObject);
var
  i    : Integer;
begin
  if not IsValid then Exit;

  CtData.DatabaseUser.StartTransaction;
  try
  if not FMulti then//单个
  begin
    tblCtdcD_YCBZ.Value := FYcbz;
    tblCtdc.Post;
    FCtzt.ACtbh := tblCtdcD_CTBH.Value;
    FCtzt.ACtzt := CTZT_USE;
    FCtzt.AKrxm := tblCtdcD_KRXM.Value;
    FCtzt.AKrsl := tblCtdcD_KRSL.Value;
    FCtzt.ADcbh := tblCtdcD_DCBH.Value;
    FCtzt.AXfrq := tblCtdcD_XFRQ.Value;
    FCtzt.AXfsj := tblCtdcD_XFSJ.Value;
    CtData.SetCtzt(FCtzt);
    if FYcje<>0 then
      CtData.InsertBzc(FCtzt.ADcbh,FCtzt.ACtbh,FCtzt.AXfrq,FYcje);
  end
  else
  begin
    tblCtdcD_YCBZ.Value := FYcbz;
    tblCtdc.Post;
    FCtzts[0].ACtzt := CTZT_USE;
    FCtzts[0].AKrxm := tblCtdcD_KRXM.Value;
    FCtzts[0].AKrsl := tblCtdcD_KRSL.Value;
    FCtzts[0].ADcbh := tblCtdcD_DCBH.Value;
    FCtzts[0].AXfrq := tblCtdcD_XFRQ.Value;
    FCtzts[0].AXfsj := tblCtdcD_XFSJ.Value;
    CtData.SetCtzt(FCtzts[0]);
    if FYcje<>0 then
      CtData.InsertBzc(FCtzts[0].ADcbh,FCtzts[0].ACtbh,FCtzts[0].AXfrq,FYcje);
    for i:=1 to High(FCtzts) do
    begin
      FCtzt := FCtzts[i];
      IsAppend := False;
      tblCtdc.Append;
      tblCtdcD_DCBH.Value := FCtzts[0].ADcbh;
      tblCtdcD_KRSL.Value := FCtzts[0].AKrsl;
      tblCtdcD_YCBZ.Value := FYcbz;
      tblCtdc.Post;
      FCtzts[i].ACtbh := FCtzt.ACtbh;
      FCtzts[i].ACtzt := CTZT_USE;
      FCtzts[i].AKrxm := FCtzts[0].AKrxm;
      FCtzts[i].AKrsl := FCtzts[0].AKrsl;
      FCtzts[i].ADcbh := FCtzts[0].ADcbh;
      FCtzts[i].AXfrq := FCtzts[0].AXfrq;
      FCtzts[i].AXfsj := FCtzts[0].AXfsj;
      CtData.SetCtzt(FCtzts[i]);
      if FYcje<>0 then
        CtData.InsertBzc(FCtzts[i].ADcbh,FCtzts[i].ACtbh,FCtzts[i].AXfrq,FYcje);
    end;
  end;

  CtData.DatabaseUser.Commit;
  
  except
    CtData.DatabaseUser.Rollback;
    raise;
  end;

end;

procedure TCtktForm.RadioGroup1Click(Sender: TObject);
var
  i: Integer;
begin
  i := RadioGroup1.ItemIndex;
  Edit1.Visible := (i=1)and(i<>0);
  Label6.Visible:= (i=1)and(i<>0);
  Edit2.Visible := (i=2)and(i<>0);
  Edit3.Visible := (i=2)and(i<>0);
  Label5.Visible:= (i=2)and(i<>0);
  Label7.Visible:= (i=2)and(i<>0);
end;

end.
