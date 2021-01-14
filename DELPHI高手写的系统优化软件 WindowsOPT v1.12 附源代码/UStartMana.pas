unit UStartMana;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  Menus, ComCtrls, ImgList, RzCommon, StdCtrls;

type
  TFrmStartMana = class(TForm)
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ImageList1: TImageList;
    N7: TMenuItem;
    N8: TMenuItem;
    RzMenuController1: TRzMenuController;
    btnClose: TButton;
    procedure RefreshList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure N8Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStartMana: TFrmStartMana;

implementation

uses UMainFunc,Registry,activex,comobj,shlobj;

var
  reg1,reg2: TRegistry; ListItem: TListItem;
  start,startall,startdis,startalldis:string;
  ColumnToSort: Integer;
const
  enab=' 允许'; disa=' 禁止';
  pos1='启动文件夹(所有用户)'; pos2='启动文件夹(当前用户)';
  pos19='启动文件夹(所有用户_禁止)'; pos20='启动文件夹(当前用户_禁止)';
  pos3='[注册表] Machine - Run'; pos4='[注册表] Machine - Run -';
  pos5='[注册表] Machine - RunOnce'; pos6='[注册表] Machine - RunOnce -';
  pos7='[注册表] User - Run'; pos8='[注册表] User - Run -';
  pos9='[注册表] User - RunOnce'; pos10='[注册表] User - RunOnce -';
  pos11='[注册表] Machine - RunOnceEx'; pos12='[注册表] Machine - RunOnceEx -';
  pos13='[注册表] Machine - RunServices'; pos14='[注册表] Machine - RunServices -';
  pos15='[注册表] User - RunOnceEx'; pos16='[注册表] User - RunOnceEx -';
  pos17='[注册表] User - RunServices'; pos18='[注册表] User - RunServices -';
  pos31='[注册表] Machine - Run2'; pos32='[注册表] Machine - Run2 -';
  pos33='[注册表] User - Run2'; pos34='[注册表] User - Run2 -';
  pos40='[注册表] User - Load';
  pos41='[注册表] User - Load -';
{$R *.dfm}

procedure TFrmStartMana.RefreshList;
var //刷新 过程
  i:word; liststart:Tstrings;
  list:array[0..3] of Tstrings;
