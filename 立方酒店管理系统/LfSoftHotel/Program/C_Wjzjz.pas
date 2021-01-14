unit C_Wjzjz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdJd, DosMove, StdCtrls, Buttons, ExtCtrls, Mask, DB, Grids,
  DBGrids, DBTables, C_Define;

type
  TWjzjzForm = class(TStdJdForm)
    Label2: TLabel;
    edtJzrq: TMaskEdit;
    Label3: TLabel;
    edtJzsj: TMaskEdit;
    radJzfs: TRadioGroup;
    Label4: TLabel;
    cmbJz: TComboBox;
    qryKrzd: TQuery;
    DBGrid1: TDBGrid;
    dsKrzd: TDataSource;
    qryKrzdD_KRXM: TStringField;
    qryKrzdD_ZDBH: TStringField;
    qryKrzdD_HH: TIntegerField;
    qryKrzdD_ZDLB: TStringField;
    qryKrzdD_KRBH: TStringField;
    qryKrzdD_YJBH: TStringField;
    qryKrzdD_KFBH: TStringField;
    qryKrzdD_SJFJ: TFloatField;
    qryKrzdD_XMBH: TStringField;
    qryKrzdD_XFDJ: TFloatField;
    qryKrzdD_XFSL: TFloatField;
    qryKrzdD_XFJE: TFloatField;
    qryKrzdD_XFRQ: TDateTimeField;
    qryKrzdD_XFSJ: TDateTimeField;
    qryKrzdD_YHJE: TFloatField;
    qryKrzdD_JZRQ: TDateTimeField;
    qryKrzdD_JZSJ: TDateTimeField;
    qryKrzdD_JZBZ: TStringField;
    qryKrzdD_JSBZ: TStringField;
    qryKrzdD_DLR1: TStringField;
    qryKrzdD_DLR2: TStringField;
    qryKrzdD_DLR3: TStringField;
    qryKrzdD_DLR4: TStringField;
    qryKrzdD_CZYXM: TStringField;
    qryKrzdD_JZYXM: TStringField;
    qryKrzdD_TYR: TStringField;
    qryKrzdD_BZ: TStringField;
    qryKrzdD_YSRQ: TStringField;
    qryKrzdD_JZBH: TStringField;
    qryKrzdD_BMBH: TStringField;
    procedure radJzfsClick(Sender: TObject);
    procedure edtJzrqExit(Sender: TObject);
    procedure edtJzsjExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FJzrq: TDateTime;
    FJzsj: TDateTime;
    FJzfs: string;
    FJzxx: TJZXX;
    FXykbh: string;
    FKhbh : string;
    function IsValid: Boolean;
  public
    { Public declarations }
  end;

var
  WjzjzForm: TWjzjzForm;

function Wjzjz: TJZXX;

implementation

uses C_HotelData;

{$R *.dfm}

function Wjzjz: TJZXX;
begin
  WjzjzForm := TWjzjzForm.Create(Application);
  try
    with WjzjzForm do
    begin
      edtJzrq.Text := FormatDateTime('yyyy-mm-dd',Date);
      edtJzsj.Text := FormatDateTime('hh:mm',Time);
      FJzrq := Date;
      FJzsj := Time;
      FJzfs := JZFS_RMB;
      qryKrzd.Open;
      ShowModal;
      if ModalResult = mrOK then
        FJzxx.AJzfs := '';
      Result := FJzxx;
    end;
  finally
    WjzjzForm.qryKrzd.Close;
    WjzjzForm.Free;
  end;
end;

procedure TWjzjzForm.radJzfsClick(Sender: TObject);
begin
  inherited;
  cmbJz.Items.Clear;
  cmbJz.Style := csDropDownList;
  case radJzfs.ItemIndex of
    0: FJzfs := JZFS_RMB;
    1:
      begin
        HotelData.ListMc(cmbJz,'XYK','D_XYKMC');
        FJzfs := JZFS_XYK;
      end;
    2: FJzfs := JZFS_ZP;
    3:
      begin
        cmbJz.Style := csDropDown;
        HotelData.ListDm(cmbJz,'KHDA','D_KHMC');
        FJzfs := JZFS_JZ;
      end;
    4: FJzfs := JZFS_GBK;
  end;
end;

function TWjzjzForm.IsValid: Boolean;
var
  s : string;
begin
  Result := False;
  case radJzfs.ItemIndex of
    1:
      begin
        FXykbh := HotelData.FindBh('XYK','D_XYKBH','D_XYKMC',cmbJz.Text);
        if FXykbh<>'' then
          Result := True
        else
          ShowInfo('请选择信用卡！');
      end;
    3:
      begin
        s := GetMc(cmbJz.Text);
        FKhbh := HotelData.FindBh('KHDA','D_KHBH','D_KHMC',s);
        if FKhbh<>'' then
          Result := True
        else
          ShowInfo('请选择记帐客户！');
      end;

    else
      Result := True;
  end;
  if qryKrzd.IsEmpty then Result := False;
end;

procedure TWjzjzForm.edtJzrqExit(Sender: TObject);
begin
  inherited;
  FJzrq := StrToDate(edtJzrq.Text);
end;

procedure TWjzjzForm.edtJzsjExit(Sender: TObject);
begin
  inherited;
  FJzsj := StrToTime(edtJzsj.Text);
end;

procedure TWjzjzForm.btnOKClick(Sender: TObject);
begin
  inherited;
  if not IsValid then Exit;
  SetLength(FJzxx.AJzfh,1);
  FJzxx.AJzfh[0] := qryKrzdD_ZDBH.Value;
  FJzxx.AKfbh := qryKrzdD_KFBH.Value+qryKrzdD_KRXM.Value;
  FJzxx.AJzrq := FJzrq;
  FJzxx.AJzsj := FJzsj;
  FJzxx.AJzfs := FJzfs;
  FJzxx.AXykbh:= FXykbh;
  FJzxx.AKhbh := FKhbh;
  FJzxx.AYjbh := qryKrzdD_YJBH.Value;
  FJzxx.AKrbh := qryKrzdD_KRBH.Value;
  //FJzxx.AKfbh := qryKrzdD_KRXM.Value;
  Close;

end;

end.
