unit C_dcmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, Grids, DBGrids, StdCtrls, DosMove,
  Buttons, C_CtDefine;

type
  TDcmxForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dsCddm: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    tblCddm: TTable;
    dsCddmmj: TDataSource;
    tblCddmmj: TTable;
    Label1: TLabel;
    edtCdbh: TEdit;
    Label2: TLabel;
    edtSl: TEdit;
    Label3: TLabel;
    edtGg: TEdit;
    Label4: TLabel;
    edtJg: TEdit;
    DosMove1: TDosMove;
    btnClose: TBitBtn;
    btnOK: TBitBtn;
    Label5: TLabel;
    Splitter1: TSplitter;
    edtCm: TEdit;
    CheckBox1: TCheckBox;
    procedure edtCdbhKeyPress(Sender: TObject; var Key: Char);
    procedure edtCdbhExit(Sender: TObject);
    procedure edtSlKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure edtSlExit(Sender: TObject);
    procedure edtJgExit(Sender: TObject);
    procedure edtGgExit(Sender: TObject);
    procedure edtGgKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtCdbhDblClick(Sender: TObject);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtCmExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDcmx: TDcmx;
    procedure ShowDcxx;
    procedure InitDcxx;
  public
    { Public declarations }
    procedure Dcmx;
  end;

var
  DcmxForm: TDcmxForm;

implementation

uses C_ctdc, C_cddm, C_CtData;

{$R *.dfm}

//点菜
procedure TDcmxForm.Dcmx;
begin
  try
    tblCddm.Open;
    tblCddmmj.Open;
    //ShowModal;
    Show;
  finally
    //tblCddm.Close;
    //tblCddmmj.Close;
  end;
end;

//初始化
procedure TDcmxForm.InitDcxx;
begin
  edtCdbh.Text := '';
  edtSl.Text   := '1';
  edtJg.Text   := '0';
  edtGg.Text   := '1';
  FDcmx.ACdbh  := '';
  FDcmx.ACdmc  := '';
  FDcmx.AXfsl  := 1;
  FDcmx.AThsl  := 0;
  FDcmx.ADj    := 0;
  FDcmx.AXmbh  := '';
  //lblCm.Caption:= '';
  edtCm.Text   := '';
end;

procedure TDcmxForm.edtCdbhKeyPress(Sender: TObject; var Key: Char);
var
  s: string;
