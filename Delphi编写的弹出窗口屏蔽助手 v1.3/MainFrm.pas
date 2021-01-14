{*******************************************}
{ NotTroubleMe for Delphi 7                 }
{ 目的: 学习                                }
{       ListView, UpDown, ini, Registry     }
{       及ListView的排序, Label超链接用法   }
{ Version: 1.3                              }
{ E-mail: aspcat@163.com                    }
{ Created: 2004.11.30                       }
{*******************************************}

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, shellapi, Graphics,
  Dialogs, StdCtrls, CheckLst, ComCtrls, iniFiles, registry;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListAdd: TButton;
    ListEdit: TButton;
    ListDel: TButton;
    UpDown1: TUpDown;
    ListAll: TButton;
    OK: TButton;
    Cancel: TButton;
    ListView1: TListView;
    ListunAll: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Label3MouseMove(Sender: TObject; shift:Tshiftstate; x,y:integer);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure ListEditClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure ListAddClick(Sender: TObject);
    procedure ListDelClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure LvUpDown(lv: TListView; MoveUp: Boolean);
    function readRege(strKey: string): integer;
    procedure writeRege(strKey: string; intValue: integer);
    procedure ListAllClick(Sender: TObject);
    procedure ListunAllClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
(*
准备下一版本不要ini文件，直接查、写注册表
const
  sAry: Array [0..39, 0..1] of string =
    (('3721网络实名第一版','B83FC273-3522-4CC6-92EC-75CC86678DA4'),
    ('3721网络实名第二版','4522DBFE-14CD-4A59-AC2A-54BADFDD6D53'),
    ('3721网络实名第三版','8D898B17-976D-44C1-84E6-AF38842AC9EC'),
    ('3721上网助手老版','1B0E7716-898E-48CC-9690-4E338E8DE1D3'),
    ('3721上网助手新版','7CA83CF1-3AEA-42D0-A4E3-1594FC6E48B2'),
    ('3721中文邮','4EDBBAEA-F509-49F6-94D1-ECEC4BE5B686'),
    ('CNNIC中文网址','9A578C98-3C2F-4630-890B-FC04196EF420'),
    ('百度搜索伴侣','BC207F7D-3E63-4ACA-99B5-FB5F8428200C'),
    ('百度搜霸','9BBC1154-218D-453C-97F6-A06582224D81'),
    ('网易泡泡','CF051549-EDE1-40F5-B440-BCD646CF2C25'),
    ('新浪点点通','15DDE989-CD45-4561-BF99-D22C0D5C2B74'),
    ('新浪IE通','98FA5667-513F-4F15-8A15-C171477B8847'),
    ('搜狐搜索工具1','CE7C3CF0-4B15-11D1-ABED-709549C10000'),
    ('搜狐搜索工具2','484FF54A-CC44-467E-9C31-5B89FC753007'),
    ('搜狐视频播放器','2D0C7226-747E-11D6-83F0-00E04C4A2F90'),
    ('新浪go','48FE89A0-486C-48DF-9DEC-BED22BDC6057'),
    ('新浪igame','CD1A82F2-3770-4509-8355-0D2F45158F21'),
    ('新浪gane','DBAE7000-01EC-4162-8FEB-8A27AC937CA0'),
    ('藏琼阁','36CB6B28-FC08-4373-8F54-1A02E3C15B7D'),
    ('迅彩图铃通','F504CF55-2AA9-4752-B2DD-01D06A81D93E'),
    ('51.net','58CDB34C-B4D7-418B-A0FB-C4C8A01C2F0E'),
    ('dudu','8135EF31-FE8C-4C6E-A18A-F59944C3A488'),
    ('imuChat','54F8C0E2-34F9-474F-B47F-2CFCFE2300A2'),
    ('ADODB.Stream 2.5','4B106874-DD36-11D0-8B44-00A024DD9EFF'),
    ('ADODB.Stream 2.7','00000566-0000-0010-8000-00AA006D2EA4'),
    ('Ahmm Dialers','8522F9B3-38C5-4AA4-AE40-7401F1BBC851'),
    ('Alexa Toolbar','69A72A8A-84ED-4A75-8CE7-263DBEF3E5D3'),
    ('cmpro','0E1230F8-EA50-42A9-983C-D22ABC2EED3B'),
    ('Holistyc','03C543A1-C090-418F-A1D0-FB96380D601D'),
    ('Mtree Dialers1','E8EDB60C-951E-4130-93DC-FAF1AD25F8E7'),
    ('Mtree Dialers2','FC87A650-207D-4392-A6A1-82ADBC56FA64'),
    ('Portal Toolbar','D6862A22-1DD6-11D3-BB7C-444553540000'),
    ('Roings','65B818E1-F4D8-4F96-A1DF-35F3D1C86194'),
    ('SearchIt Toolbar','3717DF57-0396-463D-98B7-647C7DC6898A'),
    ('Sexxx','7EB2A76C-97AE-4CF3-9C6A-EA0F61F137E1'),
    ('thebugs','10954C80-4F0F-11D3-B17C-00C0DFE39736'),
    ('WeatherCAST','FC327B3F-377B-4CB7-8B61-27CD69816BC3'),
    ('xxxToolbar1','018B7EC3-EECA-11D3-8E71-0000E82C6C0D'),
    ('xxxToolbar2','EF86873F-04C2-4A95-A373-5703C08EFC7B'),
    ('xxxToolbar3','12398DD6-40AA-4C40-A4EC-A42CFC0DE797'));
*)

implementation
  uses cFrmunit;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  ini: TIniFile;
  filename: string;
  i: Integer;
  s, s1: TStringList;
