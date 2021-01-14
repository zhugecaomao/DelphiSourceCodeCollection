{2004-3-1 用于零售服务中的员工管理。}
unit Unitygda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  StdCtrls, ImgList, Buttons,
  ComCtrls, Grids, db,adodb, XPMenu;

type
  Tfrmygda = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pc1: TPageControl;
    tjbqk: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    edtygbh: TLabeledEdit;
    edtygmc: TLabeledEdit;
    cbmmc: TComboBox;
    edtsfzh: TLabeledEdit;
    cygsex: TComboBox;
    cjg: TComboBox;
    Panel4: TPanel;
    cmz: TComboBox;
    edtic: TLabeledEdit;
    Label17: TLabel;
    cgzid: TComboBox;
    edtpym: TLabeledEdit;
    Label19: TLabel;
    cbgzlb: TComboBox;
    edtheadset: TLabeledEdit;
    edtaddress: TLabeledEdit;
    dtworkdate: TDateTimePicker;
    GroupBox1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbmmcExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbmmcChange(Sender: TObject);
    procedure edtsfzhExit(Sender: TObject);
    procedure edticKeyPress(Sender: TObject; var Key: Char);
    procedure edtygmcKeyPress(Sender: TObject; var Key: Char);
    procedure edtygmcExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbmmcKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure xsbcbh;
    procedure init;
    function ReadYG(TREEV:ttreeview;SNAME:STRING):string;
  public
    { Public declarations }
    //ygid:string;
    fg:integer;
    bm:string;
    //procedure bu;
  end;

var
  frmygda: Tfrmygda;


implementation

uses func, untdatadm, Unitdwzy;

{$R *.dfm}
procedure tfrmygda.init;
var
  sql:string;
  newdate,marks:string;
begin
  sql:=' select max(right(p_no,4)) from dp_person' ;
  marks:='';
  edtygbh.text:=setcode(sql,marks);
end;
procedure tfrmygda.xsbcbh;
begin
end;
function Tfrmygda.ReadYG(TREEV:ttreeview;SNAME:STRING):string;
VAR
  I:integer;
  m,t:string;
begin
  for i:=0 to treev.Items.Count-1 do
  begin
    m:= copy(trim(treev.Items.Item[i].Text),pos('_',trim(treev.Items.Item[i].Text))+1,length(trim(treev.Items.Item[i].Text))-pos('_',trim(treev.Items.Item[i].Text)));
    if m=sname then
    begin
      t:=copy(trim(treev.Items.Item[i].Text),1,pos('_',trim(treev.Items.Item[i].Text))-1);
    end;
  end;
  result:=t;
end;
///////////////////////自定义函数////////////////////////
procedure Tfrmygda.BitBtn2Click(Sender: TObject);
begin
  fg:=0;
  close;
end;

procedure Tfrmygda.FormShow(Sender: TObject);
begin
  {if not dm.aqrybm.IsEmpty then
  begin
    dm.aqrybm.First;
    while not dm.aqrybm.Eof do
    begin
      cbmmc.Items.Add(dm.aqrybm.fieldbyname('部门名称').AsString);
      dm.aqrybm.Next;
    end;
    dm.aqrybm.First;
  end; }
  //xsbcbh;
end;

procedure Tfrmygda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmygda.cbmmcExit(Sender: TObject);
begin
  //if fg=1 then ygidadd;
end;

procedure Tfrmygda.BitBtn1Click(Sender: TObject);
var
  err:exception;