begin
  if (not(Key in ['0'..'9']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end
  else
  begin
    if Ord(Key)=VK_BACK then
      s := edtCdbh.Text
    else
      s := edtCdbh.Text + Key;
    tblCddm.Locate('D_CDBH',s,[loPartialKey]);
    tblCddmmj.Filter := 'D_MJ=''T'' and D_CDBH='''+s+'*''';
  end;
end;

//显示点菜信息
procedure TDcmxForm.ShowDcxx;
begin
  edtCm.Enabled  := edtCdbh.Text='0';
  if edtCdbh.Text='0' then
  begin
    edtSl.Text   := '1';
    edtGg.Text   := '1';
    edtJg.Text   := '0';
    //lblCm.Caption:= '未定义菜名';
    //FDcmx.ACdbh  := edtCdbh.Text;
    //FDcmx.ACdmc  := lblCm.Caption;
    //FDcmx.AXmbh  := XMBH_SP;
    //FDcmx.ADj    := 0;
    //FDcmx.AXfsl  := 1;
    edtCm.SetFocus;
    Exit;
  end;
  if not tblCddmmj.IsEmpty then
  begin
    edtCdbh.Text := tblCddmmj.FieldByName('D_CDBH').AsString;
    edtSl.Text   := '1';
    edtGg.Text   := '1';
    edtJg.Text   := CurrToStr(tblCddmmj.FieldbyName('D_DJ1').AsCurrency);
    //lblCm.Caption:= tblCddmmj.FieldByName('D_CDMC').AsString;
    edtCm.Text   := tblCddmmj.FieldByName('D_CDMC').AsString;
    FDcmx.ACdbh  := edtCdbh.Text;
    //FDcmx.ACdmc  := lblCm.Caption;
    FDcmx.ACdmc  := edtCm.Text;
    FDcmx.AXmbh  := tblCddmmj.FieldByName('D_XMBH').AsString;
    FDcmx.ADj    := tblCddmmj.FieldbyName('D_DJ1').AsCurrency;
    FDcmx.AXfsl  := 1;
    edtSl.SetFocus;
  end;
  //else
    //edtCdbh.SetFocus;
end;

procedure TDcmxForm.edtCdbhExit(Sender: TObject);
var
  s,bh : string;
begin
  if edtCdbh.Text <> '' then
  begin
    s  := edtCdbh.Text;
    if s = '0' then
    begin
      ShowDcxx;
      Exit;
    end;
    bh := CtData.FindBh('CDDM','D_CDBH','D_DM',s);
    if bh='' then
      bh := s;
    edtCdbh.Text := bh;
    tblCddm.Locate('D_CDBH',Copy(bh,1,2),[loPartialKey]);
    tblCddmmj.Filter := 'D_MJ=''T'' and D_CDBH='''+bh+'*''';
    ShowDcxx;
  end;
end;

procedure TDcmxForm.edtSlKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(Key in ['0'..'9','.']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

//确认
procedure TDcmxForm.btnOKClick(Sender: TObject);
begin
  if FDcmx.ACdbh = '' then
  begin
    ShowWarning('请输入菜单编号！');
    edtCdbh.SetFocus;
    Exit;
  end;
  if FDcmx.ACdmc = '' then
  begin
    ShowWarning('请输入菜单名称！');
    edtCm.SetFocus;
    Exit;
  end;

  if FDcmx.ADj = 0 then
  begin
    ShowWarning('请输入单价！');
    edtJg.SetFocus;
    Exit;
  end;

  CtdcForm.GetDcmx(FDcmx,CheckBox1.Checked);
  InitDcxx;
  edtCdbh.SetFocus;
end;

procedure TDcmxForm.edtSlExit(Sender: TObject);
begin
  FDcmx.AXfsl := StrToFloat(edtSl.Text);
  if FDcmx.AXfsl=0 then
    edtSl.SetFocus;
end;

procedure TDcmxForm.edtJgExit(Sender: TObject);
begin
  FDcmx.ADj := StrToCurr(edtJg.Text);
  //if FDcmx.ADj=0 then
    //edtJg.SetFocus;
end;
  
procedure TDcmxForm.edtGgExit(Sender: TObject);
var
  AGg: Integer;
begin
  AGg := StrToInt(edtGg.Text);
  FDcmx.ADj := tblCddmmj.FieldByName('D_DJ'+IntToStr(AGg)).AsCurrency;
  edtJg.Text := CurrToStr(FDcmx.ADj);
end;

procedure TDcmxForm.edtGgKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(Key in ['1'..'3']))and(Ord(Key)<>VK_BACK) then
  begin
    Key := #0;
    Beep;
  end;
end;

procedure TDcmxForm.DBGrid2DblClick(Sender: TObject);
begin
  ShowDcxx;
end;

procedure TDcmxForm.FormShow(Sender: TObject);
begin
  Left := 800 - Width;
  Top  := 0;
  InitDcxx;
  edtCdbh.SetFocus;
end;

procedure TDcmxForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDcmxForm.DBGrid1DblClick(Sender: TObject);
begin
  tblCddmmj.Filter := 'D_MJ=''T'' and D_CDBH='''+tblCddm.FieldByName('D_CDBH').AsString+'*''';
end;

procedure TDcmxForm.edtCdbhDblClick(Sender: TObject);
begin
  Cddmdy;
end;

procedure TDcmxForm.DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    btnOkClick(nil);
end;

procedure TDcmxForm.edtCmExit(Sender: TObject);
var
  ACdbh,ACdmc : string;
begin
  ACdmc := edtCm.Text;
  if ACdmc = '' then
  begin
    ShowWarning('请录入新增菜单名称！');
    //edtCm.SetFocus;
    Exit;
  end;
  ACdbh := CtData.InsertNewCd(ACdmc);
  edtCdbh.Text := ACdbh;
  FDcmx.ACdbh := ACdbh;
  FDcmx.ACdmc := ACdmc;
  FDcmx.AXmbh := XMBH_SP;
  FDcmx.ADj   := 0;
  FDcmx.AXfsl  := 1;
  edtSl.SetFocus;
end;

procedure TDcmxForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblCddm.Close;
  tblCddmmj.Close;
end;

end.
