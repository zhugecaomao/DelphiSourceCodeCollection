unit Fcontract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  ExtCtrls, ToolWin, Menus, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, dxPSRELnk;

type
  Tcontract = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBRichEdit1: TDBRichEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    Image1: TImage;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton1: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    FontName: TComboBox;
    ToolButton2: TToolButton;
    FontSize: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    FontDialog1: TFontDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure DBRichEdit1SelectionChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure FontSizeKeyPress(Sender: TObject; var Key: Char);
    procedure FontNameChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    function CurrText: TTextAttributes;
    procedure GetFontNames;
  public
    { Public declarations }
  end;

var
  contract: Tcontract;

implementation

uses fmain;
{$R *.dfm}
function Tcontract.CurrText: TTextAttributes;
begin
  if DBRichEdit1.SelLength > 0 then Result := DBRichEdit1.SelAttributes
  else Result := DBRichEdit1.DefAttributes;
end;

procedure Tcontract.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tcontract.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  main.r_staffcontract.Cancel;
  main.r_staffcontract.Close;
  main.r_staffcontract.Open;
end;

procedure Tcontract.Button2Click(Sender: TObject);
begin
  if trim(self.DBEdit1.Text)='' then
    begin
      MessageBox(handle,'合同名称不能为空！','提示',MB_ICONinformation or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      self.DBEdit1.SetFocus;
      exit;
    end;
  if self.cxDBDateEdit1.Date>self.cxDBDateEdit2.Date then
    begin
      MessageBox(handle,'起始日期设置错误！','提示',MB_ICONinformation or MB_OK);
      self.PageControl1.ActivePageIndex:=0;
      exit;
    end;
  main.r_staffcontract.Post;
  self.Close;
end;

procedure Tcontract.FormShow(Sender: TObject);
begin
  self.DBEdit1.SetFocus;
end;

procedure Tcontract.BoldButtonClick(Sender: TObject);
begin
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure Tcontract.FormCreate(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex:=0;
  GetFontNames;
end;

procedure Tcontract.ItalicButtonClick(Sender: TObject);
begin
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure Tcontract.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure Tcontract.UnderlineButtonClick(Sender: TObject);
begin
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure Tcontract.DBRichEdit1SelectionChange(Sender: TObject);
begin
  with DBRichEdit1.Paragraph do
  try
    BoldButton.Down := fsBold in DBRichEdit1.SelAttributes.Style;
    ItalicButton.Down := fsItalic in DBRichEdit1.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in DBRichEdit1.SelAttributes.Style;
    FontSize.Text := IntToStr(DBRichEdit1.SelAttributes.Size);
    FontName.Text := DBRichEdit1.SelAttributes.Name;
    self.FontDialog1.Font.Color:=  self.DBRichEdit1.SelAttributes.Color;
    self.FontDialog1.Font.Name:=  self.DBRichEdit1.SelAttributes.Name;
    self.FontDialog1.Font.Size:=  self.DBRichEdit1.SelAttributes.Size;
    self.FontDialog1.Font.Style:=  self.DBRichEdit1.SelAttributes.Style;
    self.FontDialog1.Font.Pitch:=  self.DBRichEdit1.SelAttributes.Pitch;
    self.FontDialog1.Font.Charset:=  self.DBRichEdit1.SelAttributes.Charset;
    self.FontDialog1.Font.Height:=  self.DBRichEdit1.SelAttributes.Height;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
  finally
  end;
end;

procedure Tcontract.AlignButtonClick(Sender: TObject);
begin
  DBRichEdit1.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure Tcontract.FontSizeChange(Sender: TObject);
begin
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure Tcontract.FontSizeKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',  DecimalSeparator,#8]) then
  begin
    key:=#0;     // 强制输入的字符类型
    beep;
  end;
end;

procedure Tcontract.FontNameChange(Sender: TObject);
begin
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

procedure Tcontract.N1Click(Sender: TObject);
begin
  self.DBRichEdit1.CutToClipboard;
end;

procedure Tcontract.N2Click(Sender: TObject);
begin
  self.DBRichEdit1.CopyToClipboard;
end;

procedure Tcontract.N3Click(Sender: TObject);
begin
  self.DBRichEdit1.PasteFromClipboard;
end;

procedure Tcontract.N5Click(Sender: TObject);
begin
  with DBRichEdit1 do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure Tcontract.N7Click(Sender: TObject);
begin
  if self.FontDialog1.Execute then
    begin
      self.DBRichEdit1.SelAttributes.Color:=self.FontDialog1.Font.Color;
      self.DBRichEdit1.SelAttributes.Name:=self.FontDialog1.Font.Name;
      self.DBRichEdit1.SelAttributes.Size:=self.FontDialog1.Font.Size;
      self.DBRichEdit1.SelAttributes.Style:=self.FontDialog1.Font.Style;
      self.DBRichEdit1.SelAttributes.Pitch:=self.FontDialog1.Font.Pitch;
      self.DBRichEdit1.SelAttributes.Charset:=self.FontDialog1.Font.Charset;
      self.DBRichEdit1.SelAttributes.Height:=self.FontDialog1.Font.Height;
    end;
end;

end.
