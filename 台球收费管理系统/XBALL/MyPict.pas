unit MyPict;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, FileCtrl, StdCtrls, Registry, JPEG;

type
  TPictForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    File1: TFileListBox;
    Dir1: TDirectoryListBox;
    Drive1: TDriveComboBox;
    filter1: TFilterComboBox;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    procedure Image1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Dir1Change(Sender: TObject);
    procedure File1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Drive1Change(Sender: TObject);
    procedure Dir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PictForm: TPictForm;

implementation

uses SeeDraw, Mydesk, MenuExec;

{$R *.DFM}

procedure TPictForm.Image1DblClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  Button3.Caption := '自  动';
  if file1.filename = '' then Exit;
  SeeForm := TSeeForm.Create(Self);
  SeeForm.Image1.Picture.LoadFromFile(file1.filename);
  Hide;
  SeeForm.Showmodal;
  Show;
end;

procedure TPictForm.Button4Click(Sender: TObject);
var
//  R: TRegIniFile;
  H: Integer;
begin
  DeskBMP := File1.FileName;
  A00Form.Image1.Picture.LoadFromFile(DeskBMP);
  SystemParametersInfo(
    SPI_SETDESKWALLPAPER, 0,
    PChar(DeskBMP), SPIF_UPDATEINIFILE);
  SendMessage(FindWindow('Progman', nil),
    WM_SETTINGCHANGE,
    SPI_SETDESKWALLPAPER,
    Integer(@H)); //确保WEB模式桌面更新
end;

procedure TPictForm.Button3Click(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
  if Timer1.Enabled then Button3.Caption := '停  止'
  else Button3.Caption := '自  动'
end;

procedure TPictForm.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Button3.Caption := '自  动';
  File1.ItemIndex := File1.ItemIndex - 1;
  File1Click(Self);
end;

procedure TPictForm.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Button3.Caption := '自  动';
  File1.ItemIndex := File1.ItemIndex + 1;
  File1Click(Self);
end;

procedure TPictForm.File1Click(Sender: TObject);
var X, Y: Word;
begin
  with File1 do
    if Filename = '' then begin
      Image1.Picture := nil;
      Label1.Caption := '';
    end else begin
      Image1.Picture.LoadFromFile(Filename);
      X := Image1.Picture.Width;
      Y := Image1.Picture.Height;
      Label1.Caption := InttoStr(X) + 'x' + InttoStr(Y)
        + '--' + inttostr(Panel1.Width * 100 div X) + '%';
    end;
  Label1.Update;
end;

procedure TPictForm.Timer1Timer(Sender: TObject);
begin
  with File1 do
  begin
    if Items.Count = 0 then exit;
    if ItemIndex = Items.Count - 1 then
    begin
      Timer1.Enabled := False;
      Button3.Caption := '自  动';
      ItemIndex := 0;
    end else
      ItemIndex := ItemIndex + 1;
    File1Click(Self);
  end;
end;

procedure TPictForm.Drive1Change(Sender: TObject);
begin
  Dir1Change(Self);
end;

procedure TPictForm.Dir1Change(Sender: TObject);
begin
  Timer1.Enabled := False;
  Button3.Caption := '自  动';
  File1.ItemIndex := 0;
  File1Click(Self);
end;

procedure TPictForm.File1DblClick(Sender: TObject);
begin
  Image1DblClick(Self);
end;

procedure TPictForm.FormCreate(Sender: TObject);
begin
  Image1.Align := AlClient;
  File1.ItemIndex := 0;
  Timer1.Enabled := False;
end;

procedure TPictForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
  Button3.Caption := '自  动';
  Action := caFree;
end;

procedure TPictForm.Dir1Click(Sender: TObject);
begin
  Dir1.OpenCurrent;
end;

end.
