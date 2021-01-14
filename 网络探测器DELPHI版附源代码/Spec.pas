unit Spec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, SyncObjs, Connection;

type
  TCycle_share_pass = class(TThread)
  private
    { Private declarations }
    FNetConnection : TNetConnection;
    flist : TStringList;//用于保存用户列表
    state : integer;
    pass_no: longint;
    function GetCurrPass: string;
    procedure optCarry(CarryBit : integer);
  protected
    procedure ThreadDone_share(Sender : TObject);
    procedure set_list;
    procedure NetCon_Echoopen(Sender: TObject; IConnection: TObject; Error: integer);
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
  end;

type
  TfrmSpec = class(TForm)
    CheckBox1: TCheckBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox2: TCheckBox;
    ComboBox3: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox3: TCheckBox;
    ComboBox4: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    CheckBox4: TCheckBox;
    ComboBox5: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    CheckBox5: TCheckBox;
    ComboBox6: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox6: TCheckBox;
    ComboBox7: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    CheckBox7: TCheckBox;
    ComboBox8: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    CheckBox8: TCheckBox;
    ComboBox9: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label18: TLabel;
    BitBtn6: TBitBtn;
    all_info: TMemo;
    ok_info: TMemo;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit9: TEdit;
    Edit14: TEdit;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label23: TLabel;
    Label24: TLabel;
    CheckBox9: TCheckBox;
    ComboBox10: TComboBox;
    Label25: TLabel;
    Label26: TLabel;
    CheckBox10: TCheckBox;
    ComboBox11: TComboBox;
    Label27: TLabel;
    edtAddr: TEdit;
    edtUser: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GetCharType(position : integer): integer;
    function GetfirstChar(tp: integer): char;
  public
    { Public declarations }
  end;

var
  frmSpec: TfrmSpec;

implementation

{$R *.dfm}

uses function_1, main;

//******************************************

procedure TCycle_share_pass.ThreadDone_share(Sender : TObject);
begin
  FNetConnection.Free;
  flist.Free;
  Dec(share_thread_no); //线程总数减一
  frmSpec.Edit14.Text := IntToStr(share_thread_no);

  if (share_thread_no = 0) then
  begin
    frmSpec.Label22.Caption := '查找共享完成';
    frmSpec.Button2.Enabled := True;
    frmSpec.BitBtn6.Enabled := False;
  end;
end;

constructor TCycle_share_pass.Create(CreateSuspended: Boolean);
begin
   FNetConnection := TNetConnection.Create(frmSpec);
   flist := TStringList.Create;
   //   FNetConnection.OnEchoClose := NetCon_EchoClose;
   FNetConnection.OnEchoOpen := NetCon_Echoopen;
   FNetConnection.GetInfo := false;//找系统信息
   FNetConnection.AutoDo := false;//不是自动查找
   OnTerminate := ThreadDone_share;
   FreeOnTerminate := True;
   inc(share_thread_no);//线程加1
   //设置目标机器
   FNetConnection.UserName := frmSpec.edtUser.Text;
   FNetConnection.Address := frmSpec.edtAddr.Text;

   frmSpec.Edit14.Text := IntToStr(share_thread_no);

  inherited Create(CreateSuspended);

end;

procedure TCycle_share_pass.Execute;
begin
  pass_no:= ord(strPassStore[1]);//用于指示密码位置
  
  while thread_run do
  begin
    if pass_no<=0 then
      break;
    FNetConnection.PassWord := GetCurrPass;
    FNetConnection.open;
    FNetConnection.close;
  end;

end;

procedure TCycle_share_pass.NetCon_Echoopen(Sender, IConnection: TObject;
  Error: integer);
begin
  state := Error;
  Synchronize(set_list);//写全部信息
  if ((Error=51)or (Error=53)or (Error=64)or (Error=1792)) then
  //远程计算机不可用/网络路径不存在/不可再用/登录服务不运行
  begin
    pass_no := ord(strPassStore[1]);//指向最后一个字符
  end;

end;

//递归调用，处理一位密码
procedure TCycle_share_pass.optCarry(CarryBit: integer);
var
  ftype,l : integer;
  str_pass  : string;
  c : char;
begin
  if CarryBit < pass_no then pass_no := CarryBit;
  ftype := ord(strPassStore[CarryBit*3]);
  str_pass := '';
//**********生成此位密码列表**************
  case ftype of
    0: str_pass := 'abcdefghijklmnopqrstuvwxyz';
    1: str_pass := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    2: str_pass := '0123456789';
    3: str_pass := '~ !@#$%^&*(){}[],.?/;+-';
    4: str_pass := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    5: str_pass := '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    6: str_pass := '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~ !@#$%^&*(){}[],.?/;+-';
    else str_pass := port_lists.Strings[ftype];
  end;

  if strPassStore[CarryBit*3+1] = conNeedCarry then
  begin
    optCarry(CarryBit-1);
  end else
  begin //不需要进位
    c := strPassStore[CarryBit*3-1];
    l := pos( c, str_pass);
    if l < length(str_pass)then
    begin
      strPassStore[CarryBit*3-1] := str_pass[l+1];

      if strPassStore[(CarryBit+1)*3+1]= conNeedCarry then
      begin
          strPassStore[(CarryBit+1)*3-1] := str_pass[1];
          strPassStore[(CarryBit+1)*3+1]:= conNoCarry;
      end;

      //下次需要进位操作
      if strPassStore[CarryBit*3-1] = str_pass[Length(str_pass)] then
        strPassStore[CarryBit*3+1] := conNeedCarry;

    end
    else begin
      Dec(pass_no);
      optCarry(CarryBit-1); //处理下一位
    end;
  end;
