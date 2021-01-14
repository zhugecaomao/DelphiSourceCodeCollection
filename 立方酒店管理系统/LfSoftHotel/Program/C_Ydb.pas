unit C_Ydb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StandDb, DosMove, DB, DBTables, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, DBNavPlus, Grids, DBGrids, ComCtrls, ImgList, Mask;

type
  TYdbForm = class(TStandDbForm)
    qryWorkD_YDBH: TStringField;
    qryWorkD_HH: TIntegerField;
    qryWorkD_KRBH: TStringField;
    qryWorkD_YDRQ: TDateField;
    qryWorkD_YDSJ: TTimeField;
    qryWorkD_XFBH: TStringField;
    qryWorkD_XMMC: TStringField;
    qryWorkD_SL: TFloatField;
    qryWorkD_DJ: TCurrencyField;
    qryWorkD_JE: TCurrencyField;
    qryWorkD_RZ: TStringField;
    qryWorkD_CZYXM: TStringField;
    qryWorkD_BZ: TStringField;
    tblYdxx: TTable;
    qryWorkD_XM: TStringField;
    qryWorkD_DWMC: TStringField;
    btnKf: TSpeedButton;
    btnCt: TSpeedButton;
    btnHc: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgYdb: TDBGrid;
    ImageList1: TImageList;
    Panel4: TPanel;
    lstYd: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ImageList2: TImageList;
    tblKFDM: TTable;
    tblCTDM: TTable;
    tblHCDM: TTable;
    btnXq: TBitBtn;
    edtYdrq: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    procedure btnKfClick(Sender: TObject);
    procedure dbgYdbDblClick(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure lstYdSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ShowKf;
    procedure ShowCt;
    procedure ShowHc;
  public
    { Public declarations }
  end;

const
  //预定表
  YDB_KF   = 1;
  YDB_CT   = 2;
  YDB_HC   = 3;

  XFBH_YDB     : array[1..3] of string = ('00001',
                                          '00002',
                                          '00003');
  TitleName_YDB: array[1..3] of string = ('客房预定表',
                                          '餐厅预定表',
                                          '会场预定表');

var
  YdbForm: TYdbForm;

procedure Ydb(AYdxm: Integer;ADate: TDateTime);

implementation

uses C_Ydd, C_Define, C_Sysprint, C_HotelData, C_PickDate;

{$R *.dfm}

procedure Ydb(AYdxm: Integer;ADate: TDateTime);
begin
  if Application.FindComponent('YdbForm') is TYdbForm then
  begin
    ShowInfo('对不起，预定表正在运行中！');
    Exit;
  end;
  YdbForm := TYdbForm.Create(Application);
  try
    with YdbForm do
    begin
      PageControl1.ActivePageIndex := 1;
      edtYdrq.Text := FormatDateTime('yyyy-mm-dd',ADate);
      lblTitle.Caption := TitleName_YDB[AYdxm];
      qryWork.Params[0].Value := XFBH_YDB[AYdxm];
      qryWork.Params[1].Value := ADate;
      qryWork.Open;
      case AYdxm of
        1:
        begin
          btnKf.Down := True;
          ShowKf;
        end;
        2:
        begin
          btnCt.Down := True;
          ShowCt;
        end;
        3:
        begin
          btnHc.Down := True;
          ShowHc;
        end;
      end;

      ShowModal;
    end;
  finally
    YdbForm.qryWork.Close;
    YdbForm.Free;
  end;
end;

procedure TYdbForm.ShowKf;
var
  ListItem: TListItem;
begin
  lstYd.Items.BeginUpdate;
  lstYd.Items.Clear;
  tblKfdm.Open;
  qryWork.DisableControls;
  try
    tblKfdm.First;
    while not tblKfdm.Eof do
    begin
      ListItem := lstYd.Items.Add;
      ListItem.Caption := tblKfdm.FieldByName('D_KFBH').AsString;
      if qryWork.Locate('D_XMMC',ListItem.Caption,[]) then
      begin
        if qryWorkD_RZ.Value = RZ_YES then ListItem.ImageIndex := 3
        else
        if  qryWorkD_YDRQ.Value < Now then ListItem.ImageIndex := 2
        else
          ListItem.ImageIndex := 1;
      end
      else
        ListItem.ImageIndex := 0;
      tblKfdm.Next;
    end;
  finally
    lstYd.Items.EndUpdate;
    tblKfdm.Close;
    qryWork.EnableControls;
  end;
end;

procedure TYdbForm.ShowCt;
var
  ListItem: TListItem;
begin
  lstYd.Items.BeginUpdate;
  lstYd.Items.Clear;
  tblCtdm.Open;
  qryWork.DisableControls;
  try
    tblCtdm.First;
    while not tblCtdm.Eof do
    begin
      ListItem := lstYd.Items.Add;
      ListItem.Caption := tblCtdm.FieldByName('D_CTMC').AsString;
      if qryWork.Locate('D_XMMC',ListItem.Caption,[]) then
      begin
        if qryWorkD_RZ.Value = RZ_YES then ListItem.ImageIndex := 3
        else
        if  qryWorkD_YDRQ.Value < Now then ListItem.ImageIndex := 2
        else
          ListItem.ImageIndex := 1;
      end
      else
        ListItem.ImageIndex := 0;
      tblCtdm.Next;
    end;
  finally
    lstYd.Items.EndUpdate;
    tblCtdm.Close;
    qryWork.EnableControls;
  end;
end;

procedure TYdbForm.ShowHc;
var
  ListItem: TListItem;
begin
  lstYd.Items.BeginUpdate;
  lstYd.Items.Clear;
  tblHcdm.Open;
  qryWork.DisableControls;
  try
    tblHcdm.First;
    while not tblHcdm.Eof do
    begin
      ListItem := lstYd.Items.Add;
      ListItem.Caption := tblHcdm.FieldByName('D_HCMC').AsString;
      if qryWork.Locate('D_XMMC',ListItem.Caption,[]) then
      begin
        if qryWorkD_RZ.Value = RZ_YES then ListItem.ImageIndex := 3
        else
        if  qryWorkD_YDRQ.Value < Now then ListItem.ImageIndex := 2
        else
          ListItem.ImageIndex := 1;
      end
      else
        ListItem.ImageIndex := 0;
      tblHcdm.Next;
    end;
  finally
    lstYd.Items.EndUpdate;
    tblHcdm.Close;
    qryWork.EnableControls;
  end;
end;

procedure TYdbForm.btnKfClick(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := TitleName_YDB[(Sender as TSpeedButton).Tag];
  qryWork.DisableControls;
  try
    qryWork.Close;
    qryWork.Params[0].Value := XFBH_YDB[(Sender as TSpeedButton).Tag];
    qryWork.Params[1].Value := StrToDate(edtYdrq.Text);
    qryWork.Open;
    case (Sender as TSpeedButton).Tag of
      1: ShowKf;
      2: ShowCt;
      3: ShowHc;
    end;
  finally
    qryWork.EnableControls;
  end;
end;

procedure TYdbForm.dbgYdbDblClick(Sender: TObject);
begin
  inherited;
  YddEdit(qryWorkD_YDBH.Value);
end;

procedure TYdbForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  if cmbExpress.ItemIndex = 0 then
    if cmbOption.ItemIndex = 0 then
      qryWork.Locate('D_XMMC',edtValue.Text,[]);
end;

procedure TYdbForm.btnPrintClick(Sender: TObject);
var
  I         : Integer;
  APrintStru: TPrintStru;
  AColumns  : TStringList;
  APosition : TStringList;
  AFields   : TStringList;
begin
  APrintStru.ATitle := lblTitle.Caption;
  APrintStru.ADataSet := qryWork;
  AColumns := TStringList.Create;
  try
    APosition := TStringList.Create;
    try
      AFields := TStringList.Create;
      try
        for I:= 0 to 8 do
        begin
          AColumns.Add(dbgYdb.Columns[I].Title.Caption);
          AFields.Add(dbgYdb.Columns[I].FieldName);
        end;
        APosition.Add('10');
        APosition.Add('80');
        APosition.Add('160');
        APosition.Add('250');
        APosition.Add('320');
        APosition.Add('500');
        APosition.Add('600');
        APosition.Add('700');
        APosition.Add('800');
        APrintStru.AColumns := AColumns;
        APrintStru.AFields  := AFields;
        APrintStru.APosition:= APosition;
        APrintStru.AFs      := PRN_LandScape;
        SysPrint(APrintStru);
      finally
        AFields.Free;
      end;
    finally
      APosition.Free;
    end;
  finally
    AColumns.Free;
  end;
end;

procedure TYdbForm.lstYdSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  inherited;
  if Selected then
    qryWork.Locate('D_XMMC',Item.Caption,[]);
end;

procedure TYdbForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  PickDateForm.Date := StrToDate(edtYdrq.Text);
  if PickDateForm.ShowModal=mrOK then
    edtYdrq.Text := FormatDateTime('yyyy-mm-dd',PickDateForm.Date);
end;

end.