begin
  ListView1.Items.Clear;
  list[0]:=Tstringlist.Create; list[1]:=Tstringlist.Create;
  list[2]:=Tstringlist.Create; list[3]:=Tstringlist.Create;

  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos3);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos5);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos4);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;  
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos6);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos7);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos9);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos8);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;  
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos10);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos11);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos13);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos12);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos14);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos15);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos17);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos16);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos18);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;

  if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos31);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',false) then
  begin
    reg1.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos32);
        list[2].Add(reg1.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(enab); list[3].Add(pos33);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',false) then
  begin
    reg2.GetValueNames(list[1]);
    if list[1].Count>0 then
      for i:=0 to list[1].Count-1 do
      begin
        list[0].Add(disa); list[3].Add(pos34);
        list[2].Add(reg2.ReadString(list[1].Strings[i]));
        ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
        ListItem.Caption := list[0][i];    ListItem.SubItems.Add(list[1][i]);
        ListItem.SubItems.Add(list[2][i]); ListItem.SubItems.Add(list[3][i]);
      end;
  end;

  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows',false) then
  begin
    if reg2.ReadString('Load') <> '' then begin
      list[0].Add(enab); list[3].Add(pos40); list[1].Add('Load');
      list[2].Add(reg2.ReadString('Load'));
      ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
      ListItem.Caption := list[0][0];    ListItem.SubItems.Add(list[1][0]);
      ListItem.SubItems.Add(list[2][0]); ListItem.SubItems.Add(list[3][0]);
    end;
  end;
  list[0].Clear; list[1].Clear; list[2].Clear; list[3].Clear;
  if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows-',false) then
  begin
    if reg2.ReadString('Load') <> '' then begin
      list[0].Add(disa); list[3].Add(pos41); list[1].Add('Load');
      list[2].Add(reg2.ReadString('Load'));
      ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
      ListItem.Caption := list[0][0];    ListItem.SubItems.Add(list[1][0]);
      ListItem.SubItems.Add(list[2][0]); ListItem.SubItems.Add(list[3][0]);
    end;
  end;

  liststart:=findfiles(start);
  if liststart.Count > 0 then
    for i:=0 to liststart.Count-1 do
    if (getfilename(liststart[i])<>'.') and (getfilename(liststart[i])<>'..')
      and (getfilename(liststart[i])<>'desktop.ini') then
    begin
      ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
      //ListItem.Checked:=true;
      ListItem.Caption := enab;    ListItem.SubItems.Add(getfilename(liststart[i]));
      ListItem.SubItems.Add(ResolveLink(liststart[i])); ListItem.SubItems.Add(pos2);
    end;
  liststart:=findfiles(startdis);
  if liststart.Count > 0 then
    for i:=0 to liststart.Count-1 do
    if (getfilename(liststart[i])<>'.') and (getfilename(liststart[i])<>'..')
      and (getfilename(liststart[i])<>'desktop.ini') then
    begin
      ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=1;
      ListItem.Caption := disa;    ListItem.SubItems.Add(getfilename(liststart[i]));
      ListItem.SubItems.Add(ResolveLink(liststart[i])); ListItem.SubItems.Add(pos20);
    end;
  liststart:=findfiles(startall);
  if liststart.Count > 0 then
    for i:=0 to liststart.Count-1 do
    if (getfilename(liststart[i])<>'.') and (getfilename(liststart[i])<>'..')
      and (getfilename(liststart[i])<>'desktop.ini') then
    begin
      ListItem := ListView1.Items.Add;   ListItem.ImageIndex:=0;
      //ListItem.Checked:=true;
      ListItem.Caption := enab;    ListItem.SubItems.Add(getfilename(liststart[i]));
      ListItem.SubItems.Add(ResolveLink(liststart[i])); ListItem.SubItems.Add(pos1);
    end;
  liststart:=findfiles(startalldis);
  if liststart.Count > 0 then
    for i:=0 to liststart.Count-1 do
    if (getfilename(liststart[i])<>'.') and (getfilename(liststart[i])<>'..')
      and (getfilename(liststart[i])<>'desktop.ini') then    
    begin
      ListItem := ListView1.Items.Add;    ListItem.ImageIndex:=1;
      ListItem.Caption := disa;    ListItem.SubItems.Add(getfilename(liststart[i]));
      ListItem.SubItems.Add(ResolveLink(liststart[i])); ListItem.SubItems.Add(pos19);
    end;
  list[0].Free; list[1].Free;
  list[2].Free; list[3].Free;
  liststart.Free;
end;

procedure TFrmStartMana.FormCreate(Sender: TObject);
begin
  Reg1:=TRegistry.Create; Reg1.RootKey:=HKEY_LOCAL_MACHINE;
  Reg2:=TRegistry.Create; Reg2.RootKey:=HKEY_CURRENT_USER;
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',false)
  then start:=GetDirectoryName( reg2.ReadString('Startup') );
  if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',false)
  then startdis:=GetDirectoryName( reg2.ReadString('Programs') ) + 'Disabled Startup Items';
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',false)
  then startall:=GetDirectoryName( reg1.ReadString('Common Startup') );
  if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',false)
  then startalldis:=GetDirectoryName( reg1.ReadString('Common Programs') ) + '\Disabled Startup Items';
  RefreshList;
end;

procedure TFrmStartMana.FormDestroy(Sender: TObject);
begin
  Reg1.CloseKey; Reg1.Free;
  Reg2.CloseKey; Reg2.Free;
  ListItem.Free;
end;

procedure TFrmStartMana.N1Click(Sender: TObject);
begin //允许
  ListItem:=ListView1.Selected;
  if ListItem.Caption=disa then
    if ListItem.SubItems.Strings[2]=pos4 then //Machine - Run -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos3;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos6 then //Machine - RunOnce -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos5;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos12 then //Machine - RunOnceEx -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos11;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos14 then //Machine - RunServices -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos13;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos8 then //User - Run -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos7;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos10 then //User - RunOnce -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos9;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos16 then //User - RunOnceEx -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos15;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos18 then //User - RunServices -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos17;
      end
    end

    else if ListItem.SubItems.Strings[2]=pos32 then //Machine - Run2 -
    begin
      if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos31;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos34 then //User - Run2 -
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos33;
      end
    end

    else if ListItem.SubItems.Strings[2]=pos41 then //User - Load -
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows-',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos40;
      end
    end

    else if ListItem.SubItems.Strings[2]=pos19 then //启动文件夹(所有用户_禁止)
    begin
      if DirectoryExists(startall)=false then ForceDirectories(startall);
      chdir(startalldis);
      if MoveFile(pchar(ListItem.SubItems.Strings[0]),pchar(getdirectoryname(startall)+ListItem.SubItems.Strings[0])) then
      begin
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos1;
        chdir(startall); RemoveDir(startalldis);
      end;
    end
    else if ListItem.SubItems.Strings[2]=pos20 then //启动文件夹(当前用户_禁止)
    begin
      if DirectoryExists(start)=false then ForceDirectories(start);
      chdir(startdis);
      if MoveFile(pchar(ListItem.SubItems.Strings[0]),pchar(getdirectoryname(start)+ListItem.SubItems.Strings[0])) then
      begin
        ListItem.ImageIndex:=0;
        //ListItem.Checked:=true;
        ListItem.Caption:=enab; ListItem.SubItems.Strings[2]:=pos2;
        chdir(start); RemoveDir(startdis);
      end;
    end;
end;

procedure TFrmStartMana.N2Click(Sender: TObject);
begin //禁止
  ListItem:=ListView1.Selected;
  if ListItem.Caption=enab then
    if ListItem.SubItems.Strings[2]=pos3 then //Machine - Run
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos4;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos5 then //Machine - RunOnce
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos6;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos11 then //Machine - RunOnceEx
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos12;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos13 then //Machine - RunServices
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos14;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos7 then //User - Run
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos8;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos9 then //User - RunOnce
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos10;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos15 then //User - RunOnceEx
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos16;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos17 then //User - RunServices
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos18;
      end
    end

    else if ListItem.SubItems.Strings[2]=pos31 then //Machine - Run2
    begin
      if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',false) then
      begin
        reg1.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',true) then
        reg1.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos32;
      end
    end
    else if ListItem.SubItems.Strings[2]=pos33 then //User - Run2
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos34;
      end
    end

    else if ListItem.SubItems.Strings[2]=pos40 then //User - Load
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows',false) then
      begin
        reg2.DeleteValue(ListItem.SubItems.Strings[0]);
        if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows-',true) then
        reg2.writestring(ListItem.SubItems.Strings[0],ListItem.SubItems.Strings[1]);
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos41;
      end
    end

    else if ListItem.SubItems.Strings[2]=pos1 then //启动文件夹(所有用户)
    begin
      if DirectoryExists(startalldis)=false then ForceDirectories(startalldis);
      chdir(startall);
      if MoveFile(pchar(ListItem.SubItems.Strings[0]),pchar(getdirectoryname(startalldis)+ListItem.SubItems.Strings[0])) then
      begin
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos19;
      end;
    end
    else if ListItem.SubItems.Strings[2]=pos2 then //启动文件夹(当前用户)
    begin
      if DirectoryExists(startdis)=false then ForceDirectories(startdis);
      chdir(start);
      if MoveFile(pchar(ListItem.SubItems.Strings[0]),pchar(getdirectoryname(startdis)+ListItem.SubItems.Strings[0])) then
      begin
        ListItem.ImageIndex:=1;
        //ListItem.Checked:=false;
        ListItem.Caption:=disa; ListItem.SubItems.Strings[2]:=pos20;
      end;
    end;
end;

procedure TFrmStartMana.N4Click(Sender: TObject);
begin //刷新
  RefreshList
end;

procedure TFrmStartMana.N6Click(Sender: TObject);
var str:string;
begin //删除
  ListItem:=ListView1.Selected;
  str:='确实要删除 ' + ListItem.SubItems.Strings[0] + ' ？';
  if MessageBox(Handle, pchar(str), '删除启动项', MB_ICONQUESTION or MB_OKCANCEL) = IDOK then
    if ListItem.SubItems.Strings[2]=pos3 then  //Machine - Run
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos4 then  //Machine - Run -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos5 then  //Machine - RunOnce
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos6 then  //Machine - RunOnce -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos7 then  //User - Run
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos8 then  //User - Run -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run-',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos9 then  //User - RunOnce
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos10 then  //User - RunOnce -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce-',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos11 then  //Machine - RunOnceEx
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos12 then  //Machine - RunOnceEx -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos13 then  //Machine - RunServices
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos14 then  //Machine - RunServices -
    begin
      if reg1.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos15 then  //User - RunOnceEx
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos16 then  //User - RunOnceEx -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx-',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos17 then  //User - RunServices
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos18 then  //User - RunServices -
    begin
      if reg2.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices-',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end

    else if ListItem.SubItems.Strings[2]=pos31 then  //Machine - Run2
    begin
      if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos32 then  //Machine - Run2 -
    begin
      if reg1.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',false) then
        if reg1.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos33 then  //User - Run2
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos34 then  //User - Run2 -
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run-',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end

    else if ListItem.SubItems.Strings[2]=pos40 then  //User - Load
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos41 then  //User - Load -
    begin
      if reg2.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion\Windows-',false) then
        if reg2.DeleteValue(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end

    else if ListItem.SubItems.Strings[2]=pos1 then  //启动文件夹(所有用户)
    begin
      chdir(startall);
      if deletefile(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos2 then  //启动文件夹(当前用户)
    begin
      chdir(start);
      if deletefile(ListItem.SubItems.Strings[0]) then ListItem.Delete;
    end
    else if ListItem.SubItems.Strings[2]=pos19 then  //启动文件夹(所有用户_禁止)
    begin
      chdir(startalldis);
      if deletefile(ListItem.SubItems.Strings[0]) then ListItem.Delete;
      chdir(startall); RemoveDir(startalldis);
    end
    else if ListItem.SubItems.Strings[2]=pos20 then  //启动文件夹(当前用户_禁止)
    begin
      chdir(startdis);
      if deletefile(ListItem.SubItems.Strings[0]) then ListItem.Delete;
      chdir(start); RemoveDir(startdis);
    end;
end;

procedure TFrmStartMana.PopupMenu1Popup(Sender: TObject);
begin
  if ListView1.Selected = nil
  then begin N1.Enabled:=false; N2.Enabled:=false; N6.Enabled:=false; end
  else if ListView1.Selected.Caption=enab
    then begin N1.Enabled:=false; N2.Enabled:=true; N6.Enabled:=true; end
    else begin N1.Enabled:=true; N2.Enabled:=false; N6.Enabled:=true; end;
end;

procedure TFrmStartMana.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin //排序
  ColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TFrmStartMana.ListView1Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var ix: Integer;
begin //排序
  if ColumnToSort = 0
  then Compare := CompareText(Item1.Caption,Item2.Caption)
  else
    begin
      ix := ColumnToSort - 1;
      Compare := CompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
    end;
end;

procedure TFrmStartMana.N8Click(Sender: TObject);
begin //关闭
  close
end;

procedure TFrmStartMana.btnCloseClick(Sender: TObject);
begin //按 Cancel 时关闭窗口
  close
end;

end.