begin
  if (cbmmc.Text='') or (edtygbh.Text ='') or (edtygmc.Text ='') or (edtsfzh.Text ='') then
  begin
    if cbmmc.Text ='' then
    begin
      application.MessageBox('请选择员工工作部门！',pchar(application.Title),mb_iconwarning);
      cbmmc.SetFocus;
      exit;
    end;
    if edtygbh.Text ='' then
    begin
      application.MessageBox('请选择员工编号！',pchar(application.Title),mb_iconwarning);
      edtygbh.SetFocus;
      exit;
    end;
    if edtygmc.Text ='' then
    begin
      application.MessageBox('请输入员工姓名！',pchar(application.Title),mb_iconwarning);
      edtygmc.SetFocus;
      exit;
    end;
    if edtsfzh.Text ='' then
    begin
      application.MessageBox('请输入员工身份证号！',pchar(application.Title),mb_iconwarning);
      edtsfzh.SetFocus;
      exit;
    end;
  end else
  begin
    if dmmain.cdspornal.Active then dmmain.cdspornal.Close;
    if fg=1 then
    begin
      dmmain.cdspornal.Params.ParamByName('p_no').AsString:='1'; //为新增员工时
    end else
    begin
      dmmain.cdspornal.Params.ParamByName('p_no').AsString:=trim(bm); //为edit员工时
    end;
    try
      dmmain.cdspornal.Open;
    except
      application.MessageBox('服务器故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
    if fg=1 then  //新增员工信息
    begin
      dmmain.cdspornal.Insert;
      dmmain.cdspornal.FieldByName('p_workname').AsString:= trim(cbmmc.Text); //工作部门35
      dmmain.cdspornal.FieldByName('p_no').AsString:= trim(edtygbh.Text); // 工号
      dmmain.cdspornal.FieldByName('p_name').AsString:= trim(edtygmc.Text);  // 姓名
      dmmain.cdspornal.FieldByName('p_sex').AsString:= trim(cygsex.Text);  //性别
      dmmain.cdspornal.FieldByName('p_workdata').Asstring:= formatdatetime('yyyy-mm-dd',dtworkdate.Date );  //出生
      dmmain.cdspornal.FieldByName('p_jg').AsString:= trim(cjg.Text); //籍贯
      dmmain.cdspornal.FieldByName('p_mz').AsString:= trim(cmz.Text); //民族
      dmmain.cdspornal.FieldByName('p_icno').AsString:= trim(edtic.Text ); //ic card
      dmmain.cdspornal.FieldByName('p_sfzh').AsString:= trim(edtsfzh.Text );  //省份证号
      dmmain.cdspornal.FieldByName('p_headset').AsString:=trim(edtheadset.Text);
      dmmain.cdspornal.FieldByName('p_address').AsString:=trim(edtaddress.Text);
      dmmain.cdspornal.FieldByName('p_english').AsString:= trim(edtpym.Text);  //输入码
      dmmain.cdspornal.FieldByName('p_english').AsString:= trim(edtpym.Text);
      dmmain.cdspornal.FieldByName('p_workclass').AsString:=trim(cgzid.Text); //工作柜组35
      dmmain.cdspornal.FieldByName('p_workid').AsString:= trim(p_name.Strings[cbmmc.ItemIndex]);
      dmmain.cdspornal.FieldByName('p_worklb').AsString:=trim(cbgzlb.Text); //工作l类别35    // 部门代号
      if not rb1.Checked then
      begin
        dmmain.cdspornal.FieldByName('p_iswork').AsBoolean:=false;
      end;
    end else
    begin
      dmmain.cdspornal.Edit;
      dmmain.cdspornal.FieldByName('p_no').AsString:= trim(edtygbh.Text); // 工号
      dmmain.cdspornal.FieldByName('p_name').AsString:= trim(edtygmc.Text);  // 姓名
      dmmain.cdspornal.FieldByName('p_sex').AsString:= trim(cygsex.Text);  //性别
      dmmain.cdspornal.FieldByName('p_workdata').Asstring:= formatdatetime('yyyy-mm-dd',dtworkdate.Date ) ;  //出生
      dmmain.cdspornal.FieldByName('p_jg').AsString:= trim(cjg.Text); //籍贯
      dmmain.cdspornal.FieldByName('p_mz').AsString:= trim(cmz.Text); //民族
      dmmain.cdspornal.FieldByName('p_icno').AsString:= trim(edtic.Text ); //ic card
      //dm.aqrymain.Parameters[7].Value:= trim(cjx.Text); //军衔
      dmmain.cdspornal.FieldByName('p_sfzh').AsString:= trim(edtsfzh.Text );  //省份证号
      dmmain.cdspornal.FieldByName('p_headset').AsString:=trim(edtheadset.Text);
      dmmain.cdspornal.FieldByName('p_address').AsString:=trim(edtaddress.Text);
      dmmain.cdspornal.FieldByName('p_english').AsString:= trim(edtpym.Text);  //输入码
      dmmain.cdspornal.FieldByName('p_workname').AsString:= trim(cbmmc.Text); //工作部门35
      dmmain.cdspornal.FieldByName('p_workid').AsString:= trim(Readyg(frmzyll.treebm,cbmmc.Text));
      dmmain.cdspornal.FieldByName('p_workclass').AsString:=trim(cgzid.Text); //工作柜组35
      dmmain.cdspornal.FieldByName('p_worklb').AsString:=trim(cbgzlb.Text); //工作l类别35
      if not rb1.Checked then
      begin
        dmmain.cdspornal.FieldByName('p_iswork').AsBoolean:=false;
      end else
      begin
        dmmain.cdspornal.FieldByName('p_iswork').AsBoolean:=true;
      end;   // 部门代号    end;
    end;
    dmmain.cdspornal.Post;
    try
      dmmain.cdspornal.ApplyUpdates(-1);
    except
      application.MessageBox('服务器故障！',pchar(application.Title),mb_iconwarning);
      exit;
    end;
    fg:=0;
    close;
  end;
end;

procedure Tfrmygda.cbmmcChange(Sender: TObject);
begin
  if fg=1 then init;
end;

procedure Tfrmygda.edtsfzhExit(Sender: TObject);
begin
  IF length(edtsfzh.Text)>18 then   //控制身份证长度
  begin
    application.MessageBox('身份证号不该多于18位！',pchar(application.Title),mb_iconwarning);
    edtsfzh.SetFocus;
    exit;
  end;
end;

procedure Tfrmygda.edticKeyPress(Sender: TObject; var Key: Char);
begin
   if not(key in ['0'..'9','.',#13,#8,#190,#37,#37]) then
    key:=chr(0);
  if length(edtic.Text)>=20 then key:=chr(0);
end;

procedure Tfrmygda.edtygmcKeyPress(Sender: TObject; var Key: Char);
begin
  if length(edtygmc.Text)>=10 then key:=chr(0);
end;

procedure Tfrmygda.edtygmcExit(Sender: TObject);
begin
  edtpym.Text:=selectpy(trim(edtygmc.Text));
end;

procedure Tfrmygda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
    VK_ESCAPE: Close;
    VK_RETURN:
      begin
        if Shift = [ssShift] then
          Perform(WM_NEXTDLGCTL, 1, 0)
        else
          Perform(WM_NEXTDLGCTL, 0, 0);
      end;
    VK_F4, VK_DOWN:
      if screen.ActiveControl is TCustomEdit then
        if (Key = VK_F4) or ((Key = VK_DOWN) and (Shift = [ssAlt])) then
          TCustomEdit(screen.ActiveControl).Perform(WM_LBUTTONDBLCLK, 0, 0);
  end;

end;

procedure Tfrmygda.cbmmcKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then key:=#0;
end;

end.