begin
  filename := ExtractFilePath(paramstr(0))+'NotTroubleMe.ini';
  ini := TIniFile.Create(filename);
  try
    s := TStringList.Create;
    try
      s1 := TStringList.Create;
      try
        ini.ReadSectionValues('Setting', s);
        i := 0;
        while i<s.Count do
        begin
          With ListView1.Items.Add do
          begin
            s1.Clear;
            ExtractStrings(['='], [], PChar(s[i]), s1);
            Caption := s1[1];
            s1.Clear;
            ExtractStrings(['='], [], PChar(s[i+1]), s1);
            SubItems.Add(s1[1]);
          end;
          i := i + 2; //步长为2
        end;
        //读注册表键值以决定checkbox是否选中
        for i:=0 to ListView1.Items.Count-1 do
          if readRege(ListView1.Items[i].SubItems[0]) = 1024 then
            listview1.Items[i].Checked := true;
      finally
        s1.Free;
      end;
    finally
      s.Free;
    end;
  finally
    ini.Free;
  end;
end;

procedure TForm1.Label3MouseMove(Sender: TObject; shift:Tshiftstate; x,y:integer);
begin
  Label3.Font.Style := [fsItalic, fsunderline];
  Label3.Font.Color := clblue;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  Shellexecute(handle, nil,PChar('mailto:aspcat@163.com'), nil, nil, sw_shownormal);
end;

procedure TForm1.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Style := [];
  Label3.Font.Color := clWindowText;
end;

procedure TForm1.ListEditClick(Sender: TObject);
begin
  if Assigned(Form1.ListView1.selected) then
  begin
    Form2.Edit1.Text := ListView1.Selected.Caption;
    Form2.Edit2.Text := ListView1.Selected.SubItems[0];
    Form2.ShowModal;
  end;
end;

procedure TForm1.ListView1SelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
//行选中后将按钮变亮
begin
  if Assigned(ListView1.selected) then
  begin
    ListEdit.Enabled := true;
    ListDel.Enabled := true;
  end
  else
  begin
    ListEdit.Enabled := false;
    ListDel.Enabled := false;
  end;
end;

procedure TForm1.ListAddClick(Sender: TObject);
begin
  ListView1.Selected := nil;
  Form2.Edit1.Text := '';
  Form2.Edit2.Text := '';
  Form2.ShowModal;
end;

procedure TForm1.ListDelClick(Sender: TObject);
begin
  if MessageBox(Handle, pchar('你确定要删除该项吗?'), '确认', MB_OKcancel + MB_ICONQUESTION) = 1 then
    ListView1.DeleteSelected;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  UpDown1.Associate := ListView1;

  case Button of
    btNext: LvUpDown(ListView1, true);
    btPrev: LvUpDown(ListView1, false);
  end;
end;

procedure TForm1.LvUpDown(lv: TListView; MoveUp: Boolean);
//listView 排序
//原理：将所选行赋予一个新TListItem，然后将其插入前（后）行
//      再将原所选行删除，将新的选区置于新ListItem
var
  DestItem: TListItem;
begin
  if (lv.Selected = nil) or ((lv.Selected.Index=0) and MoveUp) or ((lv.Selected.Index+1=lv.Items.Count) and (not MoveUp)) then
    Exit;

  DestItem := nil;
  lv.Items.BeginUpdate;
  try
    case MoveUp of
      true: DestItem := lv.Items.Insert(lv.Selected.Index-1);
      false: DestItem := lv.Items.Insert(lv.Selected.Index+2);
    end;
    DestItem.Assign(lv.Selected);
    lv.Selected.Free;
    lv.Selected := DestItem;
  finally
    lv.Items.EndUpdate;
  end;
  DestItem.MakeVisible(False);
end;

function TForm1.readRege(strKey: string): integer;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.OpenKey('SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{'+strKey+'}', false) then
      result := reg.ReadInteger('Compatibility Flags')
    else
      result := 0;
  finally
    reg.Free;
  end;
end;

procedure TForm1.writeRege(strKey: string; intValue: integer);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.OpenKey('SOFTWARE\Microsoft\Internet Explorer\ActiveX Compatibility\{'+strKey+'}', true) then
    begin
      Reg.WriteInteger('Compatibility Flags',intValue);
      Reg.CloseKey;
    end;
  finally
    reg.Free;
  end;
end;

procedure TForm1.ListAllClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to ListView1.Items.Count-1 do
    listview1.Items[i].Checked := true;
end;

procedure TForm1.ListunAllClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to ListView1.Items.Count-1 do
    listview1.Items[i].Checked := false;
end;

procedure TForm1.OKClick(Sender: TObject);
var
  i: integer;
  ini: TiniFile;
  filename: string;
begin
  //首先删除ini中的section
  filename := ExtractFilePath(paramstr(0))+'NotTroubleMe.ini';
  ini := TIniFile.Create(filename);
  ini.EraseSection('Setting');
  
  for i:=0 to ListView1.Items.Count-1 do
  begin
    if listview1.Items[i].Checked then
      writeRege(ListView1.Items[i].SubItems[0], 1024)
    else
      writeRege(ListView1.Items[i].SubItems[0], 0);

    //重新写入ini
    ini.WriteString('Setting', 'S'+intToStr(i), ListView1.Items[i].Caption);
    ini.WriteString('Setting', 'N'+intToStr(i), ListView1.Items[i].SubItems[0]);
  end;
  close;
end;

procedure TForm1.CancelClick(Sender: TObject);
begin
  close;
end;

end.