end;

function TCycle_share_pass.GetCurrPass: string;
var
  len,i : integer;
begin
  Result := '';
  len := ord(strPassStore[1]);
  for i := 1 to len do
    Result := Result + strPassStore[i*3-1];

  optCarry(len);
end;

procedure TCycle_share_pass.set_list;
begin
  if (state=0) then
  begin
    Beep;
    frmSpec.Edit1.Text := IntToStr(StrToInt(frmSpec.Edit1.Text)+1);
    frmSpec.all_info.Lines.Add('检测:'+ FNetConnection.Address+ '->用户:'+
       FNetConnection.UserName+'.密码:'+FNetConnection.PassWord+'-------------[成功]');
    frmSpec.ok_info.Lines.Add('主机:['+FNetConnection.Address+'] 用户:['+
       FNetConnection.UserName+'] 密码:['+FNetConnection.PassWord+']');
  end else
  begin
    frmSpec.all_info.Lines.Add('检测:'+FNetConnection.Address+'->用户:'+
        FNetConnection.UserName+'->密码:'+FNetConnection.PassWord+'-------------[失败:'+IntToStr(state)+']');
    if (frmSpec.all_info.Lines.Count>500) then
    begin
      frmSpec.all_info.Lines.Clear;
    end;
  end;
  frmSpec.Edit9.Text := IntToStr(StrToInt(frmSpec.Edit9.Text)+1);

end;

//******************************************
function TfrmSpec.GetCharType(position: integer): integer;
var
  ftag,i : integer;
begin
  Result := -1;
  ftag := position + 1000;
  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TComboBox then
    begin
      if TComboBox(Components[i]).Tag = ftag then
         Result := TComboBox(Components[i]).ItemIndex;
    end;
  end;
end;

function TfrmSpec.GetfirstChar(tp: integer): char;
begin
  Result := ComboBox1.Items.Strings[tp][1];
end;

procedure TfrmSpec.CheckBox1Click(Sender: TObject);
var
  no,no1,i : integer;
  ck : Boolean;
begin
  no := TCheckBox(Sender).Tag;
  ck := TCheckBox(Sender).Checked;

  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TCheckBox then
    begin
        no1 := TCheckBox(Components[i]).Tag;
        if ck then
        begin
          if no1<no then
            TCheckBox(Components[i]).Checked := true;
        end else
        begin
          if no1 > no then
            TCheckBox(Components[i]).Checked := false;
        end;
    end else if Components[i] is TComboBox then
    begin
        no1 := TComboBox(Components[i]).Tag;
        if ck then
        begin
          if no1<=no then
            TComboBox(Components[i]).Enabled := true;
        end else
        begin
          if no1 >= no then
            TComboBox(Components[i]).Enabled := false;
        end;
    end;
  end;

//  showmessage(inttostr(MaxLen));
end;

procedure TfrmSpec.Button2Click(Sender: TObject);
var
  bubble : TCycle_share_pass;
  i, fpos, ftype : integer;
  no1 : integer;
  ck1 : Boolean;
  MaxLen : Byte;
begin
  if ((share_thread_no<>0)or(ping_thread_no<>0)or(scan_thread_no<>0)) then
  begin
    ShowMessage('目前有线程在运行,不能继续');
    exit;
  end;

  Button2.Enabled := False;
  BitBtn6.Enabled := True;

//*********获取密码长度*********************

  MaxLen := 0;
  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TCheckBox then
    begin
      no1 := TCheckBox(Components[i]).Tag;
      ck1 := TCheckBox(Components[i]).Checked;

      if (not ck1) and (MaxLen > Components[i].tag-1000-1) then
          MaxLen := Components[i].tag-1000-1
      else if ck1 and (MaxLen < no1- 1000) then
          MaxLen := no1- 1000;
    end;

  end;

  if MaxLen <= 0 then
  begin
    ShowMessage('生成密码的总长度太小！');
    exit;
  end;

  cur_ip:=0;
  scan_port_ip:=0;
  share_ip_no:=0;
  port_lists.Clear;
  port_lists.Text := ComboBox1.Items.Text;

//***********生成当前密码表***************

  strPassStore := '';
  SetLength(strPassStore,1+MaxLen*3);
  strPassStore[1]:= chr(MaxLen);

  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TCheckBox then
    begin
      if TCheckBox(Components[i]).Checked then
      begin
        fpos := TCheckBox(Components[i]).Tag - 1000;
        ftype := GetCharType(fPos);
        if ftype < 0 then begin showmessage('发生内部错误！'); exit;end;

        strPassStore[1+(fpos)*3]:= '0';
        strPassStore[(fpos)*3]:= chr(ftype);
        strPassStore[(fpos)*3-1]:= GetfirstChar(fType);
      end;
    end;

  end;

//  showmessage(port_lists.Text);

//***********开始检测*************************

  Edit9.Text:='0';
  Edit14.Text:='0';
  thread_run:=true;

  bubble := TCycle_share_pass.Create(false);

end;

procedure TfrmSpec.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmSpec.Button1Click(Sender: TObject);
begin
  thread_run := false;
  Close;
end;

procedure TfrmSpec.BitBtn6Click(Sender: TObject);
begin
  thread_run := false;
end;

procedure TfrmSpec.FormShow(Sender: TObject);
begin
  Label22.Caption := '请慢慢等待...';
end;

end.
