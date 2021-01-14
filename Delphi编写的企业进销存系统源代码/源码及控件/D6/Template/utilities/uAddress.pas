unit uAddress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, DBNavPlus, Db, DBTables;

CONST
   EndChar='ABCDEFGHIJKLMNOPQRSTUVWXYZ';

type
  TAddress = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    Query2: TQuery;
    Table1: TTable;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    StaticText3: TStaticText;
    procedure WhoAmI(Sender: TObject);
    procedure ReadText;
    Procedure ReadArea(ChrIndex:integer);
    procedure SelectAddr(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    sAddressPath: string;
    { Private declarations }
  public
    { Public declarations }
    Addr:String;
    ZipCode:String;
  end;

var
  Address: TAddress;
  TxtList : TStringList;
implementation


{$R *.DFM}

function GetShortName(sLongName:string) : string;
var
  sShortName    : string;
  nShortNameLen : integer;
begin
  SetLength(sShortName,MAX_PATH);
  nShortNameLen := GetShortPathName(PChar(sLongName),PChar(sShortName),MAX_PATH-1);
  if( 0 = nShortNameLen )then
    begin
      // handle errors...

    end;
  SetLength( sShortName,nShortNameLen );
  Result := sShortName;
end;

procedure TAddress.WhoAmI(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TSpeedButton(Sender).Caption;
end;

procedure TAddress.ReadText;
var
  i : integer;
begin
  TxtList := TStringList.Create;
  TxtList.Clear;
  if FileExists(sAddressPath+'\Area.txt') then
    begin
      TxtList.LoadFromFile(sAddressPath+'\Area.txt');
      for i := 1 to TxtList.Count-1 do
        begin
          ListBox2.Items.Add(TxtList[i]);
          Application.ProcessMessages;
        end;
      ListBox2.ItemIndex:=0;
    end
  else
    begin
      MessageDlg('文件''Area.txt''没找到!',mtError,[mbOK],0);
      TxtList.Free;
      Address.Close;
    end;
end;

Procedure TAddress.ReadArea(ChrIndex:integer);
var
  i : integer;
  TmpTxt:string;
begin
  for i := 0 to TxtList.Count-1 do
    if Copy(TxtList[i],7,1)=EndChar[ChrIndex] then
      begin
        TmpTxt:=Copy(TxtList[i],1,6);
        while Pos(' ',TmpTxt)>0 do Delete(TmpTxt,Pos(' ',TmpTxt),1);
        ListBox2.Items.Add(TmpTxt);
        Application.ProcessMessages;
      end;
end;

procedure TAddress.SelectAddr(Sender: TObject);
begin
  ListBox3.Clear;
  Screen.Cursor := crHourGlass;
  if (Sender<>ListBox2) then
    begin
      ListBox2.Clear;
      ReadArea(ListBox1.ItemIndex+1);
      ListBox2.ItemIndex:=0;
    end;
  if ListBox2.ItemIndex=-1 then
    Table1.Filter:= 'city = '''+ListBox1.Items[ListBox1.ItemIndex]+''''
  else
    Table1.Filter:= 'city = '''+ListBox1.Items[ListBox1.ItemIndex]+'''and Area='''+ListBox2.Items[ListBox2.ItemIndex]+'''';
  Table1.DisableControls;
  Table1.First;
  StaticText3.Caption:=Table1.FieldByName('Zip').AsString;
  While Not Table1.EOF do
    begin
      ListBox3.Items.Add(Table1.FieldByName('Road').AsString);
      Table1.Next;
      Application.ProcessMessages;
    end;
  Table1.EnableControls;
  ListBox3.ItemIndex:=0;
  Screen.Cursor := crDefault;
end;

procedure TAddress.FormCreate(Sender: TObject);
begin
  sAddressPath := ExtractFilePath(Application.ExeName);
  if copy(sAddressPath,length(sAddressPath),1)='\' then
    delete(sAddressPath,length(sAddressPath),1);
  Screen.Cursor := crHourGlass;
  Edit1.Text := '';
  sAddressPath := sAddressPath+'\Address';
  table1.DatabaseName := GetShortName(sAddressPath);
  Query2.DatabaseName := GetShortName(sAddressPath);
  Try
    Table1.Open;
  Except
    Application.MessageBox('找不到地址资料库存放路径!请确定 ".exe\Address\" 路径是否存在!','错误',MB_OK+MB_ICONERROR);
    Abort;
  end;
end;

procedure TAddress.FormShow(Sender: TObject);
var
  i : integer;
begin
  if FileExists(sAddressPath+'\City.txt') then
    begin
      ListBox1.Items.LoadFromFile(sAddressPath+'\City.txt');
      for i := 0 to ListBox1.Items.Count-1 do
        begin
          ListBox1.Items.Strings[i]:=copy(ListBox1.Items.Strings[i],1,6);
          Application.ProcessMessages;
        end;
      ListBox1.ItemIndex:=0;
      ReadText;
      SelectAddr(ListBox1);
      StaticText1.Caption := ListBox1.Items[ListBox1.ItemIndex];
      StaticText2.Caption := ListBox2.Items[ListBox2.ItemIndex];
      Edit1.Text:=ListBox3.Items[ListBox3.ItemIndex];
      Screen.Cursor := crDefault;
    end
  else
    begin
      Application.MessageBox('文件''City.txt''没找到,请洽程式设计人员!','错误',MB_OK+MB_ICONERROR);
      Self.Close;
    end;
end;

procedure TAddress.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TxtList.Free;
  Table1.Close;
  Action:=caFree;
end;

procedure TAddress.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TAddress.BitBtn1Click(Sender: TObject);
begin
  Addr:=StaticText1.Caption+StaticText2.Caption+Edit1.Text;
  ZipCode:=StaticText3.Caption;
  ModalResult:=mrOK;
end;

procedure TAddress.ListBox1Click(Sender: TObject);
begin
  SelectAddr(ListBox1);
  StaticText1.Caption := ListBox1.Items[ListBox1.ItemIndex];
  try
    StaticText2.Caption:=ListBox2.Items[ListBox2.ItemIndex];
  except
    StaticText2.Caption :='';
  end;
  try
    Edit1.Text:=ListBox3.Items[ListBox3.ItemIndex];
  except
    Edit1.Text:='';
  end;
end;

procedure TAddress.ListBox2Click(Sender: TObject);
begin
  SelectAddr(ListBox2);
  StaticText2.Caption := ListBox2.Items[ListBox2.ItemIndex];
  try
    Edit1.Text:=ListBox3.Items[ListBox3.ItemIndex];
  except
    Edit1.Text:='';
  end;
end;

procedure TAddress.ListBox3Click(Sender: TObject);
begin
  Edit1.Text := ListBox3.Items[ListBox3.ItemIndex];
end;

procedure TAddress.SpeedButton36Click(Sender: TObject);
var
  TmpText:string;
begin
  TmpText:=Edit1.Text;
  if TmpText<>'' then
    if Pos(Copy(TmpText,Length(TmpText),1),'0123456789')>0 then
      Delete(TmpText,Length(TmpText),1)
    else
      Delete(TmpText,Length(TmpText)-1,2);
  Edit1.Text := TmpText;
end;

procedure TAddress.SpeedButton38Click(Sender: TObject);
var
  i :integer;
  Found:Boolean;
begin
  Found:=False;
  if Edit1.Text<>'' then
    begin
      for i := 0 to ListBox3.Items.Count-1 do
        if listBox3.Items[i]=Edit1.Text then
          begin
            Found:=True;
            Break;
          end;
      if Found then
        begin
          Application.MessageBox('您要新增的地址已经存在!','错误',MB_ICONERROR+MB_OK);
          Exit;
        end;
      ListBox3.Items.Add(Edit1.Text);
      Query2.Close;
      Query2.SQL.Clear;
      Query2.SQL.Add('INSERT INTO T_Address (City,Area,Road) Values('''+StaticText1.Caption+''','''+StaticText2.Caption+''','''+Edit1.Text+''')');
      Query2.ExecSQL;
      Edit1.Text:='';
    end
  Else
    Application.MessageBox('请您务必输入路径名称!','警告',MB_ICONWARNING+MB_OK);
end;

procedure TAddress.SpeedButton39Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TAddress.SpeedButton37Click(Sender: TObject);
var
  i : integer;
  Found:Boolean;
begin
  Found:=False;
  if (Edit1.Text<>'')AND(MessageDlg('您确定要删除这个路径名吗?',mtCONFIRMATION,[mbOK,mbCANCEL],0)=IDOK) then
    begin
      for i:=0 to ListBox3.Items.Count-1 do
       if ListBox3.Items[i]=Edit1.Text then
         begin
           Found:=True;
           Break;
         end;
      if NOT Found then
        begin
          Application.MessageBox('您要删除的路径不存在!','错误',MB_ICONERROR+MB_OK);
          Exit;
        end;
      ListBox3.Items.Delete(i);
      Query2.Close;
      Query2.SQL.Clear;
      Query2.SQL.Add('DELETE FROM T_Address where (City='''+StaticText1.Caption+''')AND(Area='''+StaticText2.Caption+''')AND(Road='''+Edit1.Text+''')');
      Query2.ExecSQL;
      Edit1.Text:='';
    end
  Else if (Edit1.Text='') then
    Application.MessageBox('请您务必输入路径名称!','警告',MB_ICONWARNING+MB_OK);
end;

procedure TAddress.SpeedButton3Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Table1.Close;
  Table1.Open;
  Screen.Cursor := crDefault;
end;

end.
