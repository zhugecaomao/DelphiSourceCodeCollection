unit Unit1;

interface

uses
  Windows, Classes, Graphics, Forms, Controls,
  Menus, StdCtrls, Dialogs, ExtCtrls, ExtDlgs;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Image1: TImage;
    Splitter1: TSplitter;
    OpenDialog1: TOpenDialog;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SavePictureDialog1: TSavePictureDialog;
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    ReplaceDialog1: TReplaceDialog;
    Panel1: TPanel;
    Button1: TButton;
    Button6: TButton;
    Button7: TButton;
    Button2: TButton;
    Button3: TButton;
    Button8: TButton;
    Button4: TButton;
    Button9: TButton;
    Button5: TButton;
    Button10: TButton;
    procedure FindDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure FontDialogApply(Sender: TObject; Wnd: HWND);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
     Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FindDialog1Find(Sender: TObject);
var
  FoundPos, InitPos: Integer;
begin
  InitPos := Memo1.SelStart + Memo1.SelLength;
  FoundPos := Pos (FindDialog1.FindText,
    Copy (Memo1.Text, InitPos + 1,
      Length (Memo1.Text) - InitPos));
  if FoundPos > 0 then
  begin

    Memo1.SetFocus;
    Memo1.SelStart := InitPos + FoundPos - 1;
    Memo1.SelLength := Length(FindDialog1.FindText);
  end
  else
  begin
    MessageDlg ('没找到。', mtInformation, [mbOK], 0);
  end;
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
var
  FoundPos, InitPos: Integer;
begin
  InitPos := Memo1.SelStart + Memo1.SelLength;
  FoundPos := Pos (ReplaceDialog1.FindText,
    Copy (Memo1.Text, InitPos + 1,
      Length (Memo1.Text) - InitPos));
  if FoundPos > 0 then
  begin
    Memo1.SetFocus;
    Memo1.SelStart := InitPos + FoundPos - 1;
    Memo1.SelLength := Length (ReplaceDialog1.FindText);
    Memo1.SelText := ReplaceDialog1.ReplaceText;
  end
  else
  begin
    MessageDlg ('没有找到。', mtInformation, [mbOK], 0);
  end;
end;

procedure TForm1.ReplaceDialog1Find(Sender: TObject);
begin
  FindDialog1.FindText := ReplaceDialog1.FindText;
  FindDialog1Find (ReplaceDialog1);
end;

procedure TForm1.FontDialogApply(Sender: TObject; Wnd: HWND);
begin
  Memo1.Font := FontDialog1.Font;
end;                        

procedure TForm1.Button1Click(Sender: TObject);
begin
    OpenDialog1.Filename := '';
    if OpenDialog1.Execute then
      Memo1.Lines.LoadFromFile (OpenDialog1.FileName);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    OpenPictureDialog1.FileName := '';
    if OpenPictureDialog1.Execute then
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    SaveDialog1.Filename := '';
    if SaveDialog1.Execute then
      Memo1.Lines.SaveToFile (SaveDialog1.FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Bitmap:TBitmap;
begin
  Bitmap:=TBitmap.Create;
  Bitmap:=self.GetFormImage();
  SavePictureDialog1.FileName :='';
  if SavePictureDialog1.Execute then
    Bitmap.SaveToFile(SavePictureDialog1.FileName);
  Bitmap.Free;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
    if FontDialog1.Execute then
      Memo1.Font := FontDialog1.Font;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
    if ColorDialog1.Execute then
      Memo1.Color := ColorDialog1.Color;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  ReplaceDialog1.Execute;
end;

end.

