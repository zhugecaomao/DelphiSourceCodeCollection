unit GetDirUnit;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, FileCtrl,TntStdCtrls, TntDBCtrls, TntComCtrls, TntDBGrids,
  TntDialogs,TntForms, TntExtCtrls;

type
  TSelDir = class(TTNTForm)
    Button2: TTNTButton;
    Button1: TTNTButton;
    DL: TDirectoryListBox;
    DRL: TDriveComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelDir: TSelDir;

implementation
Uses MainUnit;

{$R *.dfm}

procedure TSelDir.Button1Click(Sender: TObject);
begin
GetShellDirectory := DL.Directory;
Close;
end;

procedure TSelDir.Button2Click(Sender: TObject);
begin
GetshellDirectory := '';
Close;
end;

end.
