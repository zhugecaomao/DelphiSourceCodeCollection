{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcDiskScannerEditor.pas - Property and Component Editors
        for dcMultiDiskScanner component.

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcDiskScannerEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, 
  Registry, Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls,

{$IFDEF D6}
  DesignIntf, DesignWindows,
{$ELSE}
  DsgnIntf, DsgnWnds,
{$ENDIF}

  dcDiskScanner, Dialogs, dcEdits;

type
  TDiskScannerEditor = class(TDesignWindow)
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    DeleteBtn: TBitBtn;
    ClearBtn: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    AddBtn: TBitBtn;
    Label2: TLabel;
    PopupMenu: TPopupMenu;
    AddItem: TMenuItem;
    DeleteItem: TMenuItem;
    ListView: TListView;
    CloseBtn: TBitBtn;
    LoadBtn: TButton;
    SaveBtn: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PathEdit: TdcFolderEdit;
    procedure AddBtnClick(Sender: TObject);
    procedure PathEditChange(Sender: TObject);
    procedure ListViewClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure ListViewEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PathEditKeyPress(Sender: TObject; var Key: Char);
    procedure CloseBtnClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    procedure SavePlacement;
    procedure RestorePlacement;

    function  GetCurrentList: TDiskScanList;
    procedure RefreshList;
  public
    Exclude: Boolean;
    MultiDiskScanner: TdcMultiDiskScanner;

    property CurrentList: TDiskScanList read GetCurrentList;
  end;

{$IFNDEF D4}
type
  IDesigner = TDesigner;
  IFormDesigner = TFormDesigner;
{$ENDIF}

procedure ShowMultiDiskScannerDesigner(Designer: IDesigner; MultiDiskScanner: TdcMultiDiskScanner; IsExclude: Boolean);

implementation

uses dcBrowseDialog;

{$R *.DFM}

const
  PlacementKey = '\Software\UtilMind Solutions\DiskControls\DiskScanner Editor';

// ---------------------------------------------------

procedure ShowMultiDiskScannerDesigner(Designer: IDesigner; MultiDiskScanner: TdcMultiDiskScanner; IsExclude: Boolean);
var
  Editor: TDiskScannerEditor;

  function FindEditor(MultiDiskScanner: TdcMultiDiskScanner; Exclude: Boolean): TDiskScannerEditor;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to Screen.FormCount - 1 do
     if Screen.Forms[i] is TDiskScannerEditor then
      begin
       if (TDiskScannerEditor(Screen.Forms[i]).MultiDiskScanner = MultiDiskScanner) and
          (TDiskScannerEditor(Screen.Forms[i]).Exclude = Exclude) then
        begin
         Result := TDiskScannerEditor(Screen.Forms[i]);
         Break;
        end;
      end;  
  end;

begin
  if MultiDiskScanner = nil then Exit;
  Editor := FindEditor(MultiDiskScanner, IsExclude);
  if Editor <> nil then
   begin
    Editor.Show;
    if Editor.WindowState = wsMinimized then
      Editor.WindowState := wsNormal;
   end
  else
   begin
    Editor := TDiskScannerEditor.Create(nil);
    try
      {$IFDEF D6}
      Editor.Designer := Designer;
      {$ELSE}
      Editor.Designer := IFormDesigner(Designer);
      {$ENDIF}
      Editor.MultiDiskScanner := MultiDiskScanner;
      Editor.Exclude := IsExclude;
      Editor.Show;
    except
      Editor.Free;
      raise;
    end;
  end;
end;

procedure TDiskScannerEditor.SavePlacement;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  with Reg do
   try
     RootKey := HKEY_CURRENT_USER;
     OpenKey(PlacementKey, True);
     if Exclude then
      begin
       WriteInteger('ExcludeListEditor.Left', Left);
       WriteInteger('ExcludeListEditor.Top', Top);
      end
     else
      begin
       WriteInteger('IncludeListEditor.Left', Left);
       WriteInteger('IncludeListEditor.Top', Top);
      end;
   except
   end;
  Reg.Free;
end;

procedure TDiskScannerEditor.RestorePlacement;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  with Reg do
   try
     RootKey := HKEY_CURRENT_USER;
     OpenKey(PlacementKey, True);
     if Exclude then
      begin
       Left := ReadInteger('ExcludeListEditor.Left');
       Top := ReadInteger('ExcludeListEditor.Top');
      end
     else
      begin
       Left := ReadInteger('IncludeListEditor.Left');
       Top := ReadInteger('IncludeListEditor.Top');
      end;  
   except
   end;
  Reg.Free;
end;

function  TDiskScannerEditor.GetCurrentList: TDiskScanList;
begin
  if Exclude then Result := MultiDiskScanner.ExcludeList
  else Result := MultiDiskScanner.IncludeList;
end;

procedure TDiskScannerEditor.RefreshList;
var
  I: Integer;
  ScannerPath: TDiskScannerPath;
  ListItem: TListItem;
begin
  ListView.Items.Clear;

  I := CurrentList.Count;
  if I <> 0 then
   begin
    for I := 0 to I - 1 do
     begin
      ScannerPath := CurrentList[I];

      ListItem := ListView.Items.Add;
      ListItem.Caption := ScannerPath.PathMask;
      ListItem.Checked := ScannerPath.IncludeSubfolders;
     end;
    ClearBtn.Enabled := True; 
   end;

  Designer.Modified;
end;

procedure TDiskScannerEditor.FormShow(Sender: TObject);
begin
  if Exclude then
    Caption := MultiDiskScanner.Name + '.ExcludeFiles'
  else
    Caption := MultiDiskScanner.Name + '.IncludeFiles';

  {$IFDEF VERSION3}
  ListView.RowSelect := True;
  {$ENDIF}

  RefreshList;

  RestorePlacement;
end;

procedure TDiskScannerEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;

  SavePlacement;
end;

procedure TDiskScannerEditor.PathEditChange(Sender: TObject);
begin
  AddBtn.Enabled := PathEdit.Text <> '';
  AddItem.Enabled := AddBtn.Enabled;
  ClearBtn.Enabled := CurrentList.Count <> 0;
end;

procedure TDiskScannerEditor.ListViewClick(Sender: TObject);
begin
  DeleteBtn.Enabled := ListView.Selected <> nil;
  DeleteItem.Enabled := DeleteBtn.Enabled;
  ClearBtn.Enabled := CurrentList.Count <> 0;
end;

procedure TDiskScannerEditor.PathEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
   begin
    Key := #0;
    AddBtnClick(nil);
   end;
end;

procedure TDiskScannerEditor.AddBtnClick(Sender: TObject);
var
  SearchPath: TDiskScannerPath;
  ListItem: TListItem;
begin
  SearchPath := TDiskScannerPath.Create(PathEdit.Text, False);
  CurrentList.Add(SearchPath);
  ListItem := ListView.Items.Add;
  ListItem.Caption := PathEdit.Text;
  ClearBtn.Enabled := True;

  Designer.Modified;  
end;

procedure TDiskScannerEditor.DeleteBtnClick(Sender: TObject);
var
  I: Integer;
  SearchPath: TDiskScannerPath;
  ListItem: TListItem;
begin
  DeleteBtn.Enabled := False;
  DeleteItem.Enabled := False;
  
  ListItem := ListView.Selected;

  if ListItem <> nil then
   begin
    I := CurrentList.Count;
    if I <> 0 then
     for I := 0 to I - 1 do
      begin
       SearchPath := CurrentList[I];
       if SearchPath.PathMask = ListItem.Caption then
        begin
         CurrentList.Delete(I);
         ListView.Items.Delete(ListItem.Index);

         if ListView.Items.Count = 0 then
           ClearBtn.Enabled := False;
         Designer.Modified;
         Exit;
        end;
      end;
   end;
  Designer.Modified;   
end;

procedure TDiskScannerEditor.ClearBtnClick(Sender: TObject);
begin
  CurrentList.Clear;
  ListView.Items.Clear;
  DeleteBtn.Enabled := False;
  ClearBtn.Enabled := False;

  Designer.Modified;
end;

procedure TDiskScannerEditor.ListViewEdited(Sender: TObject;
  Item: TListItem; var S: String);
var
  I: Integer;
  SearchPath: TDiskScannerPath;
begin
  if CurrentList.Count <> 0 then
   for I := 0 to CurrentList.Count - 1 do
    begin
     SearchPath := CurrentList[I];
     if SearchPath.PathMask = Item.Caption then
       SearchPath.PathMask := S;
     Exit;
    end;
end;

procedure TDiskScannerEditor.ListViewChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  I: Integer;
  SearchPath: TDiskScannerPath;
begin
  if (Change = ctState) and (CurrentList.Count <> 0) then
   for I := 0 to CurrentList.Count - 1 do
    begin
     SearchPath := CurrentList[I];
     if SearchPath.PathMask = Item.Caption then
      begin
       SearchPath.IncludeSubfolders := Item.Checked;
       Exit;
      end;
    end;
end;

procedure TDiskScannerEditor.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TDiskScannerEditor.LoadBtnClick(Sender: TObject);
begin
  OpenDialog.Title := 'Select file to import the ';
  if Exclude then OpenDialog.Title := OpenDialog.Title + 'ExcludeList'
  else OpenDialog.Title := OpenDialog.Title + 'IncludeList';

  if OpenDialog.Execute then
   begin
    CurrentList.LoadFromFile(OpenDialog.FileName);
    RefreshList;
   end;
end;

procedure TDiskScannerEditor.SaveBtnClick(Sender: TObject);
begin
  SaveDialog.Title := 'Select file to export the ';
  if Exclude then SaveDialog.Title := SaveDialog.Title + 'ExcludeList'
  else SaveDialog.Title := SaveDialog.Title + 'IncludeList';

  if SaveDialog.Execute then
    CurrentList.SaveToFile(SaveDialog.FileName);
end;

end.
