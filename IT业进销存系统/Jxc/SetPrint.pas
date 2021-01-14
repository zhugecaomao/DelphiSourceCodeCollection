unit SetPrint;

{
procedure TfrmSpcx.LoadPrintForm;
begin
	if ReportName = '盘点表' then
		rpt1 := TrptSpcx.Create(self)
	else if ReportName = '商品报价表' then
		rpt1 := TrptSpcx.Create(self);
	if rpt1 = nil then
	begin
		frmSetPrint := TfrmSetPrint.Create(self);
		with frmSetPrint do
		begin
			RptList.Items.Add('盘点表');
			RptList.Items.Add('商品报价表');
		end;
		inherited;
	end;
	screen.Cursor := crDefault;
	if rpt1 <> nil then exit;
	if ReportName = '盘点表' then
		rpt1 := TrptSpcx.Create(self)
	else if ReportName = '商品报价表' then
		rpt1 := TrptSpcx.Create(self);
end;
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, db, DBClient, CheckLst, ComCtrls, printers,Variants,
  Quickrpt, QRCtrls, QRPrntr, Mask, Spin, Menus, FileCtrl, ImgList, ToolWin, iniFiles;

type
  TfrmSetPrint = class(TForm)
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    pnlColWidth: TPanel;
    Panel7: TPanel;
    btnSaveColWidth: TButton;
    Panel8: TPanel;
    pmnXm: TPopupMenu;
    Notebook1: TNotebook;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    TabSheet6: TTabSheet;
    Bevel4: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    TabSheet7: TTabSheet;
    Bevel5: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    TabSheet9: TTabSheet;
    Memo1: TMemo;
    GroupBox4: TGroupBox;
    btnLmFont: TSpeedButton;
    btnLmColor: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Bevel9: TBevel;
    Bevel8: TBevel;
    Label28: TLabel;
    edtLmXj: TMaskEdit;
    cbLmHx: TComboBox;
    rbLmSx: TRadioButton;
    RadioButton2: TRadioButton;
    mmoLm: TPanel;
    GroupBox5: TGroupBox;
    btnNyFont: TSpeedButton;
    btnNyColor: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Label33: TLabel;
    Bevel14: TBevel;
    Label52: TLabel;
    Label53: TLabel;
    btnOdd: TSpeedButton;
    btnEven: TSpeedButton;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Label55: TLabel;
    Label54: TLabel;
    Bevel19: TBevel;
    edtNyXj: TMaskEdit;
    cbNyHx: TComboBox;
    rbNySx: TRadioButton;
    RadioButton3: TRadioButton;
    mmoNy: TPanel;
    pnlEven: TPanel;
    pnlOdd: TPanel;
    cbXh: TCheckBox;
    edtLf: TSpinEdit;
    edtLmsl: TSpinEdit;
    cbHh: TCheckBox;
    TabSheet10: TTabSheet;
    Label59: TLabel;
    Label60: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label61: TLabel;
    Label62: TLabel;
    GroupBox6: TGroupBox;
    btnHjFont: TSpeedButton;
    btnHjColor: TSpeedButton;
    Label18: TLabel;
    Label23: TLabel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Label34: TLabel;
    edtHjXj: TMaskEdit;
    cbHjHx: TComboBox;
    rbHjSx: TRadioButton;
    RadioButton4: TRadioButton;
    mmoHj: TPanel;
    cbHj: TCheckBox;
    GroupBox11: TGroupBox;
    btnXjFont: TSpeedButton;
    btnXjColor: TSpeedButton;
    Label56: TLabel;
    Label57: TLabel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Label58: TLabel;
    edtXjXj: TMaskEdit;
    cbXjHx: TComboBox;
    rbXjSx: TRadioButton;
    RadioButton5: TRadioButton;
    mmoXj: TPanel;
    cbXj: TCheckBox;
    TotalList: TCheckListBox;
    TabSheet8: TTabSheet;
    Bevel6: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    TabSheet11: TTabSheet;
    Bevel7: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    btnRight: TSpeedButton;
    btnLeft: TSpeedButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    btnColWidth: TSpeedButton;
    DstList: TListBox;
    SrcList: TListBox;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cbPageSize: TComboBox;
    edtPageWidth: TSpinEdit;
    edtPageLength: TSpinEdit;
    GroupBox3: TGroupBox;
    img2: TImage;
    img1: TImage;
    rbPortrait: TRadioButton;
    rbPortrait1: TRadioButton;
    GroupBox8: TGroupBox;
    Label25: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    edtPageTop: TSpinEdit;
    edtPageBottom: TSpinEdit;
    edtPageLeft: TSpinEdit;
    edtPageRight: TSpinEdit;
    cbBj: TCheckBox;
    btnSave: TBitBtn;
    btnIni: TBitBtn;
    btnCancelSet: TBitBtn;
    GroupBox7: TGroupBox;
    imgRight: TImage;
    imgLeft: TImage;
    pnlPage: TPanel;
    pnlClient: TPanel;
    pnlYm: TPanel;
    pnlBt: TPanel;
    pnlBgbt: TPanel;
    pnlLm: TPanel;
    pnlNy: TPanel;
    pnlHj: TPanel;
    pnlBw: TPanel;
    pnlYj: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnNew: TBitBtn;
    btnSet: TBitBtn;
    btnSaveAs: TBitBtn;
    btnDel: TBitBtn;
    btnClose: TBitBtn;
    RptList: TListBox;
    FileListBox1: TFileListBox;
    GroupBox12: TGroupBox;
    Label1: TLabel;
    cbDyj: TComboBox;
    GroupBox10: TGroupBox;
    cbYmfs: TComboBox;
    btnPreivewNotLoad: TBitBtn;
    ToolbarImages: TImageList;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Panel6: TPanel;
    Bevel20: TBevel;
    YmRich: TRichEdit;
    ToolBar2: TToolBar;
    YmDy: TCheckBox;
    ToolButton5: TToolButton;
    Label30: TLabel;
    YmColor: TPanel;
    ToolButton6: TToolButton;
    YmLeftAlign: TToolButton;
    YmCenterAlign: TToolButton;
    YmRightAlign: TToolButton;
    ToolButton3: TToolButton;
    Label31: TLabel;
    YmHx: TComboBox;
    StandardToolBar: TToolBar;
    Label2: TLabel;
    YmFontName: TComboBox;
    ToolButton11: TToolButton;
    YmFontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    YmBoldButton: TToolButton;
    YmItalicButton: TToolButton;
    YmUnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    YmFontColor: TPanel;
    Panel5: TPanel;
    Bevel21: TBevel;
    BtRich: TRichEdit;
    ToolBar3: TToolBar;
    BtDy: TCheckBox;
    ToolButton7: TToolButton;
    Label36: TLabel;
    BtColor: TPanel;
    ToolButton10: TToolButton;
    BtLeftAlign: TToolButton;
    BtCenterAlign: TToolButton;
    BtRightAlign: TToolButton;
    ToolButton15: TToolButton;
    Label37: TLabel;
    BtHx: TComboBox;
    ToolBar4: TToolBar;
    Label38: TLabel;
    BtFontName: TComboBox;
    ToolButton17: TToolButton;
    BtFontSize: TEdit;
    UpDown2: TUpDown;
    ToolButton18: TToolButton;
    BtBoldButton: TToolButton;
    BtItalicButton: TToolButton;
    BtUnderlineButton: TToolButton;
    ToolButton22: TToolButton;
    BtFontColor: TPanel;
    Panel11: TPanel;
    Bevel22: TBevel;
    BgbtRich: TRichEdit;
    ToolBar5: TToolBar;
    BgbtDy: TCheckBox;
    ToolButton23: TToolButton;
    Label40: TLabel;
    BgbtColor: TPanel;
    ToolButton24: TToolButton;
    BgbtLeftAlign: TToolButton;
    BgbtCenterAlign: TToolButton;
    BgbtRightAlign: TToolButton;
    ToolButton28: TToolButton;
    Label41: TLabel;
    BgbtHx: TComboBox;
    ToolBar6: TToolBar;
    Label42: TLabel;
    BgbtFontName: TComboBox;
    ToolButton29: TToolButton;
    BgbtFontSize: TEdit;
    UpDown3: TUpDown;
    ToolButton30: TToolButton;
    BgbtBoldButton: TToolButton;
    BgbtItalicButton: TToolButton;
    BgbtUnderlineButton: TToolButton;
    ToolButton34: TToolButton;
    BgbtFontColor: TPanel;
    Panel14: TPanel;
    Bevel23: TBevel;
    BwRich: TRichEdit;
    ToolBar7: TToolBar;
    BwDy: TCheckBox;
    ToolButton35: TToolButton;
    Label44: TLabel;
    BwColor: TPanel;
    ToolButton36: TToolButton;
    BwLeftAlign: TToolButton;
    BwCenterAlign: TToolButton;
    BwRightAlign: TToolButton;
    ToolButton40: TToolButton;
    Label45: TLabel;
    BwHx: TComboBox;
    ToolBar8: TToolBar;
    Label46: TLabel;
    BwFontName: TComboBox;
    ToolButton41: TToolButton;
    BwFontSize: TEdit;
    UpDown4: TUpDown;
    ToolButton42: TToolButton;
    BwBoldButton: TToolButton;
    BwItalicButton: TToolButton;
    BwUnderlineButton: TToolButton;
    ToolButton46: TToolButton;
    BwFontColor: TPanel;
    Panel17: TPanel;
    Bevel24: TBevel;
    YjRich: TRichEdit;
    ToolBar9: TToolBar;
    YjDy: TCheckBox;
    ToolButton47: TToolButton;
    Label48: TLabel;
    YjColor: TPanel;
    ToolButton48: TToolButton;
    YjLeftAlign: TToolButton;
    YjCenterAlign: TToolButton;
    YjRightAlign: TToolButton;
    ToolButton52: TToolButton;
    Label49: TLabel;
    YjHx: TComboBox;
    ToolBar10: TToolBar;
    Label50: TLabel;
    YjFontName: TComboBox;
    ToolButton53: TToolButton;
    YjFontSize: TEdit;
    UpDown5: TUpDown;
    ToolButton54: TToolButton;
    YjBoldButton: TToolButton;
    YjItalicButton: TToolButton;
    YjUnderlineButton: TToolButton;
    ToolButton58: TToolButton;
    YjFontColor: TPanel;
    ToolBar11: TToolBar;
    YmdyLeftAlign: TToolButton;
    ToolButton21: TToolButton;
    YmdyCenterAlign: TToolButton;
    ToolButton12: TToolButton;
    YmdyRightAlign: TToolButton;
    Label63: TLabel;
    YmdyFont: TPanel;
    Label64: TLabel;
    Label65: TLabel;
    YmdyColor: TPanel;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    YmRich_P: TRichEdit;
    mmoTmp: TMemo;
    BtRich_P: TRichEdit;
    BgbtRich_P: TRichEdit;
    BwRich_P: TRichEdit;
    YjRich_P: TRichEdit;
    pmnAdd: TPopupMenu;
    dbgColWidth: TDBGrid;
    Label66: TLabel;
    Label68: TLabel;
    rbPrintAll: TRadioButton;
    rbPrintSelect: TRadioButton;
    edtFirstPage: TMaskEdit;
    edtLastPage: TMaskEdit;
    Label32: TLabel;
    cbRpt: TComboBox;
    Label35: TLabel;
    edtCopies: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure rgBgBtClick(Sender: TObject);
    procedure btnBgBtFontClick(Sender: TObject);
    procedure btnBgBtColorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLeftClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure DstListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SrcListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SrcListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DstListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cbDyjChange(Sender: TObject);
    procedure cbPageSizeChange(Sender: TObject);
    procedure rbPortraitClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cbBjClick(Sender: TObject);
    procedure SetPreviewPnl(Sender: TObject);
    procedure pnlYmClick(Sender: TObject);
    procedure pnlBtClick(Sender: TObject);
    procedure pnlBgbtClick(Sender: TObject);
    procedure pnlLmClick(Sender: TObject);
    procedure pnlNyClick(Sender: TObject);
    procedure pnlHjClick(Sender: TObject);
    procedure pnlBwClick(Sender: TObject);
    procedure pnlYjClick(Sender: TObject);
    procedure pnlPageClick(Sender: TObject);
    procedure pnlClientResize(Sender: TObject);
    procedure btnColWidthClick(Sender: TObject);
    procedure btnSaveColWidthClick(Sender: TObject);
    procedure mmoYmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SetImageTop(Sender: TObject);
    procedure btnOddClick(Sender: TObject);
    procedure btnEvenClick(Sender: TObject);
    procedure edtLmslChange(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure btnCancelSetClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnIniClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure FontColorClick(Sender: TObject);
    procedure ColorClick(Sender: TObject);
    procedure RichSelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure YmdyFontClick(Sender: TObject);
    procedure rbPrintAllClick(Sender: TObject);
    procedure AddSysItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ReportCount: integer;
    FilePath, FileName, strSpace: string;
    { RichEdit }
    CurrFile: TRichEdit;
    FUpdating: Boolean;
    BoldButton, ItalicButton, UnderlineButton: TToolButton;
    FontColor: TPanel;
    FontSize: TEdit;
    FontName: TComboBox;
    TmpFileName: string;
    blnPrintting: boolean;
    { RichEdit }
    function CurrText: TTextAttributes;
    procedure RichClone(SourceRich, TargetRich: TRichEdit);
    function FileToString(Sender: TObject): string;
    procedure SetRichText(ARichEdit: TRichEdit);
    { Ini File }
    procedure IniSet;
    procedure SaveSet(AFileName: string);
    procedure LoadSet(AFileName: string);
    { Column }
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    { Others }
    procedure SetPmnXm;
    procedure AddMenuItem(ACaption, AHint: string; ATag: integer);
    procedure MenuItemClick(Sender: TObject);
    procedure SetNotePage(APage: string);
    function GetInputString(const ACaption, APrompt, ADefault: string): string;
    function GetRichEditHeight(ARichEdit: TRichEdit): integer;
    procedure BeginPrint(APreview: boolean);
    procedure SetPageSize(Width, Length: integer);
    function GetActiveMemo(Sender: TObject): TMemo;
    procedure SetButtons;
    procedure DrawBandFrame(ABand: TQRCustomBand; AItemIndex: Integer);
  public
    { Public declarations }
    ReportName: string;
    AForm: TForm;
    AGrid: TDBGrid;
    ADataSet: TClientdataset;
    blnPreview: boolean;
    blnHaveTotal, blnHavePageTotal: boolean;
    strTotalFields: string;
  end;

const
  RichMargin = 10;

var
  frmSetPrint: TfrmSetPrint;

implementation

uses Dm, ComJbzl, Main, SetPrint_P, InputString, ComDjzb, ComDj, ComFlzl,
  ComDczl, ComTjfx;

{$R *.DFM}

{-Form Even 窗体事件-}

//Form.Create
procedure TfrmSetPrint.FormCreate(Sender: TObject);
begin
  FilePath := ExtractFilePath(Application.ExeName) + 'Report\';
  TmpFileName := FilePath + 'Tmp.Tmp';
  CurrFile := YmRich;
  SetImageTop(Sender);
end;

//Form.Show
procedure TfrmSetPrint.FormShow(Sender: TObject);
var
  i: integer;
  iniFile : TIniFile;
  strRptName: string;
begin
  screen.Cursor := crHourGlass;
  strSpace := '';
  for i := 1 to 50 do
    strSpace := strSpace + ' ';
  //Dyj
  cbDyj.Items.Assign(printer.Printers);
  for i := 0 to cbDyj.Items.Count - 1 do
    cbDyj.Items[i] := Copy(cbDyj.Items[i], 1, Pos('on', cbDyj.Items[i]) - 2);
  cbDyj.ItemIndex := Printer.PrinterIndex;
  cbYmfs.ItemIndex := 0;
  //Set Col Width
  with pnlColWidth do
  begin
    Top := self.TabSheet2.Top + 9;
    Height := self.TabSheet2.Height - 6;
    Left :=  self.TabSheet2.Left + 9;
    Width :=  self.TabSheet2.Width - 6;
    Visible := false;
  end;
  dbgColWidth.DataSource := AGrid.DataSource;
  //PageControl
  PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
  Notebook1.ActivePage := '1';
  //pmnXm Ini
  SetPmnXm;
  //Rich Control Ini
  with YmRich.Font do
  begin
    CurrFile := YmRich;
    YmFontName.Items.Assign(screen.Fonts);
    YmFontName.Text := Name;
    YmFontName.Sorted := True;
    YmFontSize.Text := IntToStr(Size);
  end;
  with BtRich.Font do
  begin
    CurrFile := BtRich;
    BtFontName.Items.Assign(screen.Fonts);
    BtFontName.Text := Name;
    BtFontName.Sorted := True;
    BtFontSize.Text := IntToStr(Size);
  end;
  with BgbtRich.Font do
  begin
    CurrFile := BgbtRich;
    BgbtFontName.Items.Assign(screen.Fonts);
    BgbtFontName.Text := Name;
    BgbtFontName.Sorted := True;
    BgbtFontSize.Text := IntToStr(Size);
  end;
  with BwRich.Font do
  begin
    CurrFile := BwRich;
    BwFontName.Items.Assign(screen.Fonts);
    BwFontName.Text := Name;
    BwFontName.Sorted := True;
    BwFontSize.Text := IntToStr(Size);
  end;
  with YjRich.Font do
  begin
    CurrFile := YjRich;
    YjFontName.Items.Assign(screen.Fonts);
    YjFontName.Text := Name;
    YjFontName.Sorted := True;
    YjFontSize.Text := IntToStr(Size);
  end;
  CurrFile := YmRich;
  //Default Buttom
  if blnPreview then
    frmSetPrint.btnPreview.Default := true
  else
    frmSetPrint.btnPrint.Default := true;
  //RptList
  ReportCount := RptList.Items.Count;
  with FileListBox1 do
  begin
    Mask := FilePath + AForm.Name + '_*.ini';
    for i := 0 to Items.Count - 1 do
      RptList.Items.Add(Copy(Items[i], Length(AForm.Name) + 2,
        Length(Items[i]) - Length(AForm.Name) - 5));
  end;
  if RptList.Items.Count > 0 then
  begin
    RptList.ItemIndex := 0;
    RptList.SetFocus;
  end else
    btnNew.SetFocus;
  //cbRep
  with cbRpt do
  begin
    Items := RptList.Items;
    Items.Insert(0, '');
    iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\DefRpt.ini');
    strRptName := iniFile.ReadString(AForm.Name, 'Name', '');
    iniFile.Free;
    cbRpt.ItemIndex := Items.IndexOf(strRptName)
  end;
  SetButtons;
  SetNotePage('1');
  screen.Cursor := crDefault;
  //DefRpt
  if (not blnPreview) and (cbRpt.ItemIndex <> - 1) then
  begin
    FileName := FilePath + AForm.Name + '_' + cbRpt.Text + '.ini';
    LoadSet(FileName);
    BeginPrint(true);
  end;
end;

//Form.KeyDown
procedure TfrmSetPrint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if self.pnlColWidth.Visible then
      self.pnlColWidth.Visible := false
    else
      btnCancelSet.Click;
  if (self.PageControl1.ActivePageIndex = 1) and
    (Shift = [ssCtrl]) then
    case Key of
      VK_LEFT:
        begin
          Key := 0;
          if self.btnLeft.Enabled then
            self.btnLeft.Click;
        end;
      VK_RIGHT:
        begin
          Key := 0;
          if self.btnRight.Enabled then
            self.btnRight.Click;
        end;
      VK_UP:
        begin
          Key := 0;
          if self.btnUp.Enabled then
            self.btnUp.Click;
        end;
      VK_DOWN:
        begin
          Key := 0;
          if self.btnDown.Enabled then
            self.btnDown.Click;
        end;
    end;
end;

//Form.Close
procedure TfrmSetPrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  iniFile : TIniFile;
begin
  iniFile := TiniFile.Create(ExtractFilePath(Application.ExeName) + 'System\DefRpt.ini');
  iniFile.WriteString(AForm.Name, 'Name', cbRpt.Text);
  iniFile.Free;
end;

//BG
function TfrmSetPrint.GetActiveMemo(Sender: TObject): TMemo;
begin
  result := nil;
  case self.PageControl2.ActivePageIndex of
  3: if TControl(Sender).Hint = 'Lm' then
    result := TMemo(mmoLm)
    else
    result := TMemo(mmoNy);
  4: if TControl(Sender).Hint = 'Xj' then
    result := TMemo(mmoXj)
    else
    result := TMemo(mmoHj);
  end;
end;

procedure TfrmSetPrint.btnBgBtFontClick(Sender: TObject);
begin
  with GetActiveMemo(Sender) do
  begin
    FontDialog1.Font := Font;
    if FontDialog1.Execute then
      Font := FontDialog1.Font;
  end;
  SetPreviewPnl(Sender);
end;

procedure TfrmSetPrint.btnBgBtColorClick(Sender: TObject);
begin
  with GetActiveMemo(Sender) do
  begin
    ColorDialog1.Color := Color;
    if ColorDialog1.Execute then
      Color := ColorDialog1.Color;
  end;
  if Sender = btnNyColor then
  begin
    pnlOdd.Color := ColorDialog1.Color;
    pnlEven.Color := ColorDialog1.Color;
  end;
  SetPreviewPnl(Sender);
end;

procedure TfrmSetPrint.rgBgBtClick(Sender: TObject);
begin
  SetPreviewPnl(Sender);
end;

procedure TfrmSetPrint.cbBjClick(Sender: TObject);
begin
  edtPageLeft.Enabled := not cbBj.Checked or not cbBj.Enabled;
  edtPageRight.Enabled := edtPageLeft.Enabled;
end;

//LM
procedure TfrmSetPrint.btnLeftClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
end;

procedure TfrmSetPrint.btnRightClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
end;

procedure TfrmSetPrint.btnUpClick(Sender: TObject);
var
  i: integer;
begin
  with DstList do
  begin
    if ItemIndex <= 0 then
    begin
      if (ItemIndex < 0) and ((Items.Count - 1) >= 0) then
        ItemIndex := 0
      else
        Beep;
      abort;
    end;
    i := ItemIndex - 1;
    Items.Move(ItemIndex, i);
    ItemIndex := i;
  end;
end;

procedure TfrmSetPrint.btnDownClick(Sender: TObject);
var
  i: integer;
begin
  with DstList do
  begin
    if (ItemIndex < 0) or (ItemIndex >= Items.Count - 1) then
    begin
      if (ItemIndex < 0) and ((Items.Count - 1) >= 0) then
        ItemIndex := 0
      else
        Beep;
      abort;
    end;
    i := ItemIndex + 1;
    Items.Move(ItemIndex, i);
    ItemIndex := i;
  end;
end;

procedure TfrmSetPrint.DstListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i: integer;
  APoint: TPoint;
begin
  if Source = SrcList then
    btnRight.Click;
  if Source = DstList then
    if (Sender is TListBox) and (Source is TListBox) then
      with DstList do
      begin
        APoint.x := X;
        APoint.y := Y;
        i := ItemAtPos(APoint, true);
        if (i >= 0) and (i <= Items.Count - 1) and (i <> ItemIndex ) then
        begin
          Items.Move(ItemIndex, i);
          ItemIndex := i;
        end;
      end;
end;

procedure TfrmSetPrint.SrcListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if Source = DstList then
    btnLeft.Click;
end;

procedure TfrmSetPrint.SrcListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source = DstList then
    Accept := true;
end;

procedure TfrmSetPrint.DstListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = SrcList) or (Source = DstList) then
    Accept := true;
end;

function TfrmSetPrint.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TfrmSetPrint.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := 0 to List.Items.Count - 1 do
    if List.Selected[I] then
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
      List.Items.Delete(I);
end;

procedure TfrmSetPrint.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

procedure TfrmSetPrint.SetButtons;
var
  RptEmpty, SrcEmpty, DstEmpty: Boolean;
begin
  RptEmpty := RptList.Items.Count - ReportCount = 0;
  //P1
  btnPreview.Enabled := not (RptList.Items.Count = 0);
  btnPrint.Enabled := btnPreview.Enabled;
  btnSet.Enabled := not RptEmpty;
  btnSaveAs.Enabled := not RptEmpty;
  btnDel.Enabled := not RptEmpty;
  //P2
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  btnRight.Enabled := not SrcEmpty;
  btnLeft.Enabled := not DstEmpty;
  btnUp.Enabled := not DstEmpty;
  btnDown.Enabled := not DstEmpty;
end;

//DYJ
procedure TfrmSetPrint.rbPortraitClick(Sender: TObject);
begin
  img1.Visible := rbPortrait.Checked;
  img2.Visible := not img1.Visible;
  SetPreviewPnl(Sender);
end;

procedure TfrmSetPrint.cbDyjChange(Sender: TObject);
var
  s: string;
begin
  s := printer.Printers[cbDyj.ItemIndex];
end;

procedure TfrmSetPrint.cbPageSizeChange(Sender: TObject);
begin
  case cbPageSize.ItemIndex of
  0: SetPageSize(297, 420);
  1: SetPageSize(210, 297);
  2: SetPageSize(148, 210);
  3: SetPageSize(250, 364);
  4: SetPageSize(182, 257);
  end;
  edtPageWidth.Enabled := cbPageSize.ItemIndex = 5;
  edtPageLength.Enabled := edtPageWidth.Enabled;
end;

procedure TfrmSetPrint.SetPageSize(Width, Length: integer);
begin
  edtPageWidth.Text := IntToStr(Width);
  edtPageLength.Text := IntToStr(Length);
end;

//Odd Line Color
procedure TfrmSetPrint.btnOddClick(Sender: TObject);
begin
  ColorDialog1.Color := pnlOdd.Color;
  if ColorDialog1.Execute then
    pnlOdd.Color := ColorDialog1.Color;
end;

//Even Line Color
procedure TfrmSetPrint.btnEvenClick(Sender: TObject);
begin
  ColorDialog1.Color := pnlEven.Color;
  if ColorDialog1.Execute then
    pnlEven.Color := ColorDialog1.Color;
end;

//YmdyFont.Click
procedure TfrmSetPrint.YmdyFontClick(Sender: TObject);
begin
  FontDialog1.Font := YmdyFont.Font;
  if FontDialog1.Execute then
    YmdyFont.Font := FontDialog1.Font;
end;

//SetPreviewPnl
procedure TfrmSetPrint.SetPreviewPnl(Sender: TObject);
begin
  //Rect
  with pnlPage do
    if rbPortrait.Checked then
      Height := 219
    else
      Height := 135;
  if (edtPageTop.Text <> '') and (edtPageBottom.Text <> '') and
    (edtPageLeft.Text <> '') and (edtPageRight.Text <> '') then
    with pnlClient do
    begin
      Top := edtPageTop.Value;
      Left := edtPageLeft.Value;
      Width := pnlPage.Width - Left - edtPageRight.Value;
      Height := pnlPage.Height - Top - edtPageBottom.Value;
    end;
  //color
  pnlYm.Color := YmColor.Color;
  pnlBt.Color := BtColor.Color;
  pnlBgbt.Color := BgbtColor.Color;
  pnlBw.Color := BwColor.Color;
  pnlYj.Color := YjColor.Color;
  pnlLm.Color := mmoLm.Color;
  pnlNy.Color := mmoNy.Color;
  pnlHj.Color := mmoHj.Color;
  //Font
  pnlLm.Font.Name := mmoLm.Font.Name;
  pnlNy.Font.Name := mmoNy.Font.Name;
  pnlHj.Font.Name := mmoHj.Font.Name;
  //Font.Color
  pnlLm.Font.Color := mmoLm.Font.Color;
  pnlNy.Font.Color := mmoNy.Font.Color;
  pnlHj.Font.Color := mmoHj.Font.Color;
  //Alignment
  ////YM
  if YmRightAlign.Down then
    pnlYm.Alignment := taRightJustify
  else if YmCenterAlign.Down then
    pnlYm.Alignment := taCenter
  else
    pnlYm.Alignment := taLeftJustify;
  ////Bt
  if BtRightAlign.Down then
    pnlBt.Alignment := taRightJustify
  else if BtCenterAlign.Down then
    pnlBt.Alignment := taCenter
  else
    pnlBt.Alignment := taLeftJustify;
  ////Bgbt
  if BgbtRightAlign.Down then
    pnlBgbt.Alignment := taRightJustify
  else if BgbtCenterAlign.Down then
    pnlBgbt.Alignment := taCenter
  else
    pnlBgbt.Alignment := taLeftJustify;
  ////Bw
  if BwRightAlign.Down then
    pnlBw.Alignment := taRightJustify
  else if BwCenterAlign.Down then
    pnlBw.Alignment := taCenter
  else
    pnlBw.Alignment := taLeftJustify;
  ////Yj
  if YjRightAlign.Down then
    pnlYj.Alignment := taRightJustify
  else if YjCenterAlign.Down then
    pnlYj.Alignment := taCenter
  else
    pnlYj.Alignment := taLeftJustify;
end;

procedure TfrmSetPrint.pnlYmClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 0;
  YmRich.SetFocus;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlBtClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 1;
  BtRich.SetFocus;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlBgbtClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 2;
  BgbtRich.SetFocus;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlLmClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 3;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlNyClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 3;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlHjClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 4;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlBwClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 5;
  BwRich.SetFocus;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlYjClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 0;
  self.PageControl2.ActivePageIndex := 6;
  YjRich.SetFocus;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlPageClick(Sender: TObject);
begin
  self.PageControl1.ActivePageIndex := 2;
  edtPageTop.SetFocus;
  SetImageTop(nil);
end;

procedure TfrmSetPrint.pnlClientResize(Sender: TObject);
var
  h: integer;
begin
  h := pnlClient.Height div 8;
  pnlYm.Height := h;
  pnlBt.Height := h;
  pnlBgbt.Height := h;
  pnlLm.Height := h;
  pnlNy.Height := h;
  pnlHj.Height := h;
  pnlBw.Height := h;
end;

procedure TfrmSetPrint.DrawBandFrame(ABand: TQRCustomBand; AItemIndex: Integer);
begin
  with ABand do
    case AItemIndex of
    0:
      begin
        Frame.DrawTop := true;
        Frame.DrawBottom := true;
        Frame.DrawLeft := true;
        Frame.DrawRight := true;
      end;
    1:
      begin
        Frame.DrawTop := true;
        Frame.DrawBottom := true;
        Frame.DrawLeft := false;
        Frame.DrawRight := false;
      end;
    2:
      begin
        Frame.DrawTop := false;
        Frame.DrawBottom := false;
        Frame.DrawLeft := true;
        Frame.DrawRight := true;
      end;
    3:
      begin
        Frame.DrawTop := false;
        Frame.DrawBottom := false;
        Frame.DrawLeft := false;
        Frame.DrawRight := false;
      end;
    end;
end;

procedure TfrmSetPrint.btnColWidthClick(Sender: TObject);
var
  i: integer;
begin
{  dbgColWidth.Columns.Clear;
  for i := 0 to DstList.Items.Count - 1 do
  begin
    strTmp := Copy(DstList.Items[i], 51, Length(DstList.Items[i]) - 50);
    for j := 0 to AGrid.Columns.Count - 1 do
      if AGrid.Columns[j].FieldName = strTmp then
      begin
        with dbgColWidth.Columns.Add do
        begin
          Width := AGrid.Columns[j].Width;
          FieldName := strTmp;
          Title.Alignment := taCenter;
        end;
        break;
      end;
  end;}
  pnlColWidth.Visible := true;
  for i := 0 to dbgColWidth.Columns.Count - 1 do
    dbgColWidth.Columns[i].Visible := DstList.Items.IndexOf(dbgColWidth.Columns[i].Title.Caption + Copy(strSpace, 1, 50 - Length(dbgColWidth.Columns[i].Title.Caption)) + dbgColWidth.Columns[i].FieldName) >= 0;
end;

procedure TfrmSetPrint.btnSaveColWidthClick(Sender: TObject);
begin
{  for i := 0 to dbgColWidth.Columns.Count - 1 do
    for j := 0 to AGrid.Columns.Count - 1 do
      if AGrid.Columns[j].FieldName = dbgColWidth.Columns[i].FieldName then
        AGrid.Columns[j].Width := dbgColWidth.Columns[i].Width;
  self.btnCancelColWidth.Click;}
  pnlColWidth.Visible := false;
end;

procedure TfrmSetPrint.mmoYmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    self.pmnXm.Popup(0,0);
end;

procedure TfrmSetPrint.SetImageTop(Sender: TObject);
var
  t: integer;
begin
  pnlColWidth.Visible := false;
  //RichEdit
  case PageControl2.ActivePageIndex of
    0:
    begin
      CurrFile := YmRich;
      BoldButton := YmBoldButton;
      ItalicButton := YmItalicButton;
      UnderlineButton := YmUnderlineButton;
      FontColor := YmFontColor;
      FontSize := YmFontSize;
      FontName := YmFontName;
    end;
    1:
    begin
      CurrFile := BtRich;
      BoldButton := BtBoldButton;
      ItalicButton := BtItalicButton;
      UnderlineButton := BtUnderlineButton;
      FontColor := BtFontColor;
      FontSize := BtFontSize;
      FontName := BtFontName;
    end;
    2:
    begin
      CurrFile := BgbtRich;
      BoldButton := BgbtBoldButton;
      ItalicButton := BgbtItalicButton;
      UnderlineButton := BgbtUnderlineButton;
      FontColor := BgbtFontColor;
      FontSize := BgbtFontSize;
      FontName := BgbtFontName;
    end;
    5:
    begin
      CurrFile := BwRich;
      BoldButton := BwBoldButton;
      ItalicButton := BwItalicButton;
      UnderlineButton := BwUnderlineButton;
      FontColor := BwFontColor;
      FontSize := BwFontSize;
      FontName := BwFontName;
    end;
    6:
    begin
      CurrFile := YjRich;
      BoldButton := YjBoldButton;
      ItalicButton := YjItalicButton;
      UnderlineButton := YjUnderlineButton;
      FontColor := YjFontColor;
      FontSize := YjFontSize;
      FontName := YjFontName;
    end;
  end;
  //Preview
  t := 0;
  case PageControl1.ActivePageIndex of
    0:
    begin
      case PageControl2.ActivePageIndex of
        0: t := PnlYm.Top;
        1: t := PnlBt.Top;
        2: t := PnlBgbt.Top;
        3: t := PnlNy.Top;
        4: t := PnlHj.Top;
        5: t := PnlBw.Top;
        6: t := PnlYj.Top;
      end;
      t := pnlPage.Top + pnlClient.Top + t;
    end;
    2: t := pnlPage.Top;
    else
      t := -100;
  end;
  imgLeft.Top := t;
  imgRight.Top := imgLeft.Top;
end;

procedure TfrmSetPrint.edtLmslChange(Sender: TObject);
begin
  edtLf.Enabled := (edtLmsl.Text <> '') and (edtLmsl.Value > 1);
  cbBj.Enabled := not edtLf.Enabled;
  cbBj.Caption := '自动调整左右边距';
  if not cbBj.Enabled then
    cbBj.Caption := cbBj.Caption + ' (设置分栏打印不能使用此功能)';
  edtPageLeft.Enabled := not cbBj.Checked or not cbBj.Enabled;
  edtPageRight.Enabled := edtPageLeft.Enabled;
end;

{-Button 按钮处理-}

//btnNew.Click
procedure TfrmSetPrint.btnNewClick(Sender: TObject);
var
  strItem: string;
begin
  strItem := GetInputString('新增', '报表名称',
    AForm.Caption + FormatFloat('#', RptList.Items.Count));
  if strItem <> '' then
    if RptList.Items.IndexOf(strItem) >= 0 then
      Application.MessageBox('此报表名称已存在, 请重新新增.',
        '新增', MB_OK + MB_ICONINFORMATION)
    else begin
      RptList.ItemIndex := RptList.Items.Add(strItem);
      cbRpt.Items.Add(strItem);
      IniSet;
      FileName := FilePath + AForm.Name + '_' + strItem + '.ini';
      SaveSet(FileName);
    end;
  RptList.SetFocus;
  SetButtons;
end;

//btnSet.Click
procedure TfrmSetPrint.btnSetClick(Sender: TObject);
begin
  if RptList.ItemIndex <= ReportCount - 1 then
  begin
    Application.MessageBox('此份是系统预设的报表, 不能设置.',
        '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  FileName := FilePath + AForm.Name + '_' + RptList.Items[RptList.ItemIndex] + '.ini';
  LoadSet(FileName);
  SetNotePage('2');
end;

//btnCancelSet.Click
procedure TfrmSetPrint.btnCancelSetClick(Sender: TObject);
begin
  SetNotePage('1');
end;

//btnSaveAs.Click
procedure TfrmSetPrint.btnSaveAsClick(Sender: TObject);
var
  strItem: string;
begin
  if RptList.ItemIndex <= ReportCount - 1 then
  begin
    Application.MessageBox('此份是系统预设的报表, 不能另存为.',
        '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  strItem := GetInputString('另存 ' + RptList.Items[RptList.ItemIndex] + ' 为',
    '报表名称', RptList.Items[RptList.ItemIndex]);
  if strItem <> '' then
    if RptList.Items.IndexOf(strItem) >= 0 then
      Application.MessageBox('此报表名称已存在, 请重新另存.',
        '另存为', MB_OK + MB_ICONINFORMATION)
    else begin
      CopyFile(PChar(FilePath + AForm.Name + '_' + RptList.Items[RptList.ItemIndex] + '.ini'),
        PChar(FilePath + AForm.Name + '_' + strItem + '.ini'), false);
      RptList.ItemIndex := RptList.Items.Add(strItem);
      cbRpt.Items.Add(strItem);
    end;
  RptList.SetFocus;
end;

//btnDel.Click
procedure TfrmSetPrint.btnDelClick(Sender: TObject);
var
  i: integer;
begin
  if RptList.ItemIndex <= ReportCount - 1 then
  begin
    Application.MessageBox('此份是系统预设的报表, 不能删除.',
        '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if Application.MessageBox('确定要删除此份报表吗?',
    '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    DeleteFile(PChar(FilePath + AForm.Name + '_' + RptList.Items[RptList.ItemIndex] + '.ini'));
    i := RptList.ItemIndex;
    RptList.Items.Delete(i);
    if RptList.Items.Count = 0 then
      i := -1;
    if i > RptList.Items.Count - 1 then
      i := RptList.Items.Count - 1;
    RptList.ItemIndex := i;
  end;
  SetButtons;
end;

//btnPreview.Click
procedure TfrmSetPrint.btnPreviewClick(Sender: TObject);
begin
  if RptList.ItemIndex <= ReportCount - 1 then
  begin
    ReportName := RptList.Items[RptList.ItemIndex];
    Close;
    Exit;
  end;
  FileName := FilePath + AForm.Name + '_' + RptList.Items[RptList.ItemIndex] + '.ini';
  if Sender <> btnPreivewNotLoad then
    LoadSet(FileName);
  BeginPrint(true);
end;

//btnPrint.Click
procedure TfrmSetPrint.btnPrintClick(Sender: TObject);
begin
  if RptList.ItemIndex <= ReportCount - 1 then
  begin
    ReportName := RptList.Items[RptList.ItemIndex];
    Close;
    Exit;
  end;
  FileName := FilePath + AForm.Name + '_' + RptList.Items[RptList.ItemIndex] + '.ini';
  LoadSet(FileName);
  BeginPrint(false);
end;

//btnSave.Click
procedure TfrmSetPrint.btnSaveClick(Sender: TObject);
begin
  SaveSet(FileName);
  Application.MessageBox('已保存对此报表设置的修改。', '保存设置', MB_OK + MB_ICONINFORMATION);
end;

//btnIni.Click
procedure TfrmSetPrint.btnIniClick(Sender: TObject);
begin
  if Application.MessageBox('确定初始化此份报表的设置吗?',
    '初始化', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    IniSet;
end;

{-Others Even 其它事件-}

//SetPmnXm
procedure TfrmSetPrint.SetPmnXm;
var
  i, j: integer;
begin
  pmnXm.Items.Clear;
  //Sys
  AddMenuItem('当前日期', DateToStr(Date), 10);
  AddMenuItem('当前时间', FormatDateTime('hh:nn', Time), 5);
  AddMenuItem('当前操作员', pstrUserName, 12);
  AddMenuItem('-', '', 0);
  //ComFlzl
  if AForm is TfrmComFlzl then
    with TfrmComFlzl(AForm) do
      if (CheckBox1.Checked) and (VarToStr(DBLookupComboBox1.KeyValue)<>'') then
        AddMenuItem(Copy(CheckBox1.Caption, 1, Length(CheckBox1.Caption)-1), VarToStr(DBLookupComboBox1.Text), 2);
  //ComTjfx
  if AForm is TfrmComTjfx then
    with TfrmComTjfx(AForm) do
      AddMenuItem('统计范围', labTj.Caption, Length(labTj.Caption));
  //ComDczl
  if AForm is TfrmComDczl then
    with TfrmComDczl(AForm) do
      for i := 0 to ComponentCount - 1 do
        if (Components[i] is TDBGrid) and (StrToInt(Copy(Components[i].Name, 7, 1)) < StrToInt(Copy(AGrid.Name, 7, 1))) then
          with TDBGrid(Components[i]).DataSource.DataSet do
            for j := 0 to Fields.Count - 1 do
              if Fields[j].Visible and (Fields[j].Tag = 0) then
                if Fields[j] is TNumericField then
                  AddMenuItem(Fields[j].DisplayLabel, FormatFloat(TNumericField(Fields[j]).DisplayFormat, Fields[j].AsFloat), Fields[j].DisplayWidth)
                else
                  AddMenuItem(Fields[j].DisplayLabel, Fields[j].AsString, Fields[j].DisplayWidth);
  //ComDj
  if AForm is TfrmComDj then
    with TfrmComDj(AForm).DBNavigator1.DataSource.DataSet do
      for i := 0 to Fields.Count - 1 do
        if Fields[i].Visible and (Fields[i].Tag = 0) then
          if Fields[i] is TNumericField then
            AddMenuItem(Fields[i].DisplayLabel, FormatFloat(TNumericField(Fields[i]).DisplayFormat, Fields[i].AsFloat), Fields[i].DisplayWidth)
          else
            AddMenuItem(Fields[i].DisplayLabel, Fields[i].AsString, Fields[i].DisplayWidth);
  //pmnAdd
  AddMenuItem('-', '', 0);
  for i := 0 to pmnAdd.Items.Count - 1 do
    AddMenuItem(pmnAdd.Items[i].Caption, pmnAdd.Items[i].Hint, pmnAdd.Items[i].Tag);
end;

//AddMenuItem
procedure TfrmSetPrint.AddMenuItem(ACaption, AHint: string; ATag: integer);
var
  CMI: TMenuItem;
begin
  CMI := TMenuItem.Create(self);
  CMI.Caption := ACaption;
  CMI.Hint := AHint;
  CMI.Tag := ATag;
  CMI.OnClick := MenuItemClick;
  pmnXm.Items.Add(CMI);
end;

//MenuItem.Click
procedure TfrmSetPrint.MenuItemClick(Sender: TObject);
var
  s: string;
begin
  s := CurrFile.Lines.Strings[CurrFile.CaretPos.y];
  Insert(TMenuItem(Sender).Caption + ': [' + TMenuItem(Sender).Caption + ']', s, CurrFile.CaretPos.x + 1);
  CurrFile.Lines.Strings[CurrFile.CaretPos.y] := s;
end;

//AddSysItemClick
procedure TfrmSetPrint.AddSysItemClick(Sender: TObject);
var
  potClient, potScreen: TPoint;
begin
  potClient.x := 28;
  potClient.y := TControl(Sender).Top - pmnXm.Items.Count div 2 * 18;
  potScreen := TControl(Sender).ClientToScreen(potClient);
  pmnXm.Popup(potScreen.x, potScreen.Y);
end;

//rbPrintAll.Click
procedure TfrmSetPrint.rbPrintAllClick(Sender: TObject);
begin
  edtFirstPage.Enabled := not rbPrintAll.Checked;
  edtLastPage.Enabled := edtFirstPage.Enabled;
end;

{-RichEdit-}

//Color.Click
procedure TfrmSetPrint.ColorClick(Sender: TObject);
begin
  ColorDialog1.Color := TPanel(Sender).Color;
  if ColorDialog1.Execute then
    TPanel(Sender).Color := ColorDialog1.Color;
  SetPreviewPnl(nil);
end;

//FontName.Change
procedure TfrmSetPrint.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex];
end;

//FontSize.Change
procedure TfrmSetPrint.FontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := StrToInt(TEdit(Sender).Text);
end;

//FontColor.Click
procedure TfrmSetPrint.FontColorClick(Sender: TObject);
begin
  if FUpdating then Exit;
  ColorDialog1.Color := TPanel(Sender).Color;
  if ColorDialog1.Execute then
  begin
    TPanel(Sender).Color := ColorDialog1.Color;
    CurrText.Color := TPanel(Sender).Color;
  end;
end;

//Rich.SelectionChange
procedure TfrmSetPrint.RichSelectionChange(Sender: TObject);
begin
  if blnPrintting then exit;
  with CurrFile.Paragraph do
  try
    FUpdating := True;
    BoldButton.Down := fsBold in CurrFile.SelAttributes.Style;
    ItalicButton.Down := fsItalic in CurrFile.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in CurrFile.SelAttributes.Style;
    FontColor.Color := CurrFile.SelAttributes.Color;
    FontSize.Text := IntToStr(CurrFile.SelAttributes.Size);
    FontName.Text := CurrFile.SelAttributes.Name;
  finally
    FUpdating := False;
  end;
end;

//BoldButton.Click
procedure TfrmSetPrint.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if TToolButton(Sender).Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

//ItalicButton.Click
procedure TfrmSetPrint.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if TToolButton(Sender).Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

//UnderlineButton.Click
procedure TfrmSetPrint.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if TToolButton(Sender).Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

//CurrText,
function TfrmSetPrint.CurrText: TTextAttributes;
begin
  if CurrFile.SelLength > 0 then Result := CurrFile.SelAttributes
  else Result := CurrFile.DefAttributes;
end;

//RichClone
procedure TfrmSetPrint.RichClone(SourceRich, TargetRich: TRichEdit);
begin
  mmoTmp.Lines.Text := FileToString(SourceRich);
  mmoTmp.Lines.SaveToFile(TmpFileName);
  TargetRich.Lines.LoadFromFile(TmpFileName);
end;

//FileToString
function TfrmSetPrint.FileToString(Sender: TObject): string;
var
  f: TextFile;
  strTmp, strTxt: string;
begin
  if Sender is TRichEdit then
    TRichEdit(Sender).Lines.SaveToFile(TmpFileName)
  else if Sender is TDBGrid then
    TDBGrid(Sender).Columns.SaveToFile(TmpFileName)
  else if Sender is TListBox then
    TListBox(Sender).Items.SaveToFile(TmpFileName);
  strTxt := '';
  AssignFile(f, TmpFileName);
  Reset(f);
  try
    while not Eof(f) do
    begin
      Readln(f, strTmp);
      strTxt := strTxt + strTmp;
    end;
  finally
    CloseFile(f);
  end;
  result := strTxt;
end;

//GetRichEditHeight
function TfrmSetPrint.GetRichEditHeight(ARichEdit: TRichEdit): integer;
var
  i, j: integer;
begin
  CurrFile := ARichEdit;
  result := 0;
  j := 1;
  with ARichEdit do
  begin
    for i := 0 to Lines.Count - 1 do
    begin
      SelStart := j;
      SelLength := Length(Lines[i]);
      result := result + SelAttributes.Height;
      j := j + Length(Lines[i]) + 2;
    end;
    SelLength := 0;
  end;
end;

//SetRichText
procedure TfrmSetPrint.SetRichText(ARichEdit: TRichEdit);
var
  i, j, k: integer;
  b, l: integer;
  strTxt, strXm: string;
begin
  for i := 0 to pmnXm.Items.Count - 1 do
    if pmnXm.Items[i].Caption <> '-' then
    begin
      strXm := '[' + pmnXm.Items[i].Caption + ']';
      for j := 0 to ARichEdit.Lines.Count - 1 do
      begin
        strTxt := ARichEdit.Lines.Strings[j];
        if Pos(strXm, strTxt) > 0 then
        begin
          while Pos(strXm, strTxt) > 0 do
          begin
            b := Pos(strXm, strTxt);
            l := Length(strXm);
            if b + l - 1 > l then
              if l < pmnxm.Items[i].Tag then
                l := pmnxm.Items[i].Tag
            else
              for k := b + Length(strXm) to Length(strTxt) do
                if strTxt[k] = ' ' then
                  Inc(l)
                else
                  break;
            strTxt := Copy(strTxt, 1, b - 1) +
              Copy(pmnxm.Items[i].Hint + strSpace, 1, l) +
              Copy(strTxt, b + l, Length(strTxt) - b - l + 1);
          end;
          ARichEdit.Lines.Strings[j] := Trim(strTxt);
        end;
      end;
    end;
end;

{-Begin Print 开始打印-}
procedure TfrmSetPrint.BeginPrint(APreview: boolean);
var
  i, j, k: integer;
  bmJbzl: TBookMark;
  evnTmp: TDataSetNotifyEvent;
  dblBl: Double;
  intLeft, intWidth, intLmLines: integer;
  strTmp: string;
  CShape: TQRShape;
  CMemo: TQRMemo;
  CDBText: TQRDBText;
  CLabel: TQRLabel;
  CExpr: TQRExpr;
  CSysData: TQRSysData;
begin
  blnPrintting := true;
  if pnlColWidth.Visible then btnSaveColWidth.Click;
  if rptSetPrint = nil then
    rptSetPrint := TrptSetPrint.Create(self);
  //Ini
  i := rptSetPrint.TextWidth(mmoNy.Font, '一二三四五六七八九拾');
  j := dbgColWidth.Canvas.TextWidth('一二三四五六七八九拾');
  dblBl := i / j;
  //Set rptSetPrint
  with rptSetPrint do
  begin
    DataSet := ADataSet;
    with PrinterSettings do
    begin
      Copies := edtCopies.Value;
      PrinterIndex := cbDyj.ItemIndex;
{      if rbPrintAll.Checked then
      begin
        FirstPage := 0;
        LastPage := 0;
      end
      else begin
        FirstPage := StrToInt(Trim(edtFirstPage.Text));
        LastPage := StrToInt(Trim(edtLastPage.Text));
      end;}
    end;
    with Page do
    begin
      if rbPortrait.Checked then
        Orientation := TPrinterOrientation(0)
      else
        Orientation := TPrinterOrientation(1);
      case cbPageSize.ItemIndex of
        0: PaperSize := A3;
        1: PaperSize := A4;
        2: PaperSize := A5;
        3: PaperSize := B4;
        4: PaperSize := B5;
        5: begin
          PaperSize := Custom;
          Width := edtPageWidth.Value;
          Length := edtPageLength.Value;
        end;
      end;
      ColumnSpace := edtLf.Value;
      Columns := edtLmsl.Value;
      TopMargin := edtPageTop.Value;
      BottomMargin := edtPageBottom.Value;
    end;
    //Xh
    if cbXh.Checked then
    begin
      with dbgColWidth.Columns.Add do
      begin
        Index := 0;
        Title.Caption := '序号';
        FieldName := 'DetailNo';
        Width := dbgColWidth.Canvas.TextWidth('1234');
      end;
      DstList.Items.Insert(0, '序号' + Copy(strSpace, 1, 46) + 'DetailNo');
    end;
    intLmLines := 1;
    intWidth := 0;
    Memo1.Font := mmoLm.Font;
    //Lm Lines; Width; strTotalFields ...
    strTotalFields := '';
    for i := 0 to TotalList.Items.Count - 1 do
      if TotalList.State[i] = cbChecked then
        strTotalFields := strTotalFields +
          Copy(TotalList.Items[i], 51, Length(TotalList.Items[i]) - 50) + ';';
    blnHaveTotal := false;
    blnHavePageTotal := false;
    for i := 0 to DstList.Items.Count - 1 do
    begin
      strTmp := Copy(DstList.Items[i], 51, Length(DstList.Items[i]) - 50);
      for j := 0 to dbgColWidth.Columns.Count - 1 do
        if dbgColWidth.Columns[j].FieldName = strTmp then
          break;
      //Width
      intWidth := intWidth + Trunc(dbgColWidth.Columns[j].Width * dblBl) +
        TextWidth(mmoNy.Font, 'A');
      //Lm Line Count
      Memo1.Lines.Clear;
      Memo1.Lines.Text := dbgColWidth.Columns[j].Title.Caption;
      Memo1.Width := Trunc(dbgColWidth.Columns[j].Width * dblBl) +
        TextWidth(mmoNy.Font, 'A');
      if Memo1.Lines.Count > intLmLines then
        intLmLines := Memo1.Lines.Count;
      //HaveTotal
      if Pos(UpperCase(dbgColWidth.Columns[j].FieldName) + ';', UpperCase(strTotalFields)) > 0 then
        blnHaveTotal := true;
    end;
    blnHavePageTotal := blnHaveTotal;
    blnHaveTotal := cbHj.Checked and blnHaveTotal;
    blnHavePageTotal := cbXj.Checked and blnHavePageTotal;
    if intLmLines > 5 then
      intLmLines := 5;
    //Bj (Left,Right)
    if cbBj.Checked then
    begin
      edtPageLeft.Value := 10;
      edtPageRight.Value := 10;
      if qrbYm.Width > intWidth then
      begin
        Page.LeftMargin := 10 + StrToFloat(FormatFloat('0.000', (qrbYm.Width - intWidth) * qrbYm.Size.Width / qrbYm.Width / 2));
        Page.RightMargin := Page.Width - Page.LeftMargin - StrToFloat(FormatFloat('0.000', intWidth * qrbYm.Size.Width / qrbYm.Width)) - 0.5;
        edtPageLeft.Value := Trunc(Page.LeftMargin);
        edtPageRight.Value := Trunc(Page.RightMargin);
      end;
    end else
    begin
      Page.LeftMargin := edtPageLeft.Value;
      Page.RightMargin := edtPageRight.Value;
    end;
    //Ym
    if not YmDy.Checked or (YmRich.Text = '') then
      qrbYm.Height := 0
    else
    begin
      with qrbYm do
      begin
        Height := GetRichEditHeight(YmRich) + RichMargin;
        Color := YmColor.Color;
        DrawBandFrame(qrbYm, YmHx.ItemIndex);
      end;
      with qrrYm do
      begin
        Top := RichMargin div 2;
        Height := qrbYm.Height - RichMargin div 2;
        Width := qrbYm.Width;
        RichClone(YmRich, YmRich_P);
        SetRichText(YmRich_P);
        YmRich_P.SelectAll;
        if YmRightAlign.Down then
          YmRich_P.Paragraph.Alignment := taRightJustify
        else if YmCenterAlign.Down then
          YmRich_P.Paragraph.Alignment := taCenter
        else
          YmRich_P.Paragraph.Alignment := taLeftJustify;
        ParentRichEdit := YmRich_P;
      end;
    end;
    //Bt
    if not BtDy.Checked  or (BtRich.Text = '') then
      qrbBt.Height := 0
    else
    begin
      with qrbBt do
      begin
        Height := GetRichEditHeight(BtRich) + RichMargin;
        Color := BtColor.Color;
        DrawBandFrame(qrbBt, BtHx.ItemIndex);
      end;
      with qrrBt do
      begin
        Top := RichMargin div 2;
        Height := qrbBt.Height - RichMargin div 2;
        Width := qrbBt.Width;
        RichClone(BtRich, BtRich_P);
        SetRichText(BtRich_P);
        BtRich_P.SelectAll;
        if BtRightAlign.Down then
          BtRich_P.Paragraph.Alignment := taRightJustify
        else if BtCenterAlign.Down then
          BtRich_P.Paragraph.Alignment := taCenter
        else
          BtRich_P.Paragraph.Alignment := taLeftJustify;
        ParentRichEdit := BtRich_P;
      end;
    end;
    //Bgbt
    if not BgbtDy.Checked  or (BgbtRich.Text = '') then
      qrbBgbt.Height := 0
    else
    begin
      with qrbBgbt do
      begin
        Height := GetRichEditHeight(BgbtRich) + RichMargin;
        Color := BgbtColor.Color;
        DrawBandFrame(qrbBgbt, BgbtHx.ItemIndex);
      end;
      with qrrBgbt do
      begin
        Top := RichMargin div 2;
        Height := qrbBgbt.Height - RichMargin div 2;
        Width := qrbBgbt.Width;
        RichClone(BgbtRich, BgbtRich_P);
        SetRichText(BgbtRich_P);
        BgbtRich_P.SelectAll;
        if BgbtRightAlign.Down then
          BgbtRich_P.Paragraph.Alignment := taRightJustify
        else if BgbtCenterAlign.Down then
          BgbtRich_P.Paragraph.Alignment := taCenter
        else
          BgbtRich_P.Paragraph.Alignment := taLeftJustify;
        ParentRichEdit := BgbtRich_P;
      end;
    end;
    //Lm
    with qrbLm do
    begin
      Height := TextHeight(mmoLm.Font, 'A') * intLmLines +
        Trunc(TextHeight(mmoLm.Font, 'A') * (StrToFloat(edtLmXj.Text)));
      Color := mmoLm.Color;
    end;
    intLeft := 0;
    for i := 0 to DstList.Items.Count - 1 do
    begin
      strTmp := Copy(DstList.Items[i], 51, Length(DstList.Items[i]) - 50);
      for j := 0 to dbgColWidth.Columns.Count - 1 do
        if dbgColWidth.Columns[j].FieldName = strTmp then
          break;
      CShape :=TQRShape.Create(self);
      with CShape do
      begin
        Parent := qrbLm;
        Brush.Color := qrbLm.Color;
        Top := 0;
        Left := intLeft;
        intWidth := Trunc(dbgColWidth.Columns[j].Width * dblBl) +
          TextWidth(mmoNy.Font, 'A') + 1;
        if cbLmHx.ItemIndex <> 2 then
          Width := intWidth
        else
          Width := intWidth - 1;
        if cbNyHx.ItemIndex = 3 then
          Height := qrblm.Height - 1
        else
          Height := qrblm.Height;
        if rbLmSx.Checked then
          Pen.Style := psSolid
        else
          Pen.Style := psDashDot;
        case cbLmHx.ItemIndex of
          0: Shape := qrsRectangle;
          1: Shape := qrsTopAndBottom;
          2: Shape := qrsRightAndLeft;
          3: Enabled := false;
        end;
      end;
      CMemo :=TQRMemo.Create(self);
      Memo1.Lines.Clear;
      Memo1.Lines.Text := dbgColWidth.Columns[j].Title.Caption;
      Memo1.Width := Trunc(dbgColWidth.Columns[j].Width * dblBl);
      with CMemo do
      begin
        Parent := qrbLm;
        for k := 0 to Memo1.Lines.Count - 1 do
          Lines.Add(Memo1.Lines[k]);
        Alignment := taCenter;
        Top := Trunc(TextHeight(mmoLm.Font, 'A') * StrToFloat(edtLmXj.Text)) div 2 +
          (TextHeight(mmoLm.Font, 'A') * (IntLmLines - Memo1.Lines.Count)) div 2;
        Left := intLeft;
        Width := CShape.Width;
        Height := TextHeight(mmoLm.Font, 'A') * Lines.Count;
        Font := mmoLm.Font;
        Transparent := true;
      end;
      intLeft := CShape.Left + intWidth - 1;
    end;
    //Ny
    with qrbNy do
    begin
      Height := TextHeight(mmoNy.Font, 'A') +
        Trunc(TextHeight(mmoNy.Font, 'A') * (StrToFloat(edtNyXj.Text)));
      Color := mmoNy.Color;
    end;
    intLeft := 0;
    for i := 0 to DstList.Items.Count - 1 do
    begin
      strTmp := Copy(DstList.Items[i], 51, Length(DstList.Items[i]) - 50);
      for j := 0 to dbgColWidth.Columns.Count - 1 do
        if dbgColWidth.Columns[j].FieldName = strTmp then
          break;
      CShape := TQRShape.Create(self);
      with CShape do
      begin
        Parent := qrbNy;
        Brush.Color := qrbNy.Color;
        Top := -1;
        Left := intLeft;
        intWidth := Trunc(dbgColWidth.Columns[j].Width * dblBl) +
          TextWidth(mmoNy.Font, 'A') + 1;
        if cbNyHx.ItemIndex <> 2 then
          Width := intWidth
        else
          Width := intWidth - 1;
        Height := qrbNy.Height;
        if rbNySx.Checked then
          Pen.Style := psSolid
        else
          Pen.Style := psDashDot;
        case cbNyHx.ItemIndex of
          0, 1: Shape := qrsTopAndBottom;
          2: Shape := qrsRightAndLeft;
          3: Enabled := false;
        end;
      end;
      //奇偶行不同色的处理 (长方形会挡住底色，要 '||' + '=')
      if cbNyHx.ItemIndex = 0 then
      begin
        CShape := TQRShape.Create(self);
        with CShape do
        begin
          Parent := qrbNy;
          Brush.Color := qrbNy.Color;
          Top := -1;
          Left := intLeft;
          Width := intWidth - 1;
          Height := qrbNy.Height + 1;
          if rbNySx.Checked then
            Pen.Style := psSolid
          else
            Pen.Style := psDashDot;
          Shape := qrsRightAndLeft;
        end;
      end;
      if dbgColWidth.Columns[j].FieldName = 'DetailNo' then
      begin
        //Xh
        CSysData := TQRSysData.Create(self);
        with CSysData do
        begin
          Parent := qrbNy;
          Data := qrsDetailNo;
          AutoSize := false;
          Alignment := taCenter;
          Top := Trunc(TextHeight(mmoNy.Font, 'A') * StrToFloat(edtNyXj.Text)) div 2;
          Left := intLeft + TextWidth(mmoNy.Font, 'A') div 2;
          Width := CShape.Width - TextWidth(mmoNy.Font, 'A');
          Height := TextHeight(mmoNy.Font, 'A');
          Font := mmoNy.Font;
          Transparent := true;
          if cbHh.Checked then
            OnPrint := rptSetPrint.QRDBTextPrint;
        end;
      end
      else
      begin
        CDBText := TQRDBText.Create(self);
        with CDBText do
        begin
          Parent := qrbNy;
          AutoSize := false;
          DataSet := ADataSet;
          DataField := dbgColWidth.Columns[j].FieldName;
          Alignment := dbgColWidth.Columns[j].Alignment;
          Top := Trunc(TextHeight(mmoNy.Font, 'A') * StrToFloat(edtNyXj.Text)) div 2;
          Left := intLeft + TextWidth(mmoNy.Font, 'A') div 2;
          Width := CShape.Width - TextWidth(mmoNy.Font, 'A');
          Height := TextHeight(mmoNy.Font, 'A');
          Font := mmoNy.Font;
          Transparent := true;
          if cbHh.Checked then
            OnPrint := rptSetPrint.QRDBTextPrint;
        end;
      end;
      intLeft := CShape.Left + intWidth - 1;
    end;
    //Xj
    if not blnHavePageTotal then
      qrbXj.Height := 0
    else
    begin
      with qrbXj do
      begin
        Height := TextHeight(mmoXj.Font, 'A') +
          Trunc(TextHeight(mmoXj.Font, 'A') * (StrToFloat(edtXjXj.Text)));
        Color := mmoXj.Color;
      end;
      intLeft := 0;
      for i := 0 to DstList.Items.Count - 1 do
      begin
        strTmp := Copy(DstList.Items[i], 51, Length(DstList.Items[i]) - 50);
        for j := 0 to dbgColWidth.Columns.Count - 1 do
          if dbgColWidth.Columns[j].FieldName = strTmp then
            break;
        CShape :=TQRShape.Create(self);
        with CShape do
        begin
          Parent := qrbXj;
          Brush.Color := qrbXj.Color;
          if cbNyHx.ItemIndex = 3 then
            Top := 0
          else
            Top := -1;
          Left := intLeft;
          intWidth := Trunc(dbgColWidth.Columns[j].Width * dblBl) +
            TextWidth(mmoNy.Font, 'A') + 1;
          if cbXjHx.ItemIndex <> 2 then
            Width := intWidth
          else
            Width := intWidth - 1;
          Height := qrbXj.Height;
          if rbXjSx.Checked then
            Pen.Style := psSolid
          else
            Pen.Style := psDashDot;
          case cbXjHx.ItemIndex of
            0: Shape := qrsRectangle;
            1: Shape := qrsTopAndBottom;
            2: Shape := qrsRightAndLeft;
            3: Enabled := false;
          end;
        end;
        if i = 0 then
        begin
          CLabel := TQRLabel.Create(self);
          with CLabel do
          begin
            Parent := qrbXj;
            Caption := '小计';
            Name := 'qrlXj';
            Alignment := taCenter;
            Top := Trunc(TextHeight(mmoXj.Font, 'A') * StrToFloat(edtXjXj.Text)) div 2;
            Left := intLeft + TextWidth(mmoNy.Font, 'A') div 2;
            Width := CShape.Width - TextWidth(mmoNy.Font, 'A');
            Height := TextHeight(mmoXj.Font, 'A');
            Font := mmoXj.Font;
            Transparent := true;
          end;
        end;
        if (dbgColWidth.Columns[j].Field is TNumericField) and
          (Pos(UpperCase(dbgColWidth.Columns[j].FieldName) + ';', UpperCase(strTotalFields)) > 0) then
        begin
          CExpr := TQRExpr.Create(self);
          with CExpr do
          begin
            Parent := qrbXj;
            Alignment := taRightJustify;
            ResetAfterPrint := true;
            Mask := TNumericField(dbgColWidth.Columns[j].Field).DisplayFormat;
            Expression := 'sum(if(STOPSUM=0, ' + dbgColWidth.Columns[j].FieldName + ', 0))';
            Top := Trunc(TextHeight(mmoXj.Font, 'A') * StrToFloat(edtXjXj.Text)) div 2;
            Left := intLeft + TextWidth(mmoNy.Font, 'A') div 2;
            Width := CShape.Width - TextWidth(mmoNy.Font, 'A');
            Height := TextHeight(mmoXj.Font, 'A');
            Font := mmoXj.Font;
            Transparent := true;
          end;
        end;
        intLeft := CShape.Left + intWidth - 1;
      end;
    end;
    //Hj
    if not blnHaveTotal then
      qrbHj.Height := 0
    else
    begin
      with qrbHj do
      begin
        Height := TextHeight(mmoHj.Font, 'A') +
          Trunc(TextHeight(mmoHj.Font, 'A') * (StrToFloat(edtHjXj.Text)));
        Color := mmoHj.Color;
      end;
      intLeft := 0;
      for i := 0 to DstList.Items.Count - 1 do
      begin
        strTmp := Copy(DstList.Items[i], 51, Length(DstList.Items[i]) - 50);
        for j := 0 to dbgColWidth.Columns.Count - 1 do
          if dbgColWidth.Columns[j].FieldName = strTmp then
            break;
        CShape :=TQRShape.Create(self);
        with CShape do
        begin
          Parent := qrbHj;
          Brush.Color := qrbHj.Color;
          if cbNyHx.ItemIndex = 3 then
            Top := 0
          else
            Top := -1;
          if cbXjHx.ItemIndex <> 3 then
            Top := Top - 1;
          Left := intLeft;
          intWidth := Trunc(dbgColWidth.Columns[j].Width * dblBl) +
            TextWidth(mmoNy.Font, 'A') + 1;
          if cbHjHx.ItemIndex <> 2 then
            Width := intWidth
          else
            Width := intWidth - 1;
          Height := qrbHj.Height;
          if rbHjSx.Checked then
            Pen.Style := psSolid
          else
            Pen.Style := psDashDot;
          case cbHjHx.ItemIndex of
            0: Shape := qrsRectangle;
            1: Shape := qrsTopAndBottom;
            2: Shape := qrsRightAndLeft;
            3: Enabled := false;
          end;
        end;
        if i = 0 then
        begin
          CLabel := TQRLabel.Create(self);
          with CLabel do
          begin
            Parent := qrbHj;
            Caption := '合计';
            Alignment := taCenter;
            Top := Trunc(TextHeight(mmoHj.Font, 'A') * StrToFloat(edtHjXj.Text)) div 2;
            Left := intLeft + TextWidth(mmoNy.Font, 'A') div 2;
            Width := CShape.Width - TextWidth(mmoNy.Font, 'A');
            Height := TextHeight(mmoHj.Font, 'A');
            Font := mmoHj.Font;
            Transparent := true;
          end;
        end;
        if (dbgColWidth.Columns[j].Field is TNumericField) and
          (Pos(UpperCase(dbgColWidth.Columns[j].FieldName) + ';', UpperCase(strTotalFields)) > 0) then
        begin
          CExpr := TQRExpr.Create(self);
          with CExpr do
          begin
            Parent := qrbHj;
            Alignment := taRightJustify;
            Mask := TNumericField(dbgColWidth.Columns[j].Field).DisplayFormat;
            Expression := 'sum(if(STOPSUM=0, ' + dbgColWidth.Columns[j].FieldName + ', 0))';
            Top := Trunc(TextHeight(mmoHj.Font, 'A') * StrToFloat(edtHjXj.Text)) div 2;
            Left := intLeft + TextWidth(mmoNy.Font, 'A') div 2;
            Width := CShape.Width - TextWidth(mmoNy.Font, 'A');
            Height := TextHeight(mmoHj.Font, 'A');
            Font := mmoHj.Font;
            Transparent := true;
          end;
        end;
        intLeft := CShape.Left + intWidth - 1;
      end;
    end;
    //Bw
    if not BwDy.Checked  or (BwRich.Text = '') then
      qrbBw.Height := 0
    else
    begin
      with qrbBw do
      begin
        Height := GetRichEditHeight(BwRich) + RichMargin;
        Color := BwColor.Color;
        DrawBandFrame(qrbBw, BwHx.ItemIndex);
      end;
      with qrrBw do
      begin
        Top := RichMargin div 2;
        Height := qrbBw.Height - RichMargin div 2;
        Width := qrbBw.Width;
        RichClone(BwRich, BwRich_P);
        SetRichText(BwRich_P);
        BwRich_P.SelectAll;
        if BwRightAlign.Down then
          BwRich_P.Paragraph.Alignment := taRightJustify
        else if BwCenterAlign.Down then
          BwRich_P.Paragraph.Alignment := taCenter
        else
          BwRich_P.Paragraph.Alignment := taLeftJustify;
        ParentRichEdit := BwRich_P;
      end;
    end;
    //Yj
    if not YjDy.Checked  or (YjRich.Text = '') then
      qrbYj.Height := 0
    else
    begin
      with qrbYj do
      begin
        Height := GetRichEditHeight(YjRich) + RichMargin;
        Color := YjColor.Color;
        DrawBandFrame(qrbYj, YjHx.ItemIndex);
      end;
      with qrrYj do
      begin
        Top := RichMargin div 2;
        Height := qrbYj.Height - RichMargin div 2;
        Width := qrbYj.Width;
        RichClone(YjRich, YjRich_P);
        SetRichText(YjRich_P);
        YjRich_P.SelectAll;
        if YjRightAlign.Down then
          YjRich_P.Paragraph.Alignment := taRightJustify
        else if YjCenterAlign.Down then
          YjRich_P.Paragraph.Alignment := taCenter
        else
          YjRich_P.Paragraph.Alignment := taLeftJustify;
        ParentRichEdit := YjRich_P;
      end;
    end;
    //Ymdy
    if Pos('[X]', cbYmfs.Text) = 0 then
      qrbYmdy.Height := 0
    else
    begin
      with qrbYmdy do
      begin
        Height := Trunc(TextHeight(YmdyFont.Font, 'A') * 1.5);
        Color := YmdyColor.Color;
      end;
      with qrlYm do
      begin
        Font := YmdyFont.Font;
        Top := Trunc(TextHeight(YmdyFont.Font, 'A') * 0.25);
        if YmdyRightAlign.Down then
          Alignment := taRightJustify
        else if YmdyCenterAlign.Down then
          Alignment := taCenter
        else
          Alignment := taLeftJustify;
        Caption := StringReplace(cbYmfs.Text, '[X]', '   ', [rfReplaceAll]);
      end;
      with qrsYm do
      begin
        Font := YmdyFont.Font;
        Top := qrlYm.Top;
        Width := TextWidth(YmdyFont.Font, '123');
        Left := qrlYm.Left + TextWidth(YmdyFont.Font,
          Copy(cbYmfs.Text, 1, Pos('[X]', cbYmfs.Text) - 1));
      end;
    end;
    //DataSet Last
    evnTmp := nil;
    with ADataSet do
    begin
      bmJbzl := GetBookmark;
      try
        evnTmp := OnCalcFields;
        OnCalcFields := nil;
        Last;
        GotoBookmark(bmJbzl);
      finally
        FreeBookmark(bmJbzl);
        OnCalcFields := evnTmp;
      end;
    end;
    //Print
    if APreview then
      Preview
    else
      Print;
    free;
  end;
  rptSetPrint := nil;
  if cbXh.Checked then
  begin
    dbgColWidth.Columns.Delete(0);
    DstList.Items.Delete(0);
  end;
  blnPrintting := false;
end;

{-My Procedure 自定义过程-}

//SetNotePage
procedure TfrmSetPrint.SetNotePage(APage: string);
var
  intWidth: integer;
begin
  Notebook1.ActivePage := APage;
  if APage = '1' then
  begin
    Caption := '资料打印';
    intWidth := RptList.Left + RptList.Width + btnPreview.Width + 26;
    Width := intWidth;
    Left := (screen.Width - intWidth) div 2;
    RptList.SetFocus;
  end else
  begin
    Caption := '打印设置 - [' + RptList.Items[RptList.ItemIndex] + ']';
    intWidth := PageControl1.Left + PageControl1.Width + 22;
    Left := (screen.Width - intWidth) div 2;
    Width := intWidth;
    PageControl1.ActivePageIndex := 0;
    PageControl2.ActivePageIndex := 0;
    SetImageTop(nil);
  end;
  pnlColWidth.Visible := false;
end;

//GetInputString
function TfrmSetPrint.GetInputString(const ACaption, APrompt, ADefault: string): string;
begin
  frmInputString := TfrmInputString.Create(self);
  with frmInputString do
  begin
    Caption := ACaption;
    labPrompt.Caption := APrompt;
    edtInput.Text := ADefault;
    ShowModal;
    result := strResult;
    Free;
  end;
end;

//IniSet
procedure TfrmSetPrint.IniSet;
var
  i: integer;
  strFileName: string;
begin
  //BG
  ////Ym
  YmRich.Lines.Clear;
  YmRich.Text := Application.Title;
  with YmRich.DefAttributes do
  begin
    Name := self.Font.Name;
    Size := 18;
    Color := clBlack;
    Style := Style + [fsBold] - [fsItalic, fsUnderline];
  end;
  YmDy.Checked := false;
  YmColor.Color := clWhite;
  YmCenterAlign.Down := true;
  YmHx.ItemIndex := 3;
  ////Bt
  BtRich.Lines.Clear;
  BtRich.Text := AForm.Caption;
  with BtRich.DefAttributes do
  begin
    Name := self.Font.Name;
    Size := 18;
    Color := clBlack;
    Style := Style + [fsBold] - [fsItalic, fsUnderline];
  end;
  BtDy.Checked := True;
  BtColor.Color := clWhite;
  BtCenterAlign.Down := true;
  BtHx.ItemIndex := 3;
  ////Bgbt
  BgbtRich.Lines.Clear;
  with BgbtRich.DefAttributes do
  begin
    Name := self.Font.Name;
    Size := 11;
    Color := clBlack;
    Style := Style - [fsBold, fsItalic, fsUnderline];
  end;
  BgbtDy.Checked := True;
  BgbtColor.Color := clWhite;
  BgbtLeftAlign.Down := true;
  BgbtHx.ItemIndex := 3;
  ////Lm
  mmoLm.Font := self.Font;
  mmoLm.Color := clWhite;
  edtLmXj.Text := '1.5';
  cbLmHx.ItemIndex := 0;
  rbLmSx.Checked := true;
  ////Ny
  mmoNy.Font := self.Font;
  mmoNy.Color := clWhite;
  edtNyXj.Text := '0.8';
  cbNyHx.ItemIndex := 0;
  rbNySx.Checked := true;
  pnlOdd.Color := clWhite;
  pnlEven.Color := clWhite;
  edtLmsl.Value := 1;
  edtLf.Value := 0;
  cbXh.Checked := false;
  cbHh.Checked := false;
  ////Xj
  cbXj.Checked := false;
  mmoXj.Font := self.Font;
  mmoXj.Color := clWhite;
  edtXjXj.Text := '1.0';
  cbXjHx.ItemIndex := 0;
  rbXjSx.Checked := true;
  ////Hj
  cbHj.Checked := true;
  mmoHj.Font := self.Font;
  mmoHj.Color := clWhite;
  edtHjXj.Text := '1.0';
  cbHjHx.ItemIndex := 0;
  rbHjSx.Checked := true;
  ////Bw
  BwRich.Lines.Clear;
  BwRich.Text := '操作员: [当前操作员]    打印日期: [当前日期]';
  with BwRich.DefAttributes do
  begin
    Name := self.Font.Name;
    Size := 11;
    Color := clBlack;
    Style := Style - [fsBold, fsItalic, fsUnderline];
  end;
  BwDy.Checked := True;
  BwColor.Color := clWhite;
  BwLeftAlign.Down := true;
  BwHx.ItemIndex := 3;
  ////Yj
  YjRich.Lines.Clear;
  with YjRich.DefAttributes do
  begin
    Name := self.Font.Name;
    Size := 11;
    Color := clBlack;
    Style := Style - [fsBold, fsItalic, fsUnderline];
  end;
  YjDy.Checked := false;
  YjColor.Color := clWhite;
  YjLeftAlign.Down := true;
  YjHx.ItemIndex := 3;
  ////TotalList
  if (strTotalFields = '') or (Copy(strTotalFields, Length(strTotalFields), 1) <> ';') then
    strTotalFields := strTotalFields + ';';
  TotalList.Items.Clear;
  for i := 0 to AGrid.Columns.Count - 1 do
    if (AGrid.Columns[i].Visible) and
      (AGrid.Columns[i].Field is TNumericField) then
      TotalList.Items.Add(AGrid.Columns[i].Title.Caption +
        Copy(strSpace, 1, 50 - Length(AGrid.Columns[i].Title.Caption)) +
        AGrid.Columns[i].FieldName);
      {if Pos(UpperCase(AGrid.Columns[i].FieldName) + ';', UpperCase(strTotalFields)) > 0 then
        TotalList.State[TotalList.Items.Count - 1] := cbChecked;}
  //LM
  strFileName := ExtractFilePath(Application.ExeName) + 'Column\' +
    FormatFloat('0000', pintUserID) +
    AForm.Name + AGrid.Name + '.int';
  dbgColWidth.DataSource := nil;
  dbgColWidth.Columns.LoadFromFile(strFileName);
  dbgColWidth.DataSource := AGrid.DataSource;
  SrcList.Items.Clear;
  DstList.Items.Clear;
  with dbgColWidth do
    for i := 0 to Columns.Count - 1 do
      if Columns[i].Visible then
        DstList.Items.Add(Columns[i].Title.Caption +
          Copy(strSpace, 1, 50 - Length(Columns[i].Title.Caption)) +
          Columns[i].FieldName);
  SrcList.ItemIndex := 0;
  SetButtons;
  //Page
  cbPageSize.ItemIndex := 1;
  cbPageSizeChange(nil);
  rbPortraitClick(nil);
  cbBj.Checked := true;
  edtPageTop.Value := 10;
  edtPageBottom.Value := 20;
  rbPortrait.Checked := true;
  cbYmfs.Text := cbYmfs.Items.Strings[0];
  YmdyFont.Font := self.Font;
  YmdyColor.Color := clWhite;
  YmdyRightAlign.Down := true;
  cbBjClick(cbBj);
  SetImageTop(nil);
  edtLmslChange(nil);
  //Preview Pnl
  SetPreviewPnl(nil);
end;

//SaveSet
procedure TfrmSetPrint.SaveSet(AFileName: string);
var
  i, j: integer;
  iniFile : TIniFile;
begin
  screen.Cursor := crHourGlass;
  iniFile := TiniFile.Create(AFileName);
  with iniFile do
  begin
    WriteString('AGrid', 'Name', AGrid.Name);
    for i := 0 to self.ComponentCount - 1 do
    begin
      //No Save
      if self.Components[i].Tag > 0 then
        Continue;
      //RichEdit
      if (self.Components[i] is TRichEdit) then
        WriteString(self.Components[i].Name, 'Text', FileToString(self.Components[i]));
      //CheckBox
      if (self.Components[i] is TCheckBox) then
        WriteBool(self.Components[i].Name, 'Checked', TCheckBox(self.Components[i]).Checked);
      //Panel
      if (self.Components[i] is TPanel) then
      begin
        WriteString(self.Components[i].Name, 'FontName', TPanel(self.Components[i]).Font.Name);
        WriteInteger(self.Components[i].Name, 'FontSize', TPanel(self.Components[i]).Font.Size);
        WriteInteger(self.Components[i].Name, 'FontColor', TPanel(self.Components[i]).Font.Color);
        WriteBool(self.Components[i].Name, 'FontStyleBold', fsBold in TPanel(self.Components[i]).Font.Style);
        WriteBool(self.Components[i].Name, 'FontStyleItalic', fsItalic in TPanel(self.Components[i]).Font.Style);
        WriteBool(self.Components[i].Name, 'FontStyleUnderline', fsUnderline in TPanel(self.Components[i]).Font.Style);
        WriteInteger(self.Components[i].Name, 'Color', TPanel(self.Components[i]).Color);
      end;
      //ToolButton
      if (self.Components[i] is TToolButton) then
        WriteBool(self.Components[i].Name, 'Down', TToolButton(self.Components[i]).Down);
      //ComboBox
      if (self.Components[i] is TComboBox) then
      begin
        WriteString(self.Components[i].Name, 'Text', TComboBox(self.Components[i]).Text);
        WriteInteger(self.Components[i].Name, 'ItemIndex', TComboBox(self.Components[i]).ItemIndex);
      end;
      //Edit
      if (self.Components[i] is TEdit) then
        WriteString(self.Components[i].Name, 'Text', TEdit(self.Components[i]).Text);
      //MaskEdit
      if (self.Components[i] is TMaskEdit) then
        WriteString(self.Components[i].Name, 'Text', TMaskEdit(self.Components[i]).Text);
      //SpinEdit
      if (self.Components[i] is TSpinEdit) then
        WriteInteger(self.Components[i].Name, 'Value', TSpinEdit(self.Components[i]).Value);
      //RadioButton
      if (self.Components[i] is TRadioButton) then
        WriteBool(self.Components[i].Name, 'Checked', TRadioButton(self.Components[i]).Checked);
      //ListBox
      if (self.Components[i] is TListBox) then
        with TListBox(self.Components[i]) do
        begin
          WriteInteger(Name, 'Items Count', Items.Count);
          for j := 0 to Items.Count - 1 do
            WriteString(Name + ' Items ' + FormatFloat('00', j),
              'Text', Items.Strings[j]);
        end;
      //CheckListBox
      if (self.Components[i] is TCheckListBox) then
        with TCheckListBox(self.Components[i]) do
        begin
          WriteInteger(Name, 'Items Count', Items.Count);
          for j := 0 to Items.Count - 1 do
          begin
            WriteString(Name + ' Items ' + FormatFloat('00', j),
              'Text', Items.Strings[j]);
            WriteBool(Name + ' Items ' + FormatFloat('00', j),
              'Check', State[j] = cbChecked);
          end;
        end;
      //DBGrid
      if (self.Components[i] is TDBGrid) then
        with TDBGrid(self.Components[i]) do
        begin
          WriteInteger(Name, 'Columns Count', Columns.Count);
          for j := 0 to Columns.Count - 1 do
          begin
            WriteString(Name + ' Columns ' + FormatFloat('00', j),
              'Column FieldName', Columns[j].FieldName);
            WriteString(Name + ' Columns ' + FormatFloat('00', j),
              'Column Caption', Columns[j].Title.Caption);
            WriteInteger(Name + ' Columns ' + FormatFloat('00', j),
              'Column Width', Columns[j].Width);
          end;
        end;
    end;
  end;
  iniFile.Free;
  screen.Cursor := crDefault;
end;

//LoadSet
procedure TfrmSetPrint.LoadSet(AFileName: string);
var
  i, j: integer;
  iniFile : TIniFile;
  s: string;
begin
  screen.Cursor := crHourGlass;
  blnPrintting := true;
  iniFile := TiniFile.Create(AFileName);
  with iniFile do
  begin
    s := ReadString('AGrid', 'Name', '');
    if s <> '' then
      for i := 0 to AForm.ComponentCount - 1 do
        if (AForm.Components[i] is TDBGrid) and (AForm.Components[i].Name = s) then
        begin
          AGrid := TDBGrid(AForm.Components[i]);
          ADataSet := TClientdataset(TDBGrid(AForm.Components[i]).DataSource.DataSet);
        end;
    SetPmnXm;    
    for i := 0 to self.ComponentCount - 1 do
    begin
      //No Load
      if self.Components[i].Tag > 0 then
        Continue;
      //RichEdit
      if (self.Components[i] is TRichEdit) then
      begin
        mmoTmp.Lines.Text := ReadString(self.Components[i].Name,
          'Text', '');
        mmoTmp.Lines.SaveToFile(TmpFileName);
        TRichEdit(self.Components[i]).Lines.LoadFromFile(TmpFileName);
      end;
      //CheckBox
      if (self.Components[i] is TCheckBox) then
        TCheckBox(self.Components[i]).Checked :=
          ReadBool(self.Components[i].Name, 'Checked', true);
      //Panel
      if (self.Components[i] is TPanel) then
      begin
        TPanel(self.Components[i]).Font.Name := ReadString(self.Components[i].Name, 'FontName', '');
        TPanel(self.Components[i]).Font.Size := ReadInteger(self.Components[i].Name, 'FontSize', 0);
        TPanel(self.Components[i]).Font.Color := ReadInteger(self.Components[i].Name, 'FontColor', 0);
        if ReadBool(self.Components[i].Name, 'FontStyleBold', false) then
          TPanel(self.Components[i]).Font.Style := TPanel(self.Components[i]).Font.Style + [fsBold]
        else
          TPanel(self.Components[i]).Font.Style := TPanel(self.Components[i]).Font.Style - [fsBold];
        if ReadBool(self.Components[i].Name, 'FontStyleItalic', false) then
          TPanel(self.Components[i]).Font.Style := TPanel(self.Components[i]).Font.Style + [fsItalic]
        else
          TPanel(self.Components[i]).Font.Style := TPanel(self.Components[i]).Font.Style - [fsItalic];
        if ReadBool(self.Components[i].Name, 'FontStyleUnderline', false) then
          TPanel(self.Components[i]).Font.Style := TPanel(self.Components[i]).Font.Style + [fsUnderline]
        else
          TPanel(self.Components[i]).Font.Style := TPanel(self.Components[i]).Font.Style - [fsUnderline];
        TPanel(self.Components[i]).Color := ReadInteger(self.Components[i].Name, 'Color', 0);
      end;
      //ToolButton
      if (self.Components[i] is TToolButton) then
        TToolButton(self.Components[i]).Down := ReadBool(self.Components[i].Name, 'Down', false);
      //ComboBox
      if (self.Components[i] is TComboBox) then
      begin
        TComboBox(self.Components[i]).Text := ReadString(self.Components[i].Name, 'Text', '');
        TComboBox(self.Components[i]).ItemIndex := ReadInteger(self.Components[i].Name, 'ItemIndex', 0);
      end;
      //Edit
      if (self.Components[i] is TEdit) then
        TEdit(self.Components[i]).Text := ReadString(self.Components[i].Name, 'Text', '');
      //MaskEdit
      if (self.Components[i] is TMaskEdit) then
        TMaskEdit(self.Components[i]).Text := ReadString(self.Components[i].Name, 'Text', '0.0');
      //SpinEdit
      if (self.Components[i] is TSpinEdit) then
        TSpinEdit(self.Components[i]).Value := ReadInteger(self.Components[i].Name, 'Value', 0);
      //RadioButton
      if (self.Components[i] is TRadioButton) then
        TRadioButton(self.Components[i]).Checked := ReadBool(self.Components[i].Name, 'Checked', false);
      //ListBox
      if (self.Components[i] is TListBox) then
        with TListBox(self.Components[i]) do
        begin
          Items.Clear;
          for j := 0 to ReadInteger(Name, 'Items Count', 0) - 1 do
            Items.Add(ReadString(Name + ' Items ' + FormatFloat('00', j),
              'Text', ''));
        end;
      //CheckListBox
      if (self.Components[i] is TCheckListBox) then
        with TCheckListBox(self.Components[i]) do
        begin
          Items.Clear;
          for j := 0 to ReadInteger(Name, 'Items Count', 0) - 1 do
          begin
            Items.Add(ReadString(Name + ' Items ' + FormatFloat('00', j),
              'Text', ''));
            if ReadBool(Name + ' Items ' + FormatFloat('00', j),
              'Check', false) then
              State[j] := cbChecked
            else
              State[j] := cbUnchecked;
          end;
        end;
      //DBGrid
      if (self.Components[i] is TDBGrid) then
        with TDBGrid(self.Components[i]) do
        begin
          DataSource := nil;
          Columns.Clear;
          for j := 0 to ReadInteger(Name, 'Columns Count', 0) - 1 do
            with Columns.Add do
            begin
         			Title.Alignment := taCenter;
              FieldName := ReadString(Name + ' Columns ' + FormatFloat('00', j),
                'Column FieldName', '');
              Title.Caption := ReadString(Name + ' Columns ' + FormatFloat('00', j),
                'Column Caption', '');
              Width := ReadInteger(Name + ' Columns ' + FormatFloat('00', j),
                'Column Width', 0);
            end;
          DataSource := AGrid.DataSource;
        end;
    end;
  end;
  cbBjClick(nil);
  iniFile.Free;
  blnPrintting := false;
  screen.Cursor := crDefault;
end;

end.
