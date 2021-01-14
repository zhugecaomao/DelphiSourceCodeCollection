unit Mydesk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ExtDlgs, Registry;

type
  TDeskForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    OK: TButton;
    Cancel: TButton;
    Help: TButton;
    Load: TButton;
    Save: TButton;
    Clear: TButton;
    Panel3: TPanel;
    Animate1: TAnimate;
    Open1: TOpenPictureDialog;
    R1: TRadioGroup;
    procedure LoadClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure R1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeskBMP: string = '';
  TestBMP: string = '';
  DeskForm: TDeskForm;
  S1, S2: Word;

implementation

uses MenuExec;

{$R *.DFM}

procedure TDeskForm.LoadClick(Sender: TObject);
begin
  if not Open1.Execute then Exit;
  Image1.Show;
  TestBMP := Open1.Filename;
  Image1.Picture.LoadfromFile(TestBMP);
  Save.Enabled := TestBMP <> '';
  Clear.Enabled := Save.Enabled;
  Animate1.Active := Save.Enabled;
  OK.SetFocus;
end;

procedure TDeskForm.FormCreate(Sender: TObject);
var P: array[0..79] of Char;
  R: TRegIniFile;
begin
  R := TRegIniFile.Create('Control Panel');
  S1 := R.ReadInteger('Desktop', 'TileWallPaper', 0);
  S2 := R.ReadInteger('Desktop', 'WallPaperStyle', 0);
  //tile ( 1-平铺 0-居中 2-拉伸)
  R.Free;
  Animate1.FileName := ExtractFileDir(Paramstr(0)) + '\Cool.AVI';
  GetWindowsDirectory(P, 40);
  Open1.InitialDir := P;
  R1.Items.Add('居中');
  R1.Items.Add('平铺');
  R1.Items.Add('拉伸');
  R1.Items.Add('忽略');
  if S2 = 2 then R1.ItemIndex := S2 else R1.ItemIndex := S1;
end;

procedure TDeskForm.OKClick(Sender: TObject);
var R: TRegIniFile;
begin
  DeskBMP := TestBMP;
  if DeskBMP = '' then A00Form.Image1.Picture := nil
  else A00Form.Image1.Picture.LoadFromFile(DeskBMP);
  if R1.ItemIndex = 3 then Exit;
  R := TRegIniFile.Create('Control Panel');
  R.WriteString('Desktop', 'WallPaper', DeskBMP);
  R.WriteInteger('Desktop', 'TileWallPaper', S1);
  R.WriteInteger('Desktop', 'WallPaperStyle', S2);
  //tile ( 1-平铺 0-居中 2-拉伸)
  R.Free;
  SystemParametersInfo(
    SPI_SETDESKWALLPAPER, 0,
    nil, SPIF_SENDCHANGE);
  SendMessage(FindWindow('Progman', nil),
    WM_SETTINGCHANGE,
    SPI_SETDESKWALLPAPER,
    Integer(@DeskBMP)); //确保桌面更新
end;

procedure TDeskForm.ClearClick(Sender: TObject);
begin
  TestBMP := '';
  Image1.Picture := nil;
  Clear.Enabled := False;
  Save.Enabled := False;
  Animate1.Active := False;
end;

procedure TDeskForm.FormActivate(Sender: TObject);
begin
  TestBMP := DeskBMP;
  Save.Enabled := TestBMP <> '';
  Clear.Enabled := Save.Enabled;
  if not Save.Enabled then begin
    Animate1.Active := False;
    Image1.Picture := nil;
  end
  else if FileExists(DeskBMP) then begin
    Animate1.Active := True;
    Image1.Picture.LoadFromFile(DeskBMP);
  end;
end;

procedure TDeskForm.SaveClick(Sender: TObject);
begin
  if not Open1.Execute then Exit;
  Image1.Picture.SaveToFile(Open1.Filename);
end;

procedure TDeskForm.R1Click(Sender: TObject);
begin
  if R1.ItemIndex = 2 then begin
    S1 := 0;
    S2 := R1.ItemIndex;
  end else begin
    S1 := R1.ItemIndex;
    S2 := 0;
  end;
end;

end.
