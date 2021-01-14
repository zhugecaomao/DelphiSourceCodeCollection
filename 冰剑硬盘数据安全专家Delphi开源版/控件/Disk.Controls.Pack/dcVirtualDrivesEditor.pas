{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcVirtualDrivesEditor.pas - dcVirtualDrivesEditor component

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

unit dcVirtualDrivesEditor;

interface

uses
  Windows, Classes, Controls, Forms, StdCtrls, dcInternal, dcEdits,
  dcVirtualDrives;

type
  TVirtualDrivesEditor = class(TForm)
    DriveBox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TargetEdit: TdcFolderEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    dcVirtualDrives1: TdcVirtualDrives;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DriveBoxChange(Sender: TObject);
  private
    { Private declarations }
  public
    IsAddDrive: Boolean;
  end;

implementation

{$R *.DFM}

uses SysUtils, dcUtils;

procedure TVirtualDrivesEditor.FormShow(Sender: TObject);
var
  I: Integer;
  St: String;
begin
  with dcVirtualDrives1 do
   if IsAddDrive then
    begin
     St := UnusedDrives;
     Caption := 'Add virtual drive';
    end
   else
    begin
     St := VirtualDrives;
     Caption := 'Delete virtual drive';
     TargetEdit.Button.Visible := False;
     TargetEdit.Enabled := False;
    end;

  I := Length(St);
  if I <> 0 then
   begin
    for I := 1 to I do
      DriveBox.Items.Add(St[I] + ':');
    DriveBox.ItemIndex := 0;
    DriveBoxChange(nil);
   end;
end;

procedure TVirtualDrivesEditor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult <> mrOk then Exit;

  if DriveBox.ItemIndex < 0 then
   begin
    Application.MessageBox('Drive is not selected.', 'dcVirtualDrives', MB_OK or MB_ICONSTOP);
    DriveBox.SetFocus;
    CanClose := False;
    Exit;
   end;
  if TargetEdit.Text = '' then
   begin
    Application.MessageBox('Select target directory.', 'dcVirtualDrives', MB_OK or MB_ICONWARNING);
    TargetEdit.SetFocus;
    CanClose := False;
    Exit;
   end;
  if not DirectoryExists(TargetEdit.Text) then
   begin
    Application.MessageBox('Target directory does not exists. Please select another directory.', 'dcVirtualDrives', MB_OK or MB_ICONWARNING);
    TargetEdit.SetFocus;
    CanClose := False;
    Exit;
   end;
  if Pos(TargetEdit.Text[1], dcVirtualDrives1.VirtualDrives) <> 0 then
   begin
    Application.MessageBox('You can''t point directory of another virtual drive. Please choose another target.', 'dcVirtualDrives', MB_OK or MB_ICONWARNING);
    TargetEdit.SetFocus;
    CanClose := False;
   end;
end;

procedure TVirtualDrivesEditor.DriveBoxChange(Sender: TObject);
begin
  if not IsAddDrive then
    TargetEdit.Text := LowerCase(dcVirtualDrives1.GetTargetByDrive(DriveBox.Items[DriveBox.ItemIndex][1]));
end;

end.
