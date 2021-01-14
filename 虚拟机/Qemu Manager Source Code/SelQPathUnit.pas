unit SelQPathUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, FileCtrl, ComCtrls, TntComCtrls;

type
  TSELQ = class(TForm)
    FL: TFileListBox;
    FB: TTntButton;
    Button2: TTntButton;
    TV: TTntTreeView;
    procedure BuildTree;
    Procedure Getdirs;
    procedure FormShow(Sender: TObject);
    procedure TVClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SELQ: TSELQ;

implementation
uses MainUnit;

{$R *.dfm}

Procedure TSelQ.BuildTree;
var
i,j : Integer;
Begin
TV.Items.Clear;
if(TV.Items.Count = 0) then
  begin
  with TV.Items.AddFirst(nil,'Qemu Manager') do
	  begin
    Selected := true;
    ImageIndex := 5;
    SelectedIndex := 5;
    end;
  GetDirs;
  FL.Mask := '*.exe';
  FL.ApplyFilePath(SysPath+'\qemu')
  end
else Exit;
End;

Procedure TSelQ.Getdirs;
var
  sr: TSearchRec;
  FileAttrs: Integer;
begin
FileAttrs := faDirectory;

    if FindFirst(SysPath+'\qemu\*.*', FileAttrs, sr) = 0 then
    begin
      repeat
        if (sr.Attr and FileAttrs) = sr.Attr then
        begin
        IF (sr.name = '.') or (sr.name = '..') Then bEGIN END ELSE
          Begin
          with tv.Items.AddChildFirst(TV.Selected,sr.name) do
            Begin
            ImageIndex := 5;
            SelectedIndex := 5;
            MakeVisible;
            End;
          end;
        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
  end;
procedure TSELQ.FormShow(Sender: TObject);
begin
BuildTree;
end;

procedure TSELQ.TVClick(Sender: TObject);
begin
iF tv.items.Count > 0 Then
  Begin
  if Tv.selected.text = 'Qemu Manager' Then FL.ApplyFilePath(SysPath+'\qemu') Else
    Begin
    FL.ApplyFilePath(SysPath+'\qemu\'+tv.selected.text);
    End;
  end;
End;

end.
