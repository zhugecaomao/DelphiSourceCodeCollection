unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, StdCtrls, Buttons,ClipBrd,Printers;

type
  TDrawingTool = (dtLine,dtRectangle,dtEllipse,dtRoundRect);
  TPaletteForm = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    Image1: TImage;
    F1: TMenuItem;
    F2: TMenuItem;
    New: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    Print: TMenuItem;
    Exit: TMenuItem;
    Copy: TMenuItem;
    Paste: TMenuItem;
    Cut: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBoxGraphic: TComboBox;
    SpeedButtonErase: TSpeedButton;
    ComboBoxPenStyle: TComboBox;
    ComboBoxBrushStyle: TComboBox;
    SpeedButtonPenColor: TSpeedButton;
    SpeedButtonBrushColor: TSpeedButton;
    ColorDialog1: TColorDialog;
    EditPenWidth: TEdit;
    UpDownPenWidth: TUpDown;
    SaveAs: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBoxGraphicChange(Sender: TObject);
    procedure SpeedButtonPenColorClick(Sender: TObject);
    procedure EditPenWidthChange(Sender: TObject);
    procedure ComboBoxPenStyleChange(Sender: TObject);
    procedure SpeedButtonBrushColorClick(Sender: TObject);
    procedure ComboBoxBrushStyleChange(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    procedure PasteClick(Sender: TObject);
    procedure CutClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    Draw: Boolean;
    Origin,MovePt: TPoint;
    OriginDrawingTool,DrawingTool: TDrawingTool;
    OriginPenColor: TColor;
    OriginPenWidth :Integer;
    CurrentFile: AnsiString;
    procedure DrawShape(TopLeft,BottomRight: TPoint;AMode: TPenMode);
  end;

var
  PaletteForm: TPaletteForm;

implementation

uses Unit2;

{$R *.dfm}
procedure TPaletteForm.DrawShape(TopLeft,BottomRight: TPoint;AMode: TPenMode);
begin
  Image1.Canvas.Pen.Mode := AMode; //…Ë÷√ªÊÕº± µƒƒ£ Ω
  case DrawingTool of
    dtLine: //ª≠÷±œﬂ
    begin
      Image1.Canvas.MoveTo(TopLeft.X,TopLeft.Y);
      Image1.Canvas.LineTo(BottomRight.X,BottomRight.Y);
    end;
    dtRectangle: //ª≠æÿ–Œ
    begin
      Image1.Canvas.Rectangle(TopLeft.X,TopLeft.Y,BottomRight.X,BottomRight.Y);
    end;
    dtEllipse: //ª≠Õ÷‘≤
    begin
      Image1.Canvas.Ellipse(TopLeft.X,TopLeft.Y,BottomRight.X,BottomRight.Y);
    end;
    dtRoundRect: //ª≠‘≤Ω«æÿ–Œ
    begin
      Image1.Canvas.RoundRect(TopLeft.X,TopLeft.Y,BottomRight.X,BottomRight.Y,(TopLeft.X - BottomRight.X) div 2,
      (TopLeft.Y - BottomRight.Y) div 2);
    end;
  end;
end;

procedure TPaletteForm.FormCreate(Sender: TObject);
begin
  DrawingTool := dtLine;
  Draw := false;
  Image1.Cursor := crCross;
end;

procedure TPaletteForm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Draw then
  begin
    if SpeedButtonErase.Down = true then
    begin
      Image1.Canvas.LineTo(X,Y);
      Image1.Canvas.MoveTo(X,Y);
    end
    else
    begin
      DrawShape(Origin,MovePt,pmNotXor);
      MovePt.X := X;
      MovePt.Y := Y;
      DrawShape(Origin,MovePt,pmNotXor);
    end;
  end;
  StatusBar1.Panels.Items[3].Text := Format('(%d,%d)',[X,Y]);
end;

procedure TPaletteForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Draw := true;
  Image1.Canvas.MoveTo(X,Y);
  Origin.X := X;
  Origin.Y := Y;
  MovePt := Origin;
  StatusBar1.Panels.Items[1].Text := Format('(%d,%d)',[X,Y]);
end;

procedure TPaletteForm.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Draw then
  begin
    if SpeedButtonErase.Down <> True then
    begin
      MovePt.X := X;
      MovePt.Y := Y;
      DrawShape(Origin,MovePt,pmCopy);
    end;
    Draw := False;
  end;
end;

procedure TPaletteForm.ComboBoxGraphicChange(Sender: TObject);
begin
  case ComboBoxGraphic.ItemIndex of
    0: DrawingTool := dtLine;
    1: DrawingTool := dtRectangle;
    2: DrawingTool := dtEllipse;
    3: DrawingTool := dtRoundRect;
  end;
end;

procedure TPaletteForm.SpeedButtonPenColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Image1.Canvas.Pen.Color := ColorDialog1.Color;
end;

procedure TPaletteForm.EditPenWidthChange(Sender: TObject);
begin
  Image1.Canvas.Pen.Width := UpDownPenWidth.Position;
end;

procedure TPaletteForm.ComboBoxPenStyleChange(Sender: TObject);
begin
  Image1.Canvas.Pen.Style := TPenStyle(ComboBoxPenStyle.ItemIndex);
end;

procedure TPaletteForm.SpeedButtonBrushColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Image1.Canvas.Brush.Color := ColorDialog1.Color;
end;

procedure TPaletteForm.ComboBoxBrushStyleChange(Sender: TObject);
begin
Image1.Canvas.Brush.Style := TBrushStyle(ComboBoxBrushStyle.ItemIndex);
end;

procedure TPaletteForm.ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TPaletteForm.OpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    CurrentFile := OpenDialog1.FileName;
    Image1.Picture.LoadFromFile(CurrentFile);
  end;
end;

procedure TPaletteForm.SaveClick(Sender: TObject);
begin
  if CurrentFile <> EmptyStr then
    Image1.Picture.SaveToFile(CurrentFile)
  else
    SaveAsClick(Sender);
end;

procedure TPaletteForm.SaveAsClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    CurrentFile := SaveDialog1.FileName;
    SaveClick(Sender);
  end;
end;

procedure TPaletteForm.NewClick(Sender: TObject);
var
  pic: TBitmap;
begin
  NewPicForm.ActiveControl := NewPicForm.EditWidth;
  NewPicForm.EditWidth.Text := IntToStr(Image1.Picture.Graphic.Width);
  NewPicForm.EditHeight.Text := IntToStr(Image1.Picture.Graphic.Height);
  if NewPicForm.ShowModal <> IDCANCEL then
  begin
    pic := TBitmap.Create;
    pic.Width := StrToInt(NewPicForm.EditWidth.Text);
    pic.Height := StrToInt(NewPicForm.EditHeight.Text);
    Image1.Picture.Graphic := pic;
    CurrentFile := EmptyStr;
  end;
end;

procedure TPaletteForm.CopyClick(Sender: TObject);
begin
  ClipBoard.Assign(Image1.Picture.Bitmap);
end;

procedure TPaletteForm.PasteClick(Sender: TObject);
var
  Bitmap: TBitmap;
begin
  if ClipBoard.HasFormat(CF_BITMAP) then
  begin
    Bitmap := TBitmap.Create;
    try
    begin
      Bitmap.Assign(ClipBoard);
      Image1.Canvas.Draw(0,0,Bitmap);
      Bitmap.Free;
    end;
    except
      Bitmap.Free;
    end;
  end;
end;

procedure TPaletteForm.CutClick(Sender: TObject);
var
  ARect: TRect;
begin
  CopyClick(Sender);
  Image1.Canvas.CopyMode := cmWhiteness;
  ARect.Left := 0;
  ARect.Top := 0;
  ARect.Right :=Image1.Width;
  ARect.Bottom := Image1.Height;
  Image1.Canvas.CopyRect(ARect,Image1.Canvas,ARect);
  Image1.Canvas.CopyMode := cmSrcCopy;
end;

procedure TPaletteForm.PrintClick(Sender: TObject);
begin
  Printer.BeginDoc;
  Printer.Canvas.CopyRect(Image1.ClientRect,Image1.Canvas,Image1.ClientRect);
  Printer.EndDoc;
end;

end.
