unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ComCtrls, Buttons, ToolWin, ExtCtrls, dxsbar,
  OleCtrls, SHDocVw, Grids, BaseGrid, AdvGrid, StdCtrls, AdvEdit,
  cxLookAndFeelPainters, cxButtons, Mask, AdvMEdBtn, PlannerMaskDatePicker,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ActnList, asgprint;

type
  TCustomCell = record
    aRow: integer;
    aCol: Integer;
  end;
  TMain = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ToolButton6: TToolButton;
    SpeedButton10: TSpeedButton;
    ToolButton7: TToolButton;
    SpeedButton12: TSpeedButton;
    ToolButton8: TToolButton;
    SpeedButton11: TSpeedButton;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    F1: TMenuItem;
    N1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    T1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    S1: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N21: TMenuItem;
    W1: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    H1: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N33: TMenuItem;
    N32: TMenuItem;
    MainBrower: TWebBrowser;
    SpeedButton15: TSpeedButton;
    SpeedButton19: TSpeedButton;
    N2: TMenuItem;
    N3: TMenuItem;
    Label7: TLabel;
    SpeedButton20: TSpeedButton;
    SpeedButton4: TSpeedButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    InVoiceTable: TAdvStringGrid;
    Label10: TLabel;
    BKTitle: TRichEdit;
    EditPan: TPanel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    cxTextEdit6: TcxTextEdit;
    Label9: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxButton5: TcxButton;
    AdvEdit7: TAdvEdit;
    AdvEdit6: TAdvEdit;
    AdvEdit5: TAdvEdit;
    AdvEdit4: TAdvEdit;
    AdvEdit3: TAdvEdit;
    AdvEdit1: TAdvEdit;
    Timer1: TTimer;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    procedure MainBrowerBeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure FormShow(Sender: TObject);
    procedure InVoiceTableClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure SpeedButton11Click(Sender: TObject);
    procedure InVoiceTableCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure InVoiceTableDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure InVoiceTableGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InVoiceTableEditingDone(Sender: TObject);
    procedure InVoiceTableKeyPress(Sender: TObject; var Key: Char);
    procedure InVoiceTableGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure SpeedButton15Click(Sender: TObject);
    procedure AdvEdit3Exit(Sender: TObject);
    procedure InVoiceTableSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure AdvEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton20Click(Sender: TObject);
    procedure AdvEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure AdvEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure AdvEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure AdvEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure cxDateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure N10Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure InVoiceTableClick(Sender: TObject);
  private
    procedure DrawFP01;  
    procedure SaveFP01;  
    procedure PrintFP01; 
    procedure DrawFP02;  
    procedure SaveFP02;  
    procedure PrintFP02; 
    procedure DrawFP03;  
    procedure SaveFP03;  
    procedure PrintFP03; 
    procedure DrawFP04;  
    procedure SaveFP04;  
    procedure PrintFP04; 
    procedure DrawFP05;  
    procedure SaveFP05;  
    procedure PrintFP05; 
    procedure UpdateFP(aTable: string); 
    procedure ClearEdit; 
    procedure AutoComputer(DxCell, HjCell, BeginCell: TCustomCell; aIndex: Integer); 
    procedure ShowInitialization; 
    function GetMax(aSql: string): Integer; 
    function CheckOut: Boolean; 
    function SelectFP01(aText: string): Boolean; 
    function SelectFP02(aText: string): Boolean; 
    function SelectFP03(aText: string): Boolean; 
    function SelectFP04(aText: String): Boolean;  
    function SelectFP05(aText: String): Boolean;  
    
  public
    
  end;

var
  Main: TMain;
  PubRect: TRect; 
  PubCanvas: TCanvas; 
implementation

uses
  FrmLogin, FrmCustom, FrmData, FrmPitPw, FrmAbout, FrmManage,
  FrmLibrary, FrmBackup;

{$R *.dfm}

var
  aPrintForm: TPitPw; 


function Disassemble(Parameter: string): string;
var
  aTmp, aStr: string;
  aIndex: Integer;
begin
  aTmp := Parameter;
  aIndex := Pos('@', aTmp);
  if aIndex > 0 then
  begin
    aStr := Copy(aTmp, aIndex + 1, Length(aTmp) - aindex);
    Result := aStr;
  end
  else
    Result := '';
end;



procedure TMain.DrawFP01;
var
  j, i: integer;
  aTmp: string;
begin
  if CurrentFP = 'FP01' then
  begin
    label4.Caption := '其它内容：';
    Label2.Caption := '开票日期：';
    Label3.Caption := '发票号码：';
    Label9.Caption := '承  租 方：';
    Label6.Caption := '客户名称：';
    Label8.Caption := '客户编码：';
    AdvEdit7.Enabled := False;
    Label9.Left := 10;
    Label10.Caption := '    ' +
      '按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能' +
      '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》' +
      '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开' +
      '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。';
    Label10.Visible := True;
    with InVoiceTable do
    begin
      RowCount := 11;
      RowHeights[0] := 17;
      RowHeights[1] := 17;
      GridLineColor := 8684164;
      WordWrap := False;
      
      MergeCells(0, 0, 2, 3);
      MergeCells(2, 0, 4, 1);
      MergeCells(2, 1, 2, 1);
      MergeCells(2, 2, 2, 1);
      ColWidths[3] := 20;
      MergeCells(4, 1, 1, 1);
      ColWidths[4] := 64;
      MergeCells(5, 1, 1, 2);
      MergeCells(6, 0, 1, 3);
      MergeCells(7, 0, 1, 3);
      ColWidths[7] := 45;
      MergeCells(8, 0, 1, 3);
      ColWidths[8] := 45;
      MergeCells(9, 0, 4, 1);
      MergeCells(9, 1, 4, 2);
      Cells[0, 0] := '租 赁 项 目';
      Cells[2, 0] := '租  赁  日  期';
      Cells[2, 1] := '起';
      Cells[2, 2] := '年 月 日';
      Cells[4, 1] := '止';
      Cells[4, 2] := '年 月 日';
      Cells[5, 1] := '天 数';
      Cells[6, 0] := '单 位';
      Cells[7, 0] := '数 量';
      Cells[8, 0] := #13'收费'#13'标准';
      Cells[9, 0] := '金      额';
      
      RowHeights[3] := 26;
      MergeCells(0, 3, 2, 1);
      MergeCells(2, 3, 2, 1);
      MergeCells(4, 3, 1, 1);
      MergeCells(5, 3, 1, 1);
      MergeCells(6, 3, 1, 1);
      MergeCells(7, 3, 1, 1);
      MergeCells(8, 3, 1, 1);
      MergeCells(9, 3, 4, 1);
      
      RowHeights[4] := 26;
      MergeCells(0, 4, 2, 1);
      MergeCells(2, 4, 2, 1);
      MergeCells(4, 4, 1, 1);
      MergeCells(5, 4, 1, 1);
      MergeCells(6, 4, 1, 1);
      MergeCells(7, 4, 1, 1);
      MergeCells(8, 4, 1, 1);
      MergeCells(9, 4, 4, 1);
      
      RowHeights[5] := 26;
      MergeCells(0, 5, 2, 1);
      MergeCells(2, 5, 2, 1);
      MergeCells(4, 5, 1, 1);
      MergeCells(5, 5, 1, 1);
      MergeCells(6, 5, 1, 1);
      MergeCells(7, 5, 1, 1);
      MergeCells(8, 5, 1, 1);
      MergeCells(9, 5, 4, 1);
      
      RowHeights[6] := 26;
      MergeCells(0, 6, 2, 1);
      MergeCells(2, 6, 7, 1);
      MergeCells(9, 6, 4, 1);
      Cells[0, 6] := '金额合计(大写)';
      
      MergeCells(0, 7, 2, 2);
      MergeCells(2, 7, 11, 2);
      Cells[0, 7] := '备    注';
      Alignments[0, 7] := taCenter;
      
      MergeCells(0, 9, 4, 1);
      MergeCells(4, 9, 2, 1);
      MergeCells(6, 9, 2, 1);
      MergeCells(8, 9, 2, 1);
      MergeCells(10, 9, 3, 1);
      Cells[0, 9] := '出租方(盖章有效)';
      Cells[4, 9] := '开票人:';
      Cells[8, 9] := '收款人:';
      Alignments[0, 9] := taCenter;
      Alignments[4, 9] := taRightJustify;
      Alignments[8, 9] := taRightJustify;
      MergeCells(0, 10, 13, 1);
      
      RowColor[0] := 16761798;
      RowColor[1] := 16761798;
      RowColor[2] := 16761798;
      RowColor[3] := 15204327;
      RowColor[4] := 15204327;
      RowColor[5] := 15204327;
      RowColor[6] := 15204327;
      RowColor[7] := 15204327;
      RowColor[9] := 16761798;
      
      Colors[0, 6] := 16761798;
      Colors[0, 7] := 16761798;
      Colors[6, 2] := 15204327;
      Colors[9, 6] := 16761798;
      Colors[2, 6] := 13041663;
      Colors[10, 9] := 15204327;
      Colors[6, 9] := 15204327;
      Colors[9, 1] := 13041663;
      
      for i := 0 to 12 do
        for j := 0 to 6 do
        begin
          Alignments[i, j] := taCenter;
        end;
      Label10.Top := 252;
      BKTitle.Alignment := taCenter;
      RichToCell(0, 10, BKTitle);
      VAlignment := vtaCenter;
    end;
  end;
end;

procedure TMain.MainBrowerBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  aSelectMenu: string;
begin
  aSelectMenu := Disassemble(URL);
  if UpperCase(aSelectMenu) = UpperCase('TaxClose') then
  begin
    if Application.MessageBox('你是否真的要退出', '贝壳提示', MB_YESNO +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST) = IDYES then
    begin
      Application.Terminate;
    end;
  end;
  if UpperCase(aSelectMenu) = UpperCase('TaxZlyfp') then
  begin
    CurrentFP := 'FP01';
    SpeedButton4.Click;
  end;
  if UpperCase(aSelectMenu) = UpperCase('TaxJzyfp') then
  begin
    CurrentFP := 'FP02';
    SpeedButton4.Click;
  end;
  if UpperCase(aSelectMenu) = UpperCase('TaxGdzc') then
  begin
    CurrentFP := 'FP03';
    SpeedButton4.Click;
  end;
  if UpperCase(aSelectMenu) = UpperCase('Taxfwhy') then
  begin
    CurrentFP := 'FP04';
    SpeedButton4.Click;
  end;
  if UpperCase(aSelectMenu) = UpperCase('TaxWxzc') then
  begin
    CurrentFP := 'FP05';
    SpeedButton4.Click;
  end;
  if UpperCase(aSelectMenu) = UpperCase('UserManager') then
  begin
    SpeedButton10.Click;
  end;
  if UpperCase(aSelectMenu) = UpperCase('GenManager') then
  begin
    SpeedButton1.Click;
  end;
  if UpperCase(aSelectMenu) = UpperCase('CompactDB') then
  begin
    Backup.AdvTabSheet3.Show;
    Backup.ShowModal;
  end;
  if UpperCase(aSelectMenu) = UpperCase('DataBackup') then
  begin
    Backup.AdvTabSheet1.Show;
    Backup.ShowModal;
  end;
  if UpperCase(aSelectMenu) = UpperCase('DataRestore') then
  begin
    Backup.AdvTabSheet2.Show;
    Backup.ShowModal;
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  ShowInitialization;
end;

procedure TMain.InVoiceTableClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin

end;

procedure TMain.SpeedButton11Click(Sender: TObject);
begin
  Close;
end;

procedure TMain.InVoiceTableCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if TaxPubReadOnly then
    CanEdit := False;
  if CurrentFP = 'FP01' then
  begin
    if (ARow <= 2) and (ACol <= 12) then
    begin
      CanEdit := False;
    end;
    if (ARow = 6) then
      CanEdit := False;
    if (ARow = 7) and (ACol = 0) then
      CanEdit := False;
    if (ARow = 9) and ((ACol = 0) or (ACol = 4) or (ACol = 8)) then
      CanEdit := False;
    if (ARow = 10) then
      CanEdit := False;
  end;
  if CurrentFP = 'FP02' then
  begin
    if (ARow = 0) and ((ACol = 0) or (ACol = 4) or (ACol = 8)) then
      CanEdit := False;
    if (ARow = 1) then
      CanEdit := False;
    if (ARow = 7) and ((ACol = 0) or (ACol = 8)) then
      CanEdit := False;
    if (ARow = 8) and ((ACol = 0) or (ACol = 3) or (ACol = 8)) then
      CanEdit := False;
    if (ARow = 9) then
      CanEdit := False;
  end;
  if CurrentFP = 'FP03' then
  begin
    if (ARow = 0) and ((ACol = 0) or (ACol = 7)) then
      CanEdit := False;
    if (ARow = 1) or ((ACol = 7) and (ARow = 2)) then
      CanEdit := False;
    if (ARow = 6) then
      CanEdit := False;
    if (ARow = 7) and ((ACol = 3) or (ACol = 0) or (ACol = 8)) then
      CanEdit := False;
    if (ARow = 8) then
      CanEdit := False;
  end;
  if CurrentFP='FP04' then
  begin
    if (ARow=0) or (ARow=5) or (ARow=9) then
      CanEdit:=False;
    if (ARow=1) and (ACol=9) then
      CanEdit:=False;
    if (ARow=6) and (ACol=0)  then
      CanEdit:=False;
    if (ARow=8) and ((ACol=0) or (ACol=3) or (ACol=8)) then
      CanEdit:=False;
  end;
  if CurrentFP='FP05' then
  begin
    if (ACol=0) and (ARow=0) then
      CanEdit:=False;
    if (ACol=0) and (ARow=2) then
      CanEdit:=False;
    if (ARow=4) or ((ACol=9) and (ARow=5)) then
      CanEdit:=False;
    if (ARow=9) or ((ARow=10) and (ACol=0))  then
      CanEdit:=False;
    if (ARow=11) and ((ACol=0) or (ACol=3) or (ACol=8)) then
      CanEdit:=False;
  end;
end;

procedure TMain.InVoiceTableDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  DrawMoney, DrawOne: string;
  i, CurrentIndex, MoneyDiv: Integer;
  MoneyWidth, MoneyLeft, MoneyTop, aLineTop: Integer;
  DrawMoneyCp: string;
begin
  PubRect := InVoiceTable.ClientRect; ;
  PubCanvas := InVoiceTable.Canvas;
  if CurrentFP = 'FP01' then
  begin
    if (ARow = 1) and (ACol = 9) then
    begin
      with InVoiceTable do
      begin
        MoneyDiv := Length(MoneyCaStr) div 2;
        for i := 1 to MoneyDiv do
        begin
          CurrentIndex := (MoneyDiv - i + 1);
          DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - (MoneyWidth * i) + 12;
          MoneyLeft := aLineTop - (MoneyWidth);
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft, MoneyTop, DrawMoneyCp);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 2, Rect.Top);
            Canvas.LineTo(aLineTop - 2, Rect.Bottom);
          end;
        end;
      end;
    end;
    if (ACol >= 9) and ((ARow >= 3) and (ARow <= 7)) then
    begin
      with InVoiceTable do
      begin
        DrawMoney := InVoiceTable.Cells[ACol, ARow];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        Canvas.FillRect(Rect);
        for i := 1 to 12 do
        begin
          case i of
            3:
              Canvas.Pen.Color := clGreen;
            1, 5, 9:
              Canvas.Pen.Color := clGreen;
          else
            Canvas.Pen.Color := 8684164;
          end;
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if i > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - i + 1, 1);
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - MoneyWidth * (i - 1);
          MoneyLeft := aLineTop - MoneyWidth + 6;
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft - 5, MoneyTop, DrawOne);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 4, Rect.Top);
            Canvas.LineTo(aLineTop - 4, Rect.Bottom);
          end;
        end;
      end;
    end;
  end;
  if CurrentFP = 'FP02' then
  begin
    if (ARow = 2) and (ACol = 8) then
    begin
      with InVoiceTable do
      begin
        MoneyDiv := Length(MoneyCaStr) div 2;
        for i := 1 to MoneyDiv do
        begin
          CurrentIndex := (MoneyDiv - i + 1);
          DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - (MoneyWidth * i) + 12;
          MoneyLeft := aLineTop - (MoneyWidth);
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft, MoneyTop, DrawMoneyCp);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 2, Rect.Top);
            Canvas.LineTo(aLineTop - 2, Rect.Bottom);
          end;
        end;
      end;
    end;
    if (ACol >= 8) and ((ARow >= 3) and (ARow <= 7)) then
    begin
      with InVoiceTable do
      begin
        DrawMoney := InVoiceTable.Cells[ACol, ARow];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        Canvas.FillRect(Rect);
        for i := 1 to 12 do
        begin
          case i of
            3:
              Canvas.Pen.Color := clGreen;
            1, 5, 9:
              Canvas.Pen.Color := clGreen;
          else
            Canvas.Pen.Color := 8684164;
          end;
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if i > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - i + 1, 1);
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - MoneyWidth * (i - 1);
          MoneyLeft := aLineTop - MoneyWidth + 6;
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft - 5, MoneyTop, DrawOne);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 4, Rect.Top);
            Canvas.LineTo(aLineTop - 4, Rect.Bottom);
          end;
        end;
      end;
    end;
  end;
  if CurrentFP = 'FP03' then
  begin
    if (ARow = 2) and (ACol = 7) then
    begin
      with InVoiceTable do
      begin
        MoneyDiv := Length(MoneyCaStr) div 2;
        for i := 1 to MoneyDiv do
        begin
          CurrentIndex := (MoneyDiv - i + 1);
          DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - (MoneyWidth * i) + 12;
          MoneyLeft := aLineTop - (MoneyWidth);
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft, MoneyTop, DrawMoneyCp);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 2, Rect.Top);
            Canvas.LineTo(aLineTop - 2, Rect.Bottom);
          end;
        end;
      end;
    end;
    if (ACol >= 7) and (ACol < 11) and ((ARow >= 3) and (ARow <= 6)) then
    begin
      with InVoiceTable do
      begin
        DrawMoney := InVoiceTable.Cells[ACol, ARow];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        Canvas.FillRect(Rect);
        for i := 1 to 12 do
        begin
          case i of
            3:
              Canvas.Pen.Color := clGreen;
            1, 5, 9:
              Canvas.Pen.Color := clGreen;
          else
            Canvas.Pen.Color := 8684164;
          end;
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if i > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - i + 1, 1);
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - MoneyWidth * (i - 1);
          MoneyLeft := aLineTop - MoneyWidth + 6;
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft - 5, MoneyTop, DrawOne);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 4, Rect.Top);
            Canvas.LineTo(aLineTop - 4, Rect.Bottom);
          end;
        end;
      end;
    end;
  end;
 if CurrentFP = 'FP04' then
  begin
    if (ARow = 1) and (ACol = 9) then
    begin
      with InVoiceTable do
      begin
        MoneyDiv := Length(MoneyCaStr) div 2;
        for i := 1 to MoneyDiv do
        begin
          CurrentIndex := (MoneyDiv - i + 1);
          DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - (MoneyWidth * i) + 12;
          MoneyLeft := aLineTop - (MoneyWidth);
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft, MoneyTop, DrawMoneyCp);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 2, Rect.Top);
            Canvas.LineTo(aLineTop - 2, Rect.Bottom);
          end;
        end;
      end;
    end;
    if (ACol >= 9) and (ACol <= 12) and ((ARow >= 2) and (ARow <= 5)) then
    begin
      with InVoiceTable do
      begin
        DrawMoney := InVoiceTable.Cells[ACol, ARow];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        Canvas.FillRect(Rect);
        for i := 1 to 12 do
        begin
          case i of
            3:
              Canvas.Pen.Color := clGreen;
            1, 5, 9:
              Canvas.Pen.Color := clGreen;
          else
            Canvas.Pen.Color := 8684164;
          end;
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if i > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - i + 1, 1);
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - MoneyWidth * (i - 1);
          MoneyLeft := aLineTop - MoneyWidth + 6;
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft - 5, MoneyTop, DrawOne);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 4, Rect.Top);
            Canvas.LineTo(aLineTop - 4, Rect.Bottom);
          end;
        end;
      end;
    end;
  end;
 if CurrentFP = 'FP05' then
  begin
    if (ARow = 5) and (ACol = 9) then
    begin
      with InVoiceTable do
      begin
        MoneyDiv := Length(MoneyCaStr) div 2;
        for i := 1 to MoneyDiv do
        begin
          CurrentIndex := (MoneyDiv - i + 1);
          DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - (MoneyWidth * i) + 12;
          MoneyLeft := aLineTop - (MoneyWidth);
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft, MoneyTop, DrawMoneyCp);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 2, Rect.Top);
            Canvas.LineTo(aLineTop - 2, Rect.Bottom);
          end;
        end;
      end;
    end;
    if (ACol >= 9) and (ACol <= 12) and ((ARow >= 6) and (ARow <= 9)) then
    begin
      with InVoiceTable do
      begin
        DrawMoney := InVoiceTable.Cells[ACol, ARow];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        Canvas.FillRect(Rect);
        for i := 1 to 12 do
        begin
          case i of
            3:
              Canvas.Pen.Color := clGreen;
            1, 5, 9:
              Canvas.Pen.Color := clGreen;
          else
            Canvas.Pen.Color := 8684164;
          end;
          MoneyWidth := Canvas.TextWidth('4') + 8;
          if i > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - i + 1, 1);
          if I = 3 then
            Canvas.Pen.Color := 3637448
          else
            Canvas.Pen.Color := 8684164;
          aLineTop := Rect.Right - MoneyWidth * (i - 1);
          MoneyLeft := aLineTop - MoneyWidth + 6;
          MoneyTop := Rect.Top + (Rect.Bottom - Rect.Top - MoneyWidth) div 2;
          Canvas.TextOut(MoneyLeft - 5, MoneyTop, DrawOne);
          if i <> 1 then
          begin
            Canvas.MoveTo(aLineTop - 4, Rect.Top);
            Canvas.LineTo(aLineTop - 4, Rect.Bottom);
          end;
        end;
      end;
    end;
  end;
end;

procedure TMain.InVoiceTableGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
  if CurrentFP = 'FP01' then
  begin
    if (((ARow >= 3) and (ARow <= 5)) and ((ACol = 2) or (ACol = 4))) then
      Value := '!9999/99/00;1;_';
  end;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('你是否真的要退出', '提示', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST) = IDYES then
  begin
    Action := caFree;
    Application.Terminate;
  end
  else
    Action := caNone;
end;

procedure TMain.InVoiceTableEditingDone(Sender: TObject);
var
  i: Integer;
  aDxCell, aHjCell, aBeginCell: TCustomCell;
begin
  if CurrentFP = 'FP01' then
  begin
    if (((PubARow >= 3) and (PubARow <= 5)) and ((PubACol = 2) or (PubACol = 4))) then
      if InVoiceTable.Cells[PubACol, PubARow] = '    -  -  ' then
        InVoiceTable.Cells[PubACol, PubARow] := ''
      else
      begin
        try
          if (PubACol = 2) and (PubARow >= 3) and (PubARow <= 5) then
          begin
            InVoiceTable.Cells[2, PubARow] := FormatDateTime('YYYY-MM-DD',
              StrToDate(InVoiceTable.Cells[2, PubARow]));
            StrToDate(InVoiceTable.Cells[2, PubARow]);
          end;
          if (PubACol = 4) and (PubARow >= 3) and (PubARow <= 5) then
          begin
            InVoiceTable.Cells[4, PubARow] := FormatDateTime('YYYY-MM-DD',
              StrToDate(InVoiceTable.Cells[4, PubARow]));
            StrToDate(InVoiceTable.Cells[4, PubARow]);
          end;
        except
          if i = 1 then Exit;
          InVoiceTable.Cells[PubACol, PubARow] := '';
          inc(i);
          Application.MessageBox('日期填写错误!     ', '贝壳提示', MB_OK +
            MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
        end;
      end;
    if (PubACol >= 9) and ((PubARow >= 3) and (PubARow <= 5)) then
    begin
      aDxCell.aRow := 6;
      aDxCell.aCol := 2;
      aHjCell.aRow := 6;
      aHjCell.aCol := 9;
      aBeginCell.aRow := 3;
      aBeginCell.aCol := 9;
      AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
    end;
  end;
  if CurrentFP = 'FP02' then
    if (PubACol >= 8) and ((PubARow >= 3) and (PubARow <= 6)) then
    begin
      aDxCell.aRow := 7;
      aDxCell.aCol := 2;
      aHjCell.aRow := 7;
      aHjCell.aCol := 8;
      aBeginCell.aRow := 3;
      aBeginCell.aCol := 8;
      AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
    end;
  if CurrentFP = 'FP03' then
    if (PubACol >= 7) and (PubACol <= 10) and ((PubARow >= 3) and (PubARow <= 6)) then
    begin
      aDxCell.aRow := 6;
      aDxCell.aCol := 3;
      aHjCell.aRow := 6;
      aHjCell.aCol := 7;
      aBeginCell.aRow := 3;
      aBeginCell.aCol := 7;
      AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
    end;
  if CurrentFP = 'FP04' then
    if (PubACol >= 9) and (PubACol <= 12) and ((PubARow >= 2) and (PubARow <= 4)) then
    begin
      aDxCell.aRow := 5;
      aDxCell.aCol := 3;
      aHjCell.aRow := 5;
      aHjCell.aCol := 9;
      aBeginCell.aRow := 2;
      aBeginCell.aCol := 9;
      AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
    end;
  if CurrentFP = 'FP05' then
    if (PubACol >= 9) and (PubACol <= 12) and ((PubARow >= 6) and (PubARow <= 8)) then
    begin
      aDxCell.aRow := 9;
      aDxCell.aCol := 3;
      aHjCell.aRow := 9;
      aHjCell.aCol := 9;
      aBeginCell.aRow := 6;
      aBeginCell.aCol := 9;
      AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
    end;
end;

procedure TMain.InVoiceTableKeyPress(Sender: TObject; var Key: Char);
var
  aStr: string;
  aPos: Integer;
  aDxCell, aHjCell, aBeginCell: TCustomCell;
begin
  if CurrentFP = 'FP01' then
  begin
    if (PubACol >= 9) and ((PubARow >= 3) and (PubARow <= 5)) then
    begin
      aPos := Pos('.', InVoiceTable.Cells[PubACol, PubARow]);
      if aPos > 0 then
        if not (Key in ['0'..'9', #9, #13]) then Key := #0
        else
          if not (Key in ['0'..'9', #9, #13, '.']) then Key := #0;
    end;
    if (Key = #13) then
    begin
      if (PubACol >= 9) and ((PubARow >= 3) and (PubARow <= 5)) then
      begin
        aDxCell.aRow := 6;
        aDxCell.aCol := 2;
        aHjCell.aRow := 6;
        aHjCell.aCol := 9;
        aBeginCell.aRow := 3;
        aBeginCell.aCol := 9;
        AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
      end;
      SendMessage(InVoiceTable.Handle, VK_RIGHT, VK_TAB, 0);
    end;
  end;
  if CurrentFP = 'FP02' then
  begin
    if (PubACol >= 8) and ((PubARow >= 3) and (PubARow <= 6)) then
    begin
      aPos := Pos('.', InVoiceTable.Cells[PubACol, PubARow]);
      if aPos > 0 then
        if not (Key in ['0'..'9', #9, #13]) then Key := #0
        else
          if not (Key in ['0'..'9', #9, #13, '.']) then Key := #0;
    end;
    if (Key = #13) then
    begin
      if (PubACol >= 8) and ((PubARow >= 3) and (PubARow <= 6)) then
      begin
        aDxCell.aRow := 7;
        aDxCell.aCol := 2;
        aHjCell.aRow := 7;
        aHjCell.aCol := 8;
        aBeginCell.aRow := 3;
        aBeginCell.aCol := 8;
        AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
      end;
      SendMessage(InVoiceTable.Handle, VK_RIGHT, VK_TAB, 0);
    end;
  end;
  if CurrentFP = 'FP03' then
  begin
    if (PubACol >= 7) and ((PubARow >= 3) and (PubARow <= 6)) then
    begin
      aPos := Pos('.', InVoiceTable.Cells[PubACol, PubARow]);
      if aPos > 0 then
        if not (Key in ['0'..'9', #9, #13]) then Key := #0
        else
          if not (Key in ['0'..'9', #9, #13, '.']) then Key := #0;
    end;
    if (Key = #13) then
    begin
      if (PubACol >= 7) and (PubACol <= 10) and ((PubARow >= 3) and (PubARow <= 6)) then
      begin
        aDxCell.aRow := 6;
        aDxCell.aCol := 3;
        aHjCell.aRow := 6;
        aHjCell.aCol := 7;
        aBeginCell.aRow := 3;
        aBeginCell.aCol := 7;
        AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
      end;
      SendMessage(InVoiceTable.Handle, VK_RIGHT, VK_TAB, 0);
    end;
  end;
  if CurrentFP = 'FP04' then
  begin
      if (PubACol >= 9) and (PubACol <= 12) and ((PubARow >= 2) and (PubARow <=4)) then
    begin                             
      aPos := Pos('.', InVoiceTable.Cells[PubACol, PubARow]);
      if aPos > 0 then
        if not (Key in ['0'..'9', #9, #13]) then Key := #0
        else
          if not (Key in ['0'..'9', #9, #13, '.']) then Key := #0;
    end;
    if (Key = #13) then
    begin
      if (PubACol >= 9) and (PubACol <= 12) and ((PubARow >= 2) and (PubARow <=4)) then
      begin
        aDxCell.aRow := 5;
        aDxCell.aCol := 3;
        aHjCell.aRow := 5;
        aHjCell.aCol := 9;
        aBeginCell.aRow := 2;
        aBeginCell.aCol := 9;
        AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
      end;
      SendMessage(InVoiceTable.Handle, VK_RIGHT, VK_TAB, 0);
    end;
  end;
  if CurrentFP = 'FP05' then
  begin
    if (PubACol >= 9) and (PubACol <= 12) and ((PubARow >= 6) and (PubARow <=8)) then
    begin                             
      aPos := Pos('.', InVoiceTable.Cells[PubACol, PubARow]);
      if aPos > 0 then
        if not (Key in ['0'..'9', #9, #13]) then Key := #0
        else
          if not (Key in ['0'..'9', #9, #13, '.']) then Key := #0;
    end;
    if (Key = #13) then
    begin
      if (PubACol >= 9) and (PubACol <= 12) and ((PubARow >= 6) and (PubARow <=8)) then
      begin
        aDxCell.aRow := 9;
        aDxCell.aCol := 3;
        aHjCell.aRow := 9;
        aHjCell.aCol := 9;
        aBeginCell.aRow := 6;
        aBeginCell.aCol := 9;
        AutoComputer(aDxCell, aHjCell, aBeginCell, 3);
      end;
      SendMessage(InVoiceTable.Handle, VK_RIGHT, VK_TAB, 0);
    end;
  end;
end;

procedure TMain.InVoiceTableGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if CurrentFP = 'FP01' then
  begin
    if ((ACol = 5) or (ACol = 7) or (ACol = 8)) and ((ARow >= 3) or (ARow <= 6)) then
      AEditor := edNumeric;
  end;
  if CurrentFP = 'FP02' then
  begin
    if ((ACol = 6) or (ACol = 7)) and ((ARow >= 3) or (ARow <= 6)) then
      AEditor := edNumeric;
  end;
end;

procedure TMain.SaveFP01;
var
  FMax: Integer;
  i, s: integer;
begin
  with DataModule1 do
  begin
    try
      ADOTableTax.TableName := 'TaxZly';
      ADOTableTax.Open;
      ADOTableTax.First;
      for i := 3 to 5 do
      begin
        if InVoiceTable.Cells[0, i] = '' then
        begin
          Inc(s);
          Continue;
        end
        else
        begin
          with ADOTableTax do
          begin
            Append;
            FMax := GetMax('Select Max(ID) From TaxZly');
            FieldByName('ID').AsInteger := FMax + 1;
            FieldByName('发票号码').AsString := AdvEdit3.Text;
            FieldByName('承租方').AsString := AdvEdit4.Text;
            FieldByName('客户名称').AsString := AdvEdit5.Text;
            FieldByName('客户编码').AsString := AdvEdit6.Text;
            FieldByName('开票日期').AsDateTime := cxDateEdit1.Date;
            if InVoiceTable.Cells[0, i] <> '' then
              FieldByName('租赁项目').AsString := InVoiceTable.Cells[0, i];
            if InVoiceTable.Cells[2, i] <> '' then
              FieldByName('开始日期').AsDateTime := StrToDate(InVoiceTable.Cells[
                2, I]);
            if InVoiceTable.Cells[4, i] <> '' then
              FieldByName('停止日期').AsDateTime := StrToDate(InVoiceTable.Cells[
                4, I]);
            if InVoiceTable.Cells[5, i] <> '' then
              FieldByName('天数').AsInteger := StrToInt(InVoiceTable.Cells[5, i]);
            if InVoiceTable.Cells[6, i] <> '' then
              FieldByName('单位').AsString := InVoiceTable.Cells[6, i];
            if InVoiceTable.Cells[7, i] <> '' then
              FieldByName('数量').AsInteger := StrToInt(InVoiceTable.Cells[7, i]);
            if InVoiceTable.Cells[8, i] <> '' then
              FieldByName('收费标准').AsInteger := StrToInt(InVoiceTable.Cells[8,
                i]);
            if InVoiceTable.Cells[9, i] <> '' then
              FieldByName('金额').AsCurrency := StrToCurr(InVoiceTable.Cells[9,
                i]);
            if InVoiceTable.Cells[2, 6] <> '' then
              FieldByName('金额大写').AsString := InVoiceTable.Cells[2, 6];
            if InVoiceTable.Cells[9, 6] <> '' then
              FieldByName('金额合计').AsCurrency := StrToCurr(InVoiceTable.Cells[9,
                6]);
            if InVoiceTable.Cells[6, 9] <> '' then
              FieldByName('开票人').AsString := InVoiceTable.Cells[6, 9];
            if InVoiceTable.Cells[10, 9] <> '' then
              FieldByName('收款人').AsString := InVoiceTable.Cells[10, 9];
            if InVoiceTable.Cells[2, 7] <> '' then
              FieldByName('备注').AsString := InVoiceTable.Cells[2, 7];
            Post;
          end;
        end;
      end;
      if s = 3 then
        Application.MessageBox('数据只能填写三行!!', '贝壳提示', MB_OK +
          MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST)
      else
      begin
        if WorksFlags <> 3 then 
                                   
          Application.MessageBox('保存成功!', '贝壳提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST);
        ADOTableTax.Close;
        SpeedButton15.Enabled := False;
        SpeedButton20.Enabled := True;
        
        
      end;
    except
      Application.MessageBox('保存错误！', '贝壳提示', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON3 + MB_TOPMOST);
      ADOTableTax.Close;            
    end;
  end;
end;

procedure TMain.ShowInitialization;
var
  aStr: string;
begin
  WorksFlags := 1;
  AppPath := ExtractFilePath(ParamStr(0));

  MainBrower.Navigate(HttpURL+'web/left.htm');

  Application.ProcessMessages;
  CurrentFP := 'FP01';
  NowDate := Now;
  cxDateEdit1.Date := NowDate;
  SpeedButton4.Enabled := True;
  SpeedButton6.Enabled := True;
  SpeedButton15.Enabled := True;
  InVoiceTable.Col := 5;
  InVoiceTable.Row := 5;
  StatusBar1.Panels[3].Text:=CurrenUser;
  DrawFP01;
  AdvEdit1.Text:='100000001';
  cxButton5.Click;
end;

procedure TMain.SpeedButton15Click(Sender: TObject);
begin
  if CurrentFP = 'FP01' then
  begin
    if not CheckOut then 
    else
      if WorksFlags = 3 then
      begin
        UpdateFP('TaxZly'); 
      end
      else
      begin
        SaveFP01; 
        SpeedButton20.Enabled := False;
      end;
    WorksFlags := 1;
    TaxPubReadOnly := True;
  end;
  if CurrentFP = 'FP02' then
  begin
    if not CheckOut then 
    else
      if WorksFlags = 3 then
      begin
        UpdateFP('TaxJzy'); 
      end
      else
      begin
        SaveFP02; 
        SpeedButton20.Enabled := False;
      end;
    WorksFlags := 1;
    TaxPubReadOnly := True;
  end;
  if CurrentFP = 'FP03' then
  begin
    if not CheckOut then 
    else
      if WorksFlags = 3 then
      begin
        UpdateFP('TaxGdzc'); 
      end
      else
      begin
        SaveFP03; 
        SpeedButton20.Enabled := False;
      end;
    WorksFlags := 1;
    TaxPubReadOnly := True;
  end;
  if CurrentFP = 'FP04' then
  begin
    if not CheckOut then 
    else
      if WorksFlags = 3 then
      begin
        UpdateFP('TaxFwhy'); 
      end
      else
      begin
        SaveFP04; 
        SpeedButton20.Enabled := False;
      end;
    WorksFlags := 1;
    TaxPubReadOnly := True;
  end;
  if CurrentFP = 'FP05' then
  begin
    if not CheckOut then 
    else
      if WorksFlags = 3 then
      begin
        UpdateFP('TaxWxzc'); 
      end
      else
      begin
        SaveFP05; 
        SpeedButton20.Enabled := False;
      end;
    WorksFlags := 1;
    TaxPubReadOnly := True;
  end;  
end;

function TMain.CheckOut: Boolean;
begin
  Result := True;
  if Length(Trim(AdvEdit3.Text)) < 8 then
  begin
    Application.MessageBox('发票号码不能小于八位 !   ', '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    AdvEdit3.SetFocus;
    Result := False;
    Exit;
  end;
  if Trim(AdvEdit4.Text) = '' then
  begin
    Application.MessageBox(PChar('请输入' + Label9.Caption + ' !   '), '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    AdvEdit4.SetFocus;
    Result := False;
    Exit;
  end;
  if Trim(AdvEdit5.Text) = '' then
  begin
    Application.MessageBox('请输入发票号码,且不能重复 !   ', '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    AdvEdit5.SetFocus;
    Result := False;
    Exit;
  end;
  if Length(Trim(AdvEdit6.Text)) <> 5 then
  begin
    Application.MessageBox('客户编码为五位 !   ', '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    AdvEdit6.SetFocus;
    Result := False;
    Exit;
  end;
  if AdvEdit7.Enabled then
  begin
    Application.MessageBox(Pchar(Label4.caption + '错误!  '), '贝壳提示', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    AdvEdit7.SetFocus;
    Result := False;
    Exit;
  end;
end;

function TMain.GetMax(aSql: string): Integer;
begin
  with DataModule1.ADOOther do
  begin
    try
      SQL.Clear;
      SQL.Add(aSql);
      Open;
      Result := Fields[0].AsInteger;
    except
      Application.MessageBox('获取数据库最大ID值失败！', '贝壳提示', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      Result := 0;
    end;
  end;
end;

procedure TMain.AdvEdit3Exit(Sender: TObject);
begin
  if WorksFlags = 3 then
    Exit;







  with DataModule1 do
  begin
    ADOOther.SQL.Clear;
    ADOOther.SQL.Add('Select * from TaxZly Where 发票号码=' +
      QuotedStr(AdvEdit3.Text));
    ADOOther.Open;
    if not ADOOther.Eof then
    begin
      Application.MessageBox('对不起,数据库中已存在此发票！', '贝壳提示',
        MB_OK + MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      AdvEdit3.Text := '';
      AdvEdit3.SetFocus;
    end;
  end;
end;

procedure TMain.ClearEdit;
begin
  AdvEdit3.Clear;
  AdvEdit4.Clear;
  AdvEdit5.Clear;
  AdvEdit6.Clear;
  AdvEdit7.Clear;
end;

procedure TMain.AutoComputer(DxCell, HjCell, BeginCell: TCustomCell; aIndex: Integer); 

var
  i: Integer;
  aSum: Double;
begin
  for i := BeginCell.aRow to (BeginCell.aRow + aIndex - 1) do
  begin
    if InVoiceTable.Cells[9, i] <> '' then
      aSum := aSum + StrToFloat(InVoiceTable.Cells[9, i]);
  end;
  InVoiceTable.Cells[DxCell.aCol, DxCell.aRow] := NtoC(aSum);
  InVoiceTable.Cells[HjCell.aCol, HjCell.aRow] := FloatToStr(aSum);
end;

procedure TMain.InVoiceTableSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  PubACol := ACol;
  PubARow := ARow;
end;

function TMain.SelectFP01(aText: string): Boolean;
var
  aSql: string;
  i: Integer;
begin
  i := 3;
  Result := True;
  with DataModule1.ADOSelect do
  begin
    SQL.Clear;
    aSql := 'Select * From TaxZly Where 发票号码=' + QuotedStr(aText);
    SQL.Add(aSql);
    Open;
    if RecordCount <= 0 then
    begin
      Application.MessageBox('数据库中无此发票！  ', '贝壳提示', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      AdvEdit1.Clear;
      advedit1.SetFocus;
      Result := False;
      Exit;
    end;
    try
      while not Eof do
      begin
        if i > 6 then
          Exit;
        if i = 3 then
        begin
          cxDateEdit1.Date := FieldByName('开票日期').AsDateTime;
          AdvEdit3.Text := FieldByName('发票号码').AsString;
          AdvEdit4.Text := FieldByName('承租方').AsString;
          AdvEdit5.Text := FieldByName('客户名称').AsString;
          AdvEdit6.Text := FieldByName('客户编码').AsString;
          InVoiceTable.Cells[2, 6] := FieldByName('金额大写').AsString;
          InVoiceTable.Cells[9, 6] := CurrToStr(FieldByName('金额合计').AsCurrency);
          InVoiceTable.Cells[6, 9] := FieldByName('开票人').AsString;
          InVoiceTable.Cells[10, 9] := FieldByName('收款人').AsString;
          InVoiceTable.Cells[2, 7] := FieldByName('备注').AsString;
        end;
        InVoiceTable.Cells[0, i] := FieldByName('租赁项目').AsString;
        InVoiceTable.Cells[2, i] := DateToStr(FieldByName('开始日期').AsDateTime);
        InVoiceTable.Cells[4, i] := DateToStr(FieldByName('停止日期').AsDateTime);
        InVoiceTable.Cells[5, i] := IntToStr(FieldByName('天数').AsInteger);
        InVoiceTable.Cells[6, i] := FieldByName('单位').AsString;
        InVoiceTable.Cells[7, i] := IntToStr(FieldByName('数量').AsInteger);
        InVoiceTable.Cells[8, i] := IntToStr(FieldByName('收费标准').AsInteger);
        InVoiceTable.Cells[9, i] := CurrToStr(FieldByName('金额').AsCurrency);
        Inc(i);
        Next;
      end;
    except
      Result:=false;
    end;
  end;
end;

procedure TMain.SpeedButton4Click(Sender: TObject);
var
  i: Integer;
begin
  cxDateEdit1.Date := NowDate;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TAdvEdit then
    begin
      TAdvEdit(Components[i]).Clear;
      TAdvEdit(Components[i]).ReadOnly := False;
    end;
  end;
  InVoiceTable.DefaultRowHeight := 21;
  InVoiceTable.DefaultColWidth := 44;
  SpeedButton15.Enabled := True;
  SpeedButton20.Enabled := False;
  TaxPubReadOnly := False;
  InVoiceTable.Clear;
  if CurrentFP = 'FP01' then
  begin
    DrawFP01;
  end;
  if CurrentFP = 'FP02' then
  begin
    DrawFP02;
  end;
  if CurrentFP = 'FP03' then
  begin
    DrawFP03;
  end;
  if CurrentFP = 'FP04' then
  begin
    DrawFP04;
  end;
  if CurrentFP = 'FP05' then
  begin
    DrawFP05;
  end;
end;

procedure TMain.AdvEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8, #22, #24, #9]) then Key := #0;
  if Key = #13 then
    cxButton5.Click;
end;

procedure TMain.SpeedButton20Click(Sender: TObject);
var
  i: Integer;
begin
  cxDateEdit1.Date := NowDate;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TAdvEdit then
      TAdvEdit(Components[i]).ReadOnly := False;
  end;
  SpeedButton15.Enabled := True;
  SpeedButton20.Enabled := False;
  AdvEdit3.ReadOnly := True;
  TaxPubReadOnly := False;
  WorksFlags := 3;
end;

procedure TMain.AdvEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8, #22, #9]) then Key := #0;
end;

procedure TMain.AdvEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8, #22, #24, #9]) then Key := #0;
  if Key = #13 then
    AdvEdit4.SetFocus;
end;

procedure TMain.UpdateFP(aTable: string);
var
  aSQL: string;
begin
  with DataModule1.ADOSelect do
  begin
    SQL.Clear;
    aSQL := 'Delete From ' + aTable + ' Where 发票号码=' + QuotedStr(AdvEdit3.Text);
    SQL.Add(aSQL);
    ExecSQL;
    if aTable = 'TaxZly' then
      SaveFP01; 
    if aTable = 'TaxJzy' then
      SaveFP02; 
    if aTable = 'TaxGdzc' then
      SaveFP03; 
    if aTable = 'TaxFwhy' then
      SaveFP04; 
    if aTable = 'TaxWxzc' then
      SaveFP05; 
    Application.MessageBox('更新成功！  ', '贝壳提示', MB_OK + MB_ICONWARNING
      + MB_DEFBUTTON3 + MB_TOPMOST);
  end;
end;

procedure TMain.AdvEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    AdvEdit5.SetFocus;
end;

procedure TMain.AdvEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    AdvEdit6.SetFocus;
end;

procedure TMain.cxDateEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    AdvEdit3.SetFocus;
end;

procedure TMain.N10Click(Sender: TObject);
begin
  Close;
end;

procedure TMain.SpeedButton6Click(Sender: TObject);
begin
  if CurrentFP = 'FP01' then
  begin
    aPrintForm := TPitPw.Create(Application);
    PrintFP01;
    aPrintForm.ShowModal;
  end;
  if CurrentFP = 'FP02' then
  begin
    aPrintForm := TPitPw.Create(Application);
    PrintFP02;
    aPrintForm.ShowModal;
  end;
  if CurrentFP = 'FP03' then
  begin
    aPrintForm := TPitPw.Create(Application);
    PrintFP03;
    aPrintForm.ShowModal;
  end;
  if CurrentFP = 'FP04' then
  begin
    aPrintForm := TPitPw.Create(Application);
    PrintFP04;
    aPrintForm.ShowModal;
  end;
  if CurrentFP = 'FP05' then
  begin
    aPrintForm := TPitPw.Create(Application);
    PrintFP05;
    aPrintForm.ShowModal;
  end;  
end;


procedure TMain.PrintFP02;
var
  CurrentIndex: Integer;
  aTmpFont: TFont;
  DrawMoneyCp, DrawMoney, DrawOne: string;
  i, j, THeight, TWidth: Integer;
begin
  with aPrintForm.Image1 do
  begin
    THeight := Canvas.TextHeight('1');
    aTmpFont := Canvas.Font;
    with Canvas do
    begin
      TextOut(500, 20, BKString);
      Font.Size := 14;
      Font.Name := '宋体';
      Font.Style := [fsBold];
      TextOut(250, 20, '建 筑 业 发 票');
      Font.Size := 10;
      Font.Name := '宋体';
      Font.Color := $004080FF;
      Font.Style := Font.Style - [fsBold];
    
      TextOut(370, 60, '开票日期：'); 
      TextOut(430, 60, DateToStr(cxDateEdit1.Date));
      TextOut(510, 60, '发票号码：'); 
      TextOut(570, 60, AdvEdit3.Text);
      TextOut(20, 80, '付款单位：'); 
      TextOut(80, 80, AdvEdit4.Text);
      TextOut(280, 80, '客户名称：'); 
      TextOut(340, 80, AdvEdit5.Text);
      TextOut(510, 80, '发票号码：'); 
      TextOut(570, 80, AdvEdit6.Text);

      Pen.Color := clBackground;
      MoveTo(430, 60 + THeight); 
      LineTo(500, 60 + THeight);

      MoveTo(570, 60 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 60 + THeight);

      MoveTo(80, 80 + THeight);
      LineTo(80 + TextWidth(AdvEdit4.Text), 80 + THeight);

      MoveTo(340, 80 + THeight);
      LineTo(500, 80 + THeight);

      MoveTo(570, 80 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 80 + THeight);

      MoveTo(20, 100); LineTo(650, 100); 
      MoveTo(20, 100); LineTo(20, 295); 
      MoveTo(650, 100); LineTo(650, 295); 
      MoveTo(20, 130); LineTo(650, 130);
      MoveTo(430, 150); LineTo(650, 150);
      MoveTo(20, 170); LineTo(600, 170);
      for i := 1 to 4 do
      begin
        MoveTo(20, (170 + i * 20)); LineTo(600, (170 + i * 20));
      end;
      MoveTo(20, 275); LineTo(600, 275);
      MoveTo(20, 295); LineTo(650, 295);

      MoveTo(100, 100); LineTo(100, 130);
      MoveTo(230, 100); LineTo(230, 130);
      MoveTo(300, 100); LineTo(300, 130);
      MoveTo(430, 100); LineTo(430, 130);
      MoveTo(500, 100); LineTo(500, 130);
      TextOut(30, 110, '工程名称');
      TextOut(240, 110, '工程类别');
      TextOut(440, 110, '施工地点');
      TWidth := 100 - 2 + (230 - 100 - (TextWidth('杨') * Length(InVoiceTable.Cells[1, 0]) div 2)) div 2;
      TextOut(TWidth, 110, InVoiceTable.Cells[1, 0]);
      TWidth := 300 - 2 + (430 - 300 - (TextWidth('杨') * Length(InVoiceTable.Cells[6, 0]) div 2)) div 2;
      TextOut(TWidth, 110, InVoiceTable.Cells[6, 0]);
      TWidth := 500 - 2 + (650 - 500 - (TextWidth('杨') * Length(InVoiceTable.Cells[10, 0]) div 2)) div 2;
      TextOut(TWidth, 110, InVoiceTable.Cells[10, 0]);

      MoveTo(130, 130); LineTo(130, 275);
      MoveTo(300, 130); LineTo(300, 250);
      MoveTo(365, 130); LineTo(365, 250);
      MoveTo(430, 130); LineTo(430, 295);

      for i := 1 to 11 do
      begin
        if i = 2 then
          Pen.Color := clRed
        else
          Pen.Color := clBackground;
        if i <> 11 then
        begin
          MoveTo(600 - (20 * I) + 5 * i, 150);
          LineTo(600 - (20 * I) + 5 * i, 275);
        end;
        CurrentIndex := (12 - i + 1);
        DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
        TextOut(587 - (20 * i - 5 * i) + 15, 155, DrawMoneyCp);
      end;
      for i := 0 to 4 do
      begin
        if i <> 4 then
        begin
          TWidth := 20 + (130 - 20 - (TextWidth('杨') * Length(InVoiceTable.Cells[0, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 175 + i * 20, InVoiceTable.Cells[0, 3 + i]);
          TWidth := 130 + (300 - 130 - (TextWidth('杨') * Length(InVoiceTable.Cells[2, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 175 + i * 20, InVoiceTable.Cells[2, 3 + i]);
          TWidth := 300 - 2 + (365 - 300 - (TextWidth('杨') * Length(InVoiceTable.Cells[6, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 175 + i * 20, InVoiceTable.Cells[6, 3 + i]);
          TWidth := 365 - 2 + (430 - 365 - (TextWidth('杨') * Length(InVoiceTable.Cells[7, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 175 + i * 20, InVoiceTable.Cells[7, 3 + i]);
        end;
        DrawMoney := InVoiceTable.Cells[9, 3 + i];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        for J := 1 to 12 do
        begin
          TWidth := TextWidth('1') + 8;
          if J > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - J + 1, 1);
          TextOut(587 - (20 * j - 5 * j) + 15, 175 + i * 20, DrawOne);
        end;
      end;
      MoveTo(600, 130); LineTo(600, 295);
      TextOut(25, 140, '工程项目及其内容');
      TextOut(190, 140, '单    位');
      TextOut(315, 140, '数 量');
      TextOut(380, 140, '单 价');
      TextOut(490, 135, '金     额');
      TextOut(605, 137, '备 注');

      TextOut(30, 255, '金额合计(大写)');
      TWidth := 130 - 2 + (430 - 130 - (TextWidth('杨') * Length(InVoiceTable.Cells[2, 7]) div 2)) div 2;
      TextOut(TWidth, 255, InVoiceTable.Cells[2, 7]);

      MoveTo(170, 275); LineTo(170, 295);
      MoveTo(300, 275); LineTo(300, 295);
      MoveTo(520, 275); LineTo(520, 295);
      TextOut(40, 280, '开票单位(盖章有效)');
      TextOut(245, 280, '开票人：');
      TextOut(465, 280, '收款人：');
      TextOut(313, 280, InVoiceTable.Cells[6, 8]);
      TextOut(528, 280, InVoiceTable.Cells[10, 8]);

      TextOut(50, 300, ' 按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能');
      TextOut(50, 315, '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》');
      TextOut(50, 330, '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开');
      TextOut(50, 345, '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。');
    end;
  end;
end;

procedure TMain.PrintFP01;
var
  CurrentIndex: Integer;
  aTmpFont: TFont;
  DrawMoneyCp, DrawMoney, DrawOne: string;
  i, j, THeight, TWidth: Integer;
begin
  with aPrintForm.Image1 do
  begin
    THeight := Canvas.TextHeight('1');
    aTmpFont := Canvas.Font;
    with Canvas do
    begin
      TextOut(500, 20, BKString);
      Font.Size := 14;
      Font.Name := '宋体';
      Font.Style := [fsBold];
      TextOut(250, 20, '租 赁 业 发 票');
      Font.Size := 10;
      Font.Name := '宋体';
      Font.Color := $004080FF;
      Font.Style := Font.Style - [fsBold];
    
      TextOut(370, 60, '开票日期：'); 
      TextOut(430, 60, DateToStr(cxDateEdit1.Date));
      TextOut(510, 60, '发票号码：'); 
      TextOut(570, 60, AdvEdit3.Text);
      TextOut(20, 80, '承租方：'); 
      TextOut(65, 80, AdvEdit4.Text);
      TextOut(280, 80, '客户名称：'); 
      TextOut(340, 80, AdvEdit5.Text);
      TextOut(510, 80, '发票号码：'); 
      TextOut(570, 80, AdvEdit6.Text);

      Pen.Color := clBackground;
      MoveTo(430, 60 + THeight); 
      LineTo(500, 60 + THeight);

      MoveTo(570, 60 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 60 + THeight);

      MoveTo(65, 80 + THeight);
      LineTo(65 + TextWidth(AdvEdit4.Text), 80 + THeight);

      MoveTo(340, 80 + THeight);
      LineTo(500, 80 + THeight);

      MoveTo(570, 80 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 80 + THeight);

    
      MoveTo(20, 100); LineTo(650, 100); 
      MoveTo(20, 100); LineTo(20, 290); 
      MoveTo(650, 100); LineTo(650, 290); 
      MoveTo(20, 160); LineTo(650, 160);
      MoveTo(110, 120); LineTo(300, 120);
      MoveTo(110, 140); LineTo(260, 140);
      MoveTo(430, 120); LineTo(650, 120);

      MoveTo(110, 100); LineTo(110, 270);
      MoveTo(185, 120); LineTo(185, 220);
      MoveTo(260, 120); LineTo(260, 220);
      MoveTo(300, 100); LineTo(300, 220);
      MoveTo(340, 100); LineTo(340, 220);
      MoveTo(380, 100); LineTo(380, 220);
      MoveTo(430, 100); LineTo(430, 220);

      MoveTo(20, 240); LineTo(650, 240);
      MoveTo(20, 270); LineTo(650, 270);
      MoveTo(20, 290); LineTo(650, 290);

      MoveTo(160, 270); LineTo(160, 290);
      MoveTo(280, 270); LineTo(280, 290);
      MoveTo(410, 270); LineTo(410, 290);
      MoveTo(530, 270); LineTo(530, 290);

      for i := 1 to 3 do
      begin
        MoveTo(20, 160 + i * 20); LineTo(650, 160 + i * 20);
      end;
      
      TextOut(30, 125, '租 赁 项 目');
      TextOut(158, 105, '租 赁 日 期');
      TextOut(135, 125, '起');
      TextOut(195, 125, '止');
      TextOut(115, 145, '年 月 日');
      TextOut(195, 145, '年 月 日');
      TextOut(265, 135, '天 数');
      TextOut(302, 125, '单 位');
      TextOut(345, 125, '数 量');
      TextOut(390, 120, '收 费');
      TextOut(390, 135, '标 准');
      TextOut(510, 105, '金    额');
      for i := 1 to 11 do
      begin
        if i = 2 then
          Pen.Color := clRed
        else
          Pen.Color := clBackground;
        MoveTo(650 - 20 * I, 120); LineTo(650 - I * 20, 240);
        CurrentIndex := (12 - i + 1);
        DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
        TextOut(650 - (20 * i - 5), 135, DrawMoneyCp);
      end;
     

      for i := 0 to 3 do
      begin
        if i <> 3 then
        begin
          TWidth := 20 + (110 - 20 - (TextWidth('杨') * Length(InVoiceTable.Cells[0, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 165 + i * 20, InVoiceTable.Cells[0, 3 + i]);
          TWidth := 110 + (185 - 110 - (TextWidth('杨') * Length(InVoiceTable.Cells[2, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 165 + i * 20, InVoiceTable.Cells[2, 3 + i]);
          TWidth := 185 - 2 + (260 - 185 - (TextWidth('杨') * Length(InVoiceTable.Cells[4, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 165 + i * 20, InVoiceTable.Cells[4, 3 + i]);
          TWidth := 260 - 2 + (300 - 260 - (TextWidth('杨') * Length(InVoiceTable.Cells[5, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 165 + i * 20, InVoiceTable.Cells[5, 3 + i]);
          TWidth := 300 - 2 + (340 - 300 - (TextWidth('杨') * Length(InVoiceTable.Cells[6, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 165 + i * 20, InVoiceTable.Cells[6, 3 + i]);
          TWidth := 340 - 2 + (380 - 340 - (TextWidth('杨') * Length(InVoiceTable.Cells[7, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 165 + i * 20, InVoiceTable.Cells[7, 3 + i]);
          TWidth := 380 - 2 + (430 - 380 - (TextWidth('杨') * Length(InVoiceTable.Cells[8, 3 + i]) div 2)) div 2;
          TextOut(TWidth, 165 + i * 20, InVoiceTable.Cells[8, 3 + i]);
        end;
        DrawMoney := InVoiceTable.Cells[9, 3 + i];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        for J := 1 to 12 do
        begin
          TWidth := TextWidth('1') + 8;
          if J > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - J + 1, 1);
          TextOut(650 - (20 * j - 5), 165 + i * 20, DrawOne);
        end;
      end;
      TextOut(23, 225, '金额合计|大写');
      TextOut(130, 225, InVoiceTable.Cells[2, 6]);
      TextOut(35, 250, '备    注');
      TextOut(130, 250, InVoiceTable.Cells[2, 7]);
      TextOut(38, 275, '出租方(盖章有效)');
      TextOut(230, 275, '开票人:');
      TextOut(290, 275, InVoiceTable.Cells[6, 9]);
      TextOut(480, 275, '收款人:');
      TextOut(540, 275, InVoiceTable.Cells[10, 9]);
      Font.Color := clBackground;
      TextOut(50, 300, ' 按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能');
      TextOut(50, 315, '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》');
      TextOut(50, 330, '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开');
      TextOut(50, 345, '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。');
    end;
  end;
end;

procedure TMain.DrawFP02;
var
  j, i: integer;
begin
  if CurrentFP = 'FP02' then
  begin
    label4.Caption := '其它内容：';
    Label2.Caption := '开票日期：';
    Label3.Caption := '发票号码：';
    Label9.Caption := '付款单位：';
    Label9.Left := 10;
    Label6.Caption := '客户名称：';
    Label8.Caption := '客户编码：';
    AdvEdit7.Enabled := False;
    Label10.Caption := '    ' +
      '按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能' +
      '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》' +
      '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开' +
      '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。';
    Label10.Visible := True;
    with InVoiceTable do
    begin
      RowCount := 10;
      WordWrap := False;
      RowHeights[0] := 33;
      ColWidths[0] := 68;
      MergeCells(1, 0, 3, 1);
      ColWidths[4] := 20;
      MergeCells(4, 0, 2, 1);
      MergeCells(6, 0, 2, 1);
      MergeCells(8, 0, 2, 1);
      MergeCells(10, 0, 3, 1);
      MergeCells(6, 0, 2, 1);
      MergeCells(10, 0, 3, 0);
      Cells[0, 0] := '工 程 名 称';
      Cells[4, 0] := '工 程 类 别';
      Cells[8, 0] := '施 工 地 点';
      RowHeights[1] := 20;
      MergeCells(0, 1, 2, 2);
      MergeCells(2, 1, 4, 2);
      MergeCells(6, 1, 1, 2);
      MergeCells(7, 1, 1, 2);
      MergeCells(8, 1, 4, 1);
      MergeCells(8, 2, 4, 1);
      Cells[0, 1] := '工程项目及其内容';
      Cells[2, 1] := '单     位';
      Cells[6, 1] := '数 量';
      Cells[7, 1] := '单 价';
      Cells[8, 1] := '金     额';
      Cells[12, 1] := '备 注';
      for i := 3 to 6 do
      begin
        MergeCells(0, i, 2, 1);
        MergeCells(2, i, 4, 1);
        MergeCells(8, i, 4, 1);
      end;
      MergeCells(0, 7, 2, 1);
      MergeCells(2, 7, 6, 1);
      MergeCells(8, 7, 4, 1);
      Cells[0, 7] := '金额大写(合计)';
      RowHeights[7] := 25;
      Alignments[0, 7] := taCenter;
      MergeCells(0, 8, 3, 1);
      MergeCells(3, 8, 3, 1);
      MergeCells(6, 8, 2, 1);
      MergeCells(8, 8, 2, 1);
      MergeCells(10, 8, 2, 1);
      MergeCells(0, 9, 13, 1);
      MergeCells(12, 2, 1, 7);
      Cells[0, 8] := '开票单位(盖章有效)';
      Cells[3, 8] := '开票人：';
      Cells[8, 8] := '收款人：';
      for i := 0 to ColCount - 1 do
        for j := 0 to 2 do
        begin
          Alignments[i, j] := taCenter;
        end;
      for i := 0 to ColCount - 1 do
        for j := 3 to 6 do
        begin
          Alignments[i, j] := taCenter;
        end;
     
      GridLineColor := 8684164;
      Colors[0, 0] := 16761798;
      Colors[4, 0] := 16761798;
      Colors[8, 0] := 16761798;
      RowColor[1] := 16761798;
      Colors[0, 7] := 16761798;
      Colors[0, 8] := 16761798;
      Colors[3, 8] := 16761798;
      Colors[8, 8] := 16761798;
      Colors[8, 7] := 16761798;
      Colors[1, 0] := 13041663;
      Colors[6, 0] := 13041663;
      Colors[10, 0] := 13041663;
      Colors[6, 8] := 13041663;
      Colors[10, 8] := 13041663;
      Colors[12, 2] := 13041663;
      Colors[2, 7] := 15204327;
      for i := 2 to 6 do
        for j := 0 to 12 do
          Colors[j, i] := 13041663;
    
      Label10.Top := 252 - 7;
      Alignments[0, 8] := taCenter;
      Alignments[3, 8] := taRightJustify;
      Alignments[8, 8] := taRightJustify;
      BKTitle.Alignment := taCenter;
      RichToCell(0, 9, BKTitle);
      VAlignment := vtaCenter;
    end;
  end;
end;

procedure TMain.SaveFP02;
var
  FMax: Integer;
  i, s: integer;
begin
  with DataModule1 do
  begin
    try
      ADOTableTax.TableName := 'TaxJzy';
      ADOTableTax.Open;
      ADOTableTax.First;
      for i := 3 to 6 do
      begin
        if (InVoiceTable.Cells[1, 0] = '') or (InVoiceTable.Cells[6, 0] = '')
          or (InVoiceTable.Cells[10, 0] = '') then
        begin
          Inc(s);
          Continue;
        end
        else
        begin
          with ADOTableTax do
          begin
            Append;
            FMax := GetMax('Select Max(ID) From TaxJzy');
            FieldByName('ID').AsInteger := FMax + 1;
            FieldByName('发票号码').AsString := AdvEdit3.Text;
            FieldByName('付款单位').AsString := AdvEdit4.Text;
            FieldByName('客户名称').AsString := AdvEdit5.Text;
            FieldByName('客户编码').AsString := AdvEdit6.Text;
            FieldByName('开票日期').AsDateTime := cxDateEdit1.Date;
            if InVoiceTable.Cells[1, 0] <> '' then
              FieldByName('工程名称').AsString := InVoiceTable.Cells[1, 0];
            if InVoiceTable.Cells[6, 0] <> '' then
              FieldByName('工程类别').AsString := InVoiceTable.Cells[6, 0];
            if InVoiceTable.Cells[10, 0] <> '' then
              FieldByName('施工地点').AsString := InVoiceTable.Cells[10, 0];
            if InVoiceTable.Cells[0, i] <> '' then
              FieldByName('工程项目').AsString := InVoiceTable.Cells[0, i];
            if InVoiceTable.Cells[2, i] <> '' then
              FieldByName('单位').AsString := InVoiceTable.Cells[2, i];
            if InVoiceTable.Cells[6, i] <> '' then
              FieldByName('数量').AsInteger := StrToInt(InVoiceTable.Cells[6, i]);
            if InVoiceTable.Cells[7, i] <> '' then
              FieldByName('单价').AsInteger := StrToInt(InVoiceTable.Cells[7, i]);
            if InVoiceTable.Cells[8, i] <> '' then
              FieldByName('金额').AsCurrency := StrToCurr(InVoiceTable.Cells[8, i]);
            if InVoiceTable.Cells[2, 7] <> '' then
              FieldByName('金额大写').AsString := InVoiceTable.Cells[2, 7];
            if InVoiceTable.Cells[8, 7] <> '' then
              FieldByName('金额合计').AsCurrency := StrToCurr(InVoiceTable.Cells[8,
                7]);
            if InVoiceTable.Cells[6, 8] <> '' then
              FieldByName('开票人').AsString := InVoiceTable.Cells[6, 8];
            if InVoiceTable.Cells[10, 8] <> '' then
              FieldByName('收款人').AsString := InVoiceTable.Cells[10, 8];
            if InVoiceTable.Cells[12, 2] <> '' then
              FieldByName('备注').AsString := InVoiceTable.Cells[12, 2];
            Post;
          end;
        end;
      end;
      if s = 4 then
        Application.MessageBox('数据只能填写四行!!', '贝壳提示', MB_OK +
          MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST)
      else
      begin
        if WorksFlags <> 3 then 
                                   
          Application.MessageBox('保存成功!', '贝壳提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST);
        ADOTableTax.Close;
        SpeedButton15.Enabled := False;
        SpeedButton20.Enabled := True;
        
        
      end;
    except
      Application.MessageBox('保存错误！', '贝壳提示', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON3 + MB_TOPMOST);
      ADOTableTax.Close;            
    end;
  end;
end;

function TMain.SelectFP02(aText: string): Boolean;
var
  aSql: string;
  i: Integer;
begin
  i := 3;
  Result := True;
  with DataModule1.ADOSelect do
  begin
    SQL.Clear;
    aSql := 'Select * From TaxJzy Where 发票号码=' + QuotedStr(aText);
    SQL.Add(aSql);
    Open;
    if RecordCount <= 0 then
    begin
      Application.MessageBox('数据库中无此发票！  ', '贝壳提示', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      AdvEdit1.Clear;
      advedit1.SetFocus;
      Result := False;
      Exit;
    end;
    try
      while not Eof do
      begin
        if i > 7 then
          Exit;
        if i = 3 then
        begin
          cxDateEdit1.Date := FieldByName('开票日期').AsDateTime;
          AdvEdit3.Text := FieldByName('发票号码').AsString;
          AdvEdit4.Text := FieldByName('付款单位').AsString;
          AdvEdit5.Text := FieldByName('客户名称').AsString;
          AdvEdit6.Text := FieldByName('客户编码').AsString;
          InVoiceTable.Cells[1, 0] := FieldByName('工程名称').AsString;
          InVoiceTable.Cells[6, 0] := FieldByName('工程类别').AsString;
          InVoiceTable.Cells[10, 0] := FieldByName('施工地点').AsString;
          InVoiceTable.Cells[2, 7] := FieldByName('金额大写').AsString;
          InVoiceTable.Cells[8, 7] := CurrToStr(FieldByName('金额合计').AsCurrency);
          InVoiceTable.Cells[6, 8] := FieldByName('开票人').AsString;
          InVoiceTable.Cells[10, 8] := FieldByName('收款人').AsString;
          InVoiceTable.Cells[12, 2] := FieldByName('备注').AsString;
        end;
        InVoiceTable.Cells[0, i] := FieldByName('工程项目').AsString;
        InVoiceTable.Cells[2, i] := FieldByName('单位').AsString;
        InVoiceTable.Cells[6, i] := IntToStr(FieldByName('数量').AsInteger);
        InVoiceTable.Cells[7, i] := IntToStr(FieldByName('单价').AsInteger);
        InVoiceTable.Cells[8, i] := CurrToStr(FieldByName('金额').AsCurrency);
        Inc(i);
        Next;
      end;
    except
      Result:=False;
    end;
  end;
end;


procedure TMain.SpeedButton12Click(Sender: TObject);
begin
  About:=TAbout.Create(Self);
  About.ShowModal;
end;

procedure TMain.DrawFP03;
var
  j, i: integer;
begin
  if CurrentFP = 'FP03' then
  begin
    label4.Caption := '其它内容：';
    Label2.Caption := '开票日期：';
    Label3.Caption := '发票号码：';
    Label9.Caption := '买方名称：';
    Label9.Left := 10;
    Label6.Caption := '客户名称：';
    Label8.Caption := '客户编码：';
    AdvEdit7.Enabled := False;
    Label10.Caption := '    ' +
      '按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能' +
      '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》' +
      '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开' +
      '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。';
    Label10.Visible := True;
    with InVoiceTable do
    begin
      RowCount := 9;
      WordWrap := False;
      RowHeights[0] := 33;
      ColWidths[2] := 20;
      MergeCells(0, 0, 3, 1);
      MergeCells(3, 0, 4, 1);
      MergeCells(7, 0, 2, 1);
      ColWidths[8] := 68;
      MergeCells(9, 0, 4, 1);
      Cells[0, 0] := '卖 方 名 称';
      Cells[7, 0] := '座 落 地 点';

      MergeCells(0, 1, 3, 2);
      MergeCells(3, 1, 2, 2);
      MergeCells(5, 1, 2, 2);
      MergeCells(7, 1, 4, 1);
      MergeCells(7, 2, 4, 1);
      MergeCells(11, 1, 2, 2);
      RowHeights[1] := 20;
      ColWidths[1] := 50;
      ColWidths[5] := 60;
      ColWidths[10] := 20;
      Cells[0, 1] := '项     目';
      Cells[3, 1] := '建  筑'#13'面  积M2';
      Cells[5, 1] := '单价(元 M2)';
      Cells[7, 1] := '金     额';
      Cells[11, 1] := '备   注';
      for i := 0 to ColCount - 1 do
        Alignments[i, 1] := taCenter;
      for i := 3 to 5 do
      begin
        MergeCells(0, i, 3, 1);
        MergeCells(3, i, 2, 1);
        MergeCells(5, i, 2, 1);
        MergeCells(7, i, 4, 1);
      end;
      MergeCells(0, 6, 3, 1);
      MergeCells(3, 6, 4, 1);
      MergeCells(7, 6, 4, 1);
      RowHeights[6] := 30;
      Cells[0, 6] := '合计人民币(大写)';
      MergeCells(0, 7, 3, 1);
      MergeCells(3, 7, 3, 1);
      MergeCells(6, 7, 2, 1);
      MergeCells(8, 7, 2, 1);
      MergeCells(10, 7, 3, 1);
      MergeCells(0, 8, 13, 1);
      Cells[0, 7] := '开票单位(盖章有效)';
      Cells[3, 7] := '开票人：';
      Cells[8, 7] := '收款人：';
      Alignments[0, 7] := taCenter;
      Alignments[3, 7] := taRightJustify;
      Alignments[8, 7] := taRightJustify;
      MergeCells(11, 3, 2, 4);
      for i := 0 to ColCount - 1 do
        for j := 0 to 2 do
        begin
          Alignments[i, j] := taCenter;
        end;
      for i := 3 to 5 do
        for j := 0 to 10 do
          Alignments[i, j] := taCenter;
      VAlignment := vtaCenter;
      for i := 3 to 5 do
        for j := 0 to 10 do
          Colors[j, i] := 13041663;
      RowColor[7] := 15204327;
      Colors[0, 0] := 15204327;
      Colors[7, 0] := 15204327;
      Colors[7, 2] := 15204327;
      Colors[3, 0] := 13041663;
      Colors[9, 0] := 13041663;
      Colors[6, 7] := 13041663;
      Colors[10, 7] := 13041663;
      Colors[11, 3] := 13041663;
      RowColor[1] := 15204327;
      RowColor[6] := 15204327;
    
      Label10.Top := 252 - 20;
      BKTitle.Alignment := taCenter;
      RichToCell(0, 8, BKTitle);
      VAlignment := vtaCenter;
    end;
  end;
end;

procedure TMain.SaveFP03;
var
  FMax: Integer;
  i, s: integer;
begin
  with DataModule1 do
  begin
    try
      ADOTableTax.TableName := 'TaxGdzc';
      ADOTableTax.Open;
      ADOTableTax.First;
      for i := 3 to 5 do
      begin
        if (InVoiceTable.Cells[3, 0] = '') or (InVoiceTable.Cells[9, 0] = '') then
        begin
          Inc(s);
          Continue;
        end
        else
        begin
          with ADOTableTax do
          begin
            Append;
            FMax := GetMax('Select Max(ID) From TaxGdzc');
            FieldByName('ID').AsInteger := FMax + 1;
            FieldByName('发票号码').AsString := AdvEdit3.Text;
            FieldByName('买方名称').AsString := AdvEdit4.Text;
            FieldByName('客户名称').AsString := AdvEdit5.Text;
            FieldByName('客户编码').AsString := AdvEdit6.Text;
            FieldByName('开票日期').AsDateTime := cxDateEdit1.Date;
            if InVoiceTable.Cells[3, 0] <> '' then
              FieldByName('卖方名称').AsString := InVoiceTable.Cells[3, 0];
            if InVoiceTable.Cells[9, 0] <> '' then
              FieldByName('座落地点').AsString := InVoiceTable.Cells[9, 0];
            if InVoiceTable.Cells[0, i] <> '' then
              FieldByName('项目').AsString := InVoiceTable.Cells[0, i];
            if InVoiceTable.Cells[3, i] <> '' then
              FieldByName('建筑面积').AsInteger := StrToInt(InVoiceTable.Cells[3, i]);
            if InVoiceTable.Cells[5, i] <> '' then
              FieldByName('单价').AsInteger := StrToInt(InVoiceTable.Cells[5, i]);
            if InVoiceTable.Cells[7, i] <> '' then
              FieldByName('金额').AsCurrency := StrToCurr(InVoiceTable.Cells[7, i]);
            if InVoiceTable.Cells[3, 6] <> '' then
              FieldByName('金额大写').AsString := InVoiceTable.Cells[3, 6];
            if InVoiceTable.Cells[7, 6] <> '' then
              FieldByName('金额合计').AsCurrency := StrToCurr(InVoiceTable.Cells[7, 6]);
            if InVoiceTable.Cells[6, 7] <> '' then
              FieldByName('开票人').AsString := InVoiceTable.Cells[6, 7];
            if InVoiceTable.Cells[10, 7] <> '' then
              FieldByName('收款人').AsString := InVoiceTable.Cells[10, 7];
            if InVoiceTable.Cells[11, 3] <> '' then
              FieldByName('备注').AsString := InVoiceTable.Cells[11, 3];
            Post;
          end;
        end;
      end;
      if s = 3 then
        Application.MessageBox('数据只能填写四行!!', '贝壳提示', MB_OK +
          MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST)
      else
      begin
        if WorksFlags <> 3 then 
                                   
          Application.MessageBox('保存成功!', '贝壳提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST);
        ADOTableTax.Close;
        SpeedButton15.Enabled := False;
        SpeedButton20.Enabled := True;
        
        
      end;
    except
      Application.MessageBox('保存错误！', '贝壳提示', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON3 + MB_TOPMOST);
      ADOTableTax.Close;        
    end;
  end;
end;

procedure TMain.cxButton5Click(Sender: TObject);
var
  i: Integer;
  bz: boolean;  
begin
  if CurrentFP = 'FP01' then
  begin
    bz:= SelectFP01(AdvEdit1.Text);
  end;
  if CurrentFP = 'FP02' then
  begin
     bz:= SelectFP02(AdvEdit1.Text);
  end;
  if CurrentFP = 'FP03' then
  begin
     bz:= SelectFP03(AdvEdit1.Text);
  end;
  if CurrentFP = 'FP04' then
  begin
     bz:= SelectFP04(AdvEdit1.Text);
  end;
  if CurrentFP = 'FP05' then
  begin
     bz:= SelectFP05(AdvEdit1.Text);
  end;
  if  bz then
  begin
    WorksFlags := 3; 
    SpeedButton20.Enabled := True;
    SpeedButton15.Enabled := False;
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TAdvEdit then
        TAdvEdit(Components[i]).ReadOnly := True;
    end;
    TaxPubReadOnly := True;
    AdvEdit1.ReadOnly := False;
  end;
end;

function TMain.SelectFP03(aText: string): Boolean;
var
  aSql: string;
  i: Integer;
begin
  i := 3;
  Result := True;
  with DataModule1.ADOSelect do
  begin
    SQL.Clear;
    aSql := 'Select * From TaxGdzc Where 发票号码=' + QuotedStr(aText);
    SQL.Add(aSql);
    Open;
    if RecordCount <= 0 then
    begin
      Application.MessageBox('数据库中无此发票！  ', '贝壳提示', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      AdvEdit1.Clear;
      advedit1.SetFocus;
      Result := False;
      Exit;
    end;
    try
      while not Eof do
      begin
        if i > 5 then
          Exit;
        if i = 3 then
        begin
          cxDateEdit1.Date := FieldByName('开票日期').AsDateTime;
          AdvEdit3.Text := FieldByName('发票号码').AsString;
          AdvEdit4.Text := FieldByName('买方名称').AsString;
          AdvEdit5.Text := FieldByName('客户名称').AsString;
          AdvEdit6.Text := FieldByName('客户编码').AsString;
          InVoiceTable.Cells[3, 0] := FieldByName('卖方名称').AsString;
          InVoiceTable.Cells[9, 0] := FieldByName('座落地点').AsString;
          InVoiceTable.Cells[3, 6] := FieldByName('金额大写').AsString;
          InVoiceTable.Cells[7, 6] := CurrToStr(FieldByName('金额合计').AsCurrency);
          InVoiceTable.Cells[6, 7] := FieldByName('开票人').AsString;
          InVoiceTable.Cells[10, 7] := FieldByName('收款人').AsString;
          InVoiceTable.Cells[11, 3] := FieldByName('备注').AsString;
        end;
        InVoiceTable.Cells[0, i] := FieldByName('项目').AsString;
        InVoiceTable.Cells[3, i] := IntToStr(FieldByName('建筑面积').AsInteger);
        InVoiceTable.Cells[5, i] := IntToStr(FieldByName('单价').AsInteger);
        InVoiceTable.Cells[7, i] := CurrToStr(FieldByName('金额').AsCurrency);
        Inc(i);
        Next;
      end;
    except
      Result:=False;
    end;      
  end;
end;

procedure TMain.PrintFP03;
var
  CurrentIndex: Integer;
  aTmpFont: TFont;
  DrawMoneyCp, DrawMoney, DrawOne: string;
  i, j, THeight, TWidth: Integer;
begin
  with aPrintForm.Image1 do
  begin
    THeight := Canvas.TextHeight('1');
    aTmpFont := Canvas.Font;
    with Canvas do
    begin
      TextOut(500, 20, BKString);
      Font.Size := 14;
      Font.Name := '宋体';
      Font.Style := [fsBold];
      TextOut(250, 20, '转 让 不 动 产');
      Font.Size := 10;
      Font.Name := '宋体';
      Font.Color := $004080FF;
      Font.Style := Font.Style - [fsBold];
    
      TextOut(370, 60, '开票日期：'); 
      TextOut(430, 60, DateToStr(cxDateEdit1.Date));
      TextOut(510, 60, '发票号码：'); 
      TextOut(570, 60, AdvEdit3.Text);
      TextOut(20, 80, '买方名称：'); 
      TextOut(80, 80, AdvEdit4.Text);
      TextOut(280, 80, '客户名称：'); 
      TextOut(340, 80, AdvEdit5.Text);
      TextOut(510, 80, '发票号码：'); 
      TextOut(570, 80, AdvEdit6.Text);

      Pen.Color := clBackground;
      MoveTo(430, 60 + THeight); 
      LineTo(500, 60 + THeight);

      MoveTo(570, 60 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 60 + THeight);

      MoveTo(80, 80 + THeight);
      LineTo(80 + TextWidth(AdvEdit4.Text), 80 + THeight);

      MoveTo(340, 80 + THeight);
      LineTo(500, 80 + THeight);

      MoveTo(570, 80 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 80 + THeight);

      MoveTo(20, 100); LineTo(650, 100); 
      MoveTo(20, 100); LineTo(20, 300); 
      MoveTo(650, 100); LineTo(650, 300); 

      MoveTo(20, 130); LineTo(650, 130);
      MoveTo(20, 170); LineTo(650, 170);

      MoveTo(130, 100); LineTo(130, 280);
      MoveTo(260, 130); LineTo(260, 230);
      MoveTo(380, 100); LineTo(380, 260);
      MoveTo(380, 150); LineTo(550, 150);
      MoveTo(470, 100); LineTo(470, 130);
      MoveTo(550, 130); LineTo(550, 260);
      for i := 1 to 11 do
      begin
        if i = 2 then
          Pen.Color := clRed
        else
          Pen.Color := clBackground;
        if i <> 11 then
        begin
          MoveTo(550 - (20 * I) + 5 * i, 150);
          LineTo(550 - (20 * I) + 5 * i, 260);
        end;
        CurrentIndex := (12 - i + 1);
        DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
        TextOut(537 - (20 * i - 5 * i) + 15, 155, DrawMoneyCp);
      end;
      for i := 0 to 3 do
      begin
        DrawMoney := InVoiceTable.Cells[9, 3 + i];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        for J := 1 to 12 do
        begin
          TWidth := TextWidth('1') + 8;
          if J > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - J + 1, 1);
          TextOut(540 - (20 * j - 5 * j) + 15, 175 + i * 20, DrawOne);
        end;
      end;
      for i := 1 to 3 do
      begin
        MoveTo(20, 170 + i * 20); LineTo(550, 170 + i * 20);
      end;
      MoveTo(20, 260); LineTo(650, 260);
      MoveTo(20, 280); LineTo(650, 280);
      MoveTo(20, 300); LineTo(650, 300);
      TextOut(35, 112, '卖 方 名 称');
      TextOut(390, 112, '卖 方 名 称');
      TWidth := 130 + (380 - 130 - (TextWidth('杨') * Length(InVoiceTable.Cells[3, 0]) div 2)) div 2;
      TextOut(TWidth, 112, InVoiceTable.Cells[3, 0]);
      TWidth := 470 + (650 - 470 - (TextWidth('杨') * Length(InVoiceTable.Cells[9, 0]) div 2)) div 2;
      TextOut(TWidth, 112, InVoiceTable.Cells[9, 0]);
      TextOut(50, 148, '项  目');
      TextOut(173, 138, '建  筑');
      TextOut(170, 155, '面 积 M2');
      TextOut(285, 148, '单  价(元M2)');
      TextOut(440, 135, '金    额');
      TextOut(580, 148, '备    注');
      for i := 0 to 2 do
      begin
        TWidth := 20 + (130 - 20 - (TextWidth('杨') * Length(InVoiceTable.Cells[0, 3 + i]) div 2)) div 2;
        TextOut(TWidth, 175 + 20 * i, InVoiceTable.Cells[0, 3 + i]);
        TWidth := 130 + (260 - 130 - (TextWidth('杨') * Length(InVoiceTable.Cells[3, 3 + i]) div 2)) div 2;
        TextOut(TWidth, 175 + 20 * i, InVoiceTable.Cells[3, 3 + i]);
        TWidth := 260 + (380 - 260 - (TextWidth('杨') * Length(InVoiceTable.Cells[3, 3 + i]) div 2)) div 2;
        TextOut(TWidth, 175 + 20 * i, InVoiceTable.Cells[3, 3 + i]);
      end;
      TWidth := 650 + (550 - 650 - (TextWidth('杨') * Length(InVoiceTable.Cells[11, 3]) div 2)) div 2;
      TextOut(TWidth, 175, InVoiceTable.Cells[11, 3]);
      TextOut(25,240,'合计人民币(大写)');
      TextOut(150,240,InVoiceTable.Cells[3, 6]);
      MoveTo(260, 260); LineTo(260, 280);
      MoveTo(380, 260); LineTo(380, 280);
      MoveTo(520, 260); LineTo(520, 280);
      TextOut(28,265,'单位(盖章有效)');
      TextOut(207,265,'开票人：');
      TextOut(467,265,'收款人：');
      TWidth := 260 + (380 - 260 - (TextWidth('杨') * Length(InVoiceTable.Cells[6, 7]) div 2)) div 2;
      TextOut(TWidth, 265, InVoiceTable.Cells[6, 7]);
      TWidth := 520 + (650 - 520 - (TextWidth('杨') * Length(InVoiceTable.Cells[10, 7]) div 2)) div 2;
      TextOut(TWidth, 265, InVoiceTable.Cells[10, 7]);
      TWidth := 0 + (650 - 0 - (TextWidth('杨') * Length(BKTitle.Text) div 2)) div 2;
      TextOut(TWidth, 285, BKTitle.Text);
      TextOut(50, 310, ' 按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能');
      TextOut(50, 325, '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》');
      TextOut(50, 335, '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开');
      TextOut(50, 350, '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。');
    end;
  end;
end;

procedure TMain.SpeedButton19Click(Sender: TObject);
begin
  ShowMessage(InVoiceTable.Cells[10, 7]);
end;

procedure TMain.DrawFP04;
var
  j, i: integer;
  aTmp: string;
begin
  if CurrentFP = 'FP04' then
  begin
    label4.Caption := '其它内容：';
    Label2.Caption := '开票日期：';
    Label3.Caption := '发票号码：';
    Label9.Caption := '制票单位：';
    Label6.Caption := '客户名称：';
    Label8.Caption := '客户编码：';
    AdvEdit7.Enabled := False;
    Label9.Left := 10;
    Label10.Caption := '    ' +
      '按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能' +
      '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》' +
      '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开' +
      '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。';
    Label10.Visible := True;
    with InVoiceTable do
    begin
      RowCount := 10;
      GridLineColor := 8684164;
      WordWrap := False;
      MergeCells(0, 0, 3, 2);
      MergeCells(3, 0, 2, 2);
      MergeCells(5, 0, 2, 2);
      MergeCells(7, 0, 2, 2);
      MergeCells(9, 0, 4, 1);
      MergeCells(9, 1, 4, 1);
      Cells[0,0]:='项      目';
      Cells[3,0]:='单      位';
      Cells[5,0]:='数      量';
      Cells[7,0]:='收    费'#13'标    准';
      Cells[9,0]:='金      额';
      for i := 2 to 4 do
      begin
        RowHeights[i]:=30;
        MergeCells(0, i, 3, 1);
        MergeCells(3, i, 2, 1);
        MergeCells(5, i, 2, 1);
        MergeCells(7, i, 2, 1);
        MergeCells(9, i, 4, 1);
      end;
      RowHeights[5]:=30;
      MergeCells(0, 5, 3, 1);
      MergeCells(3, 5, 6, 1);
      MergeCells(9, 5, 4, 1);
      MergeCells(0, 6, 3, 2);
      MergeCells(3, 6, 10, 2);
      Cells[0, 5] := '金额合计(大写)';
      Cells[0, 6] := '备      注';
      Alignments[0, 5] := taCenter;
      Alignments[0, 6] := taCenter;
      MergeCells(0, 8, 3, 1);
      MergeCells(3, 8, 3, 1);
      MergeCells(6, 8, 2, 1);
      MergeCells(8, 8, 2, 1);
      MergeCells(10, 8, 3, 1);
      MergeCells(0,9,13,1);
      Cells[0, 8] := '出租方(盖章有效)';
      Cells[3, 8] := '开票人:';
      Cells[8, 8] := '收款人:';
      Alignments[0, 8] := taCenter;
      Alignments[3, 8] := taRightJustify;
      Alignments[8, 8] := taRightJustify;
      
      RowColor[0] := 16761798;
      Colors[9,1]:=$004080FF;
      RowColor[2] := 15204327;
      RowColor[3] := 15204327;
      RowColor[4] := 15204327;
      RowColor[5] := 13041663;
      RowColor[6] := 15204327;
      RowColor[7] := 13041663;
      RowColor[8] := 13041663;
      RowColor[9] := 15204327;
      
      for i := 2 to 4 do
        for j := 0 to 13 DO
          Alignments[J, I] := taCenter;
      for i := 0 to 12 do
        Alignments[i, 0] := taCenter;
      Label10.Top := 252;
      BKTitle.Alignment := taCenter;
      RichToCell(0, 9, BKTitle);
      Alignments[0, 9] := taCenter;
      VAlignment := vtaCenter;
    end;
  end;
end;

procedure TMain.SaveFP04;
var
  FMax: Integer;
  i, s: integer;
begin
  with DataModule1 do
  begin
    try
      ADOTableTax.TableName := 'TaxFwhy';
      ADOTableTax.Open;
      ADOTableTax.First;
      for i := 2 to 4 do
      begin
        if InVoiceTable.Cells[0, i] = '' then
        begin
          Inc(s);
          Continue;
        end
        else
        begin
          with ADOTableTax do
          begin
            Append;
            FMax := GetMax('Select Max(ID) From TaxFwhy');
            FieldByName('ID').AsInteger := FMax + 1;
            FieldByName('发票号码').AsString := AdvEdit3.Text;
            FieldByName('制票单位').AsString := AdvEdit4.Text;
            FieldByName('客户名称').AsString := AdvEdit5.Text;
            FieldByName('客户编码').AsString := AdvEdit6.Text;
            FieldByName('开票日期').AsDateTime := cxDateEdit1.Date;
            if InVoiceTable.Cells[0, i] <> '' then
              FieldByName('项目').AsString := InVoiceTable.Cells[0, i];
            if InVoiceTable.Cells[3, i] <> '' then
              FieldByName('单位').AsString := InVoiceTable.Cells[3, i];
            if InVoiceTable.Cells[5, i] <> '' then
              FieldByName('数量').AsInteger := StrToInt(InVoiceTable.Cells[5, i]);
            if InVoiceTable.Cells[7, i] <> '' then
              FieldByName('收费标准').AsInteger := StrToInt(InVoiceTable.Cells[7,i]);
            if InVoiceTable.Cells[9, i] <> '' then
              FieldByName('金额').AsCurrency := StrToCurr(InVoiceTable.Cells[9,
                i]);
            if InVoiceTable.Cells[3, 5] <> '' then
              FieldByName('金额大写').AsString := InVoiceTable.Cells[3, 5];
            if InVoiceTable.Cells[9, 5] <> '' then
              FieldByName('金额合计').AsCurrency := StrToCurr(InVoiceTable.Cells[9,
                5]);
            if InVoiceTable.Cells[6, 8] <> '' then
              FieldByName('开票人').AsString := InVoiceTable.Cells[6, 8];
            if InVoiceTable.Cells[10, 8] <> '' then
              FieldByName('收款人').AsString := InVoiceTable.Cells[10, 8];
            if InVoiceTable.Cells[3, 6] <> '' then
              FieldByName('备注').AsString := InVoiceTable.Cells[3, 6];
            Post;
          end;
        end;
      end;
      if s = 3 then
        Application.MessageBox('数据只能填写三行!!', '贝壳提示', MB_OK +
          MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST)
      else
      begin
        if WorksFlags <> 3 then 
                                   
          Application.MessageBox('保存成功!', '贝壳提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST);
        ADOTableTax.Close;
        SpeedButton15.Enabled := False;
        SpeedButton20.Enabled := True;
        
        
      end;
    except
      Application.MessageBox('保存错误！', '贝壳提示', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON3 + MB_TOPMOST);
      ADOTableTax.Close;            
    end;
  end;
end;
       
function TMain.SelectFP04(aText: String): Boolean;
var
  aSql: string;
  i: Integer;
begin
  i := 2;
  Result := True;
  with DataModule1.ADOSelect do
  begin
    SQL.Clear;
    aSql := 'Select * From TaxFwhy Where 发票号码=' + QuotedStr(aText);
    SQL.Add(aSql);
    Open;
    if RecordCount <= 0 then
    begin
      Application.MessageBox('数据库中无此发票！  ', '贝壳提示', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      AdvEdit1.Clear;
      advedit1.SetFocus;
      Result := False;
      Exit;
    end;
    try
      while not Eof do
      begin
        if i > 5 then
          Exit;
        if i = 2 then
        begin
          cxDateEdit1.Date := FieldByName('开票日期').AsDateTime;
          AdvEdit3.Text := FieldByName('发票号码').AsString;
          AdvEdit4.Text := FieldByName('制票单位').AsString;
          AdvEdit5.Text := FieldByName('客户名称').AsString;
          AdvEdit6.Text := FieldByName('客户编码').AsString;
          InVoiceTable.Cells[3, 5] := FieldByName('金额大写').AsString;
          InVoiceTable.Cells[9, 5] := CurrToStr(FieldByName('金额合计').AsCurrency);
          InVoiceTable.Cells[6, 8] := FieldByName('开票人').AsString;
          InVoiceTable.Cells[10, 8] := FieldByName('收款人').AsString;
          InVoiceTable.Cells[3, 6] := FieldByName('备注').AsString;
        end;
        InVoiceTable.Cells[0, i] := FieldByName('项目').AsString;
        InVoiceTable.Cells[3, i] := FieldByName('单位').AsString;
        InVoiceTable.Cells[5, i] := IntToStr(FieldByName('数量').AsInteger);
        InVoiceTable.Cells[7, i] := IntToStr(FieldByName('收费标准').AsInteger);
        InVoiceTable.Cells[9, i] := CurrToStr(FieldByName('金额').AsCurrency);
        Inc(i);
        Next;
      end;
    except
      Result:=false;
    end;
  end;
end;

procedure TMain.PrintFP04;
var
  CurrentIndex: Integer;
  aTmpFont: TFont;
  DrawMoneyCp, DrawMoney, DrawOne: string;
  i, j, THeight, TWidth: Integer;
begin
  with aPrintForm.Image1 do
  begin
    THeight := Canvas.TextHeight('1');
    aTmpFont := Canvas.Font;
    with Canvas do
    begin
      TextOut(500, 20, BKString);
      Font.Size := 14;
      Font.Name := '宋体';
      Font.Style := [fsBold];
      TextOut(250, 20, '其 它 服 务 业');
      Font.Size := 10;
      Font.Name := '宋体';
      Font.Color := $004080FF;
      Font.Style := Font.Style - [fsBold];
    
      TextOut(370, 60, '开票日期：'); 
      TextOut(430, 60, DateToStr(cxDateEdit1.Date));
      TextOut(510, 60, '发票号码：'); 
      TextOut(570, 60, AdvEdit3.Text);
      TextOut(20, 80, '制票单位：'); 
      TextOut(80, 80, AdvEdit4.Text);
      TextOut(280, 80, '客户名称：'); 
      TextOut(340, 80, AdvEdit5.Text);
      TextOut(510, 80, '发票号码：'); 
      TextOut(570, 80, AdvEdit6.Text);

      Pen.Color := clBackground;
      MoveTo(430, 60 + THeight); 
      LineTo(500, 60 + THeight);

      MoveTo(570, 60 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 60 + THeight);

      MoveTo(80, 80 + THeight);
      LineTo(80 + TextWidth(AdvEdit4.Text), 80 + THeight);

      MoveTo(340, 80 + THeight);
      LineTo(500, 80 + THeight);

      MoveTo(570, 80 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 80 + THeight);

      MoveTo(20, 100); LineTo(650, 100); 
      MoveTo(20, 100); LineTo(20, 340); 
      MoveTo(650, 100); LineTo(650, 340); 

      MoveTo(20, 140); LineTo(650, 140);
      MoveTo(20, 170); LineTo(650, 170);
      MoveTo(20, 200); LineTo(650, 200);
      MoveTo(20, 230); LineTo(650, 230);
      MoveTo(20, 260); LineTo(650, 260);
      MoveTo(20, 300); LineTo(650, 300);
      MoveTo(20, 320); LineTo(650, 320);
      MoveTo(20, 340); LineTo(650, 340);

      MoveTo(150, 100); LineTo(150, 320);
      MoveTo(250, 100); LineTo(250, 230);
      MoveTo(380, 100); LineTo(380, 230);
      MoveTo(485, 100); LineTo(485, 260);

      MoveTo(485, 120); LineTo(650, 120);

      TextOut(55,118,'项    目');
      TextOut(175,118,'单    位');
      TextOut(285,118,'数    量');
      TextOut(415,110,'收   费');
      TextOut(415,127,'标   准');
      TextOut(545,105,'金    额');
      for i := 1 to 11 do
      begin
        if i = 2 then
          Pen.Color := clRed
        else
          Pen.Color := clBackground;
        if i <> 11 then
        begin
          MoveTo(650 - (20 * I) + 5 * i, 120);
          LineTo(650 - (20 * I) + 5 * i, 260);
        end;
        CurrentIndex := (12 - i + 1);
        DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
        TextOut(637 - (20 * i - 5 * i) + 15, 125, DrawMoneyCp);
      end;
      for i := 0 to 3 do
      begin
        DrawMoney := InVoiceTable.Cells[9, 2 + i];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        for J := 1 to 12 do
        begin
          TWidth := TextWidth('1') + 8;
          if J > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - J + 1, 1);
          TextOut(640 - (20 * j - 5 * j) + 15, 150 + i * 30, DrawOne);
        end;
      end;
      for i := 0 to 2 do
      begin
        TWidth := 20 + (150 - 20 - (TextWidth('杨') * Length(InVoiceTable.Cells[0, 2 + i]) div 2)) div 2;
        TextOut(TWidth, 150 + 30 * i, InVoiceTable.Cells[0, 2 + i]);
        TWidth := 150 + (250 - 150 - (TextWidth('杨') * Length(InVoiceTable.Cells[3, 2 + i]) div 2)) div 2;
        TextOut(TWidth, 150 + 30 * i, InVoiceTable.Cells[3, 2 + i]);
        TWidth := 250 + (380 - 250 - (TextWidth('杨') * Length(InVoiceTable.Cells[5, 2+ i]) div 2)) div 2;
        TextOut(TWidth, 150 + 30 * i, InVoiceTable.Cells[5, 2 + i]);
        TWidth := 380 + (485 - 380 - (TextWidth('杨') * Length(InVoiceTable.Cells[7, 2+ i]) div 2)) div 2;
        TextOut(TWidth, 150 + 30 * i, InVoiceTable.Cells[7, 2 + i]);
      end;
      TextOut(25,240,'合计人民币(大写)');
      TextOut(180,240,InVoiceTable.Cells[3, 5]);
      TextOut(50,275,'备    注');
      TextOut(180, 275, InVoiceTable.Cells[11, 3]);

      MoveTo(260, 300); LineTo(260, 320);
      MoveTo(380, 300); LineTo(380, 320);
      MoveTo(520, 300); LineTo(520, 320);
      TextOut(28,305,'单位(盖章有效)');
      TextOut(207,305,'开票人：');
      TextOut(467,305,'收款人：');
      TWidth := 260 + (380 - 260 - (TextWidth('杨') * Length(InVoiceTable.Cells[6, 8]) div 2)) div 2;
      TextOut(TWidth, 305, InVoiceTable.Cells[6, 8]);
      TWidth := 520 + (650 - 520 - (TextWidth('杨') * Length(InVoiceTable.Cells[10, 8]) div 2)) div 2;
      TextOut(TWidth, 305, InVoiceTable.Cells[10, 8]);
      TWidth := 0 + (650 - 0 - (TextWidth('杨') * Length(BKTitle.Text) div 2)) div 2;
      TextOut(TWidth, 325, BKTitle.Text);




    end;
  end;
end;

procedure TMain.DrawFP05;
var
  j, i: integer;
  aTmp: string;
begin
  if CurrentFP = 'FP05' then
  begin
    label4.Caption := '其它内容：';
    Label2.Caption := '开票日期：';
    Label3.Caption := '发票号码：';
    Label9.Caption := '可以不填：';
    Label6.Caption := '客户名称：';
    Label8.Caption := '客户编码：';
    AdvEdit7.Enabled := False;
    Label9.Left := 10;
    Label10.Caption := '    ' +
      '按照《中华人民共和国企业所得税暂行条例》的规定，这种车贴属于工资的组成部分，只能' +
      '在企业所得税前限额扣除，超过部分要做纳税调整。而且按照《中华人民共和国个人所得税法》' +
      '的规定，这种车贴也是要征收个人所得税的。如果允许编造这样一个虚假的合同到税务机关代开' +
      '发票，企业不仅可以在缴纳所得税前全额扣除，作为员工个人还可以少缴或不缴个人所得税。';
    Label10.Visible := True;
    with InVoiceTable do
    begin
      RowCount := 12;
      GridLineColor := 8684164;
      WordWrap := False;
      MergeCells(0,0,3,2);
      MergeCells(3,0,10,2);
      RowHeights[1]:=8;
      MergeCells(0,2,3,2);
      MergeCells(3,2,10,2);
      RowHeights[3]:=8;
      MergeCells(0,4,3,2);
      MergeCells(3,4,3,2);
      MergeCells(6,4,3,2);
      MergeCells(9,4,4,2);
      MergeCells(9,5,4,1);
      MergeCells(9,4,4,1);
      RowHeights[5]:=15;

      Cells[0,0]:='付 款 单 位';
      Cells[0,2]:='收 款 单 位';
      Cells[0,4]:='合 同 登 记 号';
      Cells[3,4]:='项       目';
      Cells[6,4]:='名       称';
      Cells[9,4]:='金       额';
      Alignments[0,0]:=taCenter;
      Alignments[0,2]:=taCenter;
      Alignments[0,4]:=taCenter;
      Alignments[3,4]:=taCenter;
      Alignments[6,4]:=taCenter;      
      Alignments[9,4]:=taCenter;

      for i := 6 to 8 do
      begin
        MergeCells(0,I,3,1);
        MergeCells(3,I,3,1);
        MergeCells(6,I,3,1);
        MergeCells(9,I,4,1);
        RowHeights[i]:=25;
      end;
      MergeCells(0,9,3,1);
      MergeCells(3,9,6,1);
      MergeCells(9,9,4,1);
      RowHeights[9]:=25;

      MergeCells(0,10,3,1);
      MergeCells(3,10,10,1);
      RowHeights[10]:=30;

      Cells[0, 9] := '金额合计(大写)';
      Cells[0, 10] := '备      注';
      Alignments[0, 9] := taCenter;
      Alignments[0, 10] := taCenter;
      MergeCells(0, 11, 3, 1);
      MergeCells(3, 11, 3, 1);
      MergeCells(6, 11, 2, 1);
      MergeCells(8, 11, 2, 1);
      MergeCells(10, 11, 3, 1);
      Cells[0, 11] := '出租方(盖章有效)';
      Cells[3, 11] := '开票人:';
      Cells[8, 11] := '收款人:';
      Alignments[0, 11] := taCenter;
      Alignments[3, 11] := taRightJustify;
      Alignments[8, 11] := taRightJustify;

      Colors[0,0]:=16761798;
      Colors[0,2]:=16761798;
      RowColor[4] := 16761798;
      Colors[9,5]:=$004080FF;
      Colors[0,9]:=16761798;
      Colors[0,10]:=16761798;
      RowColor[11] := 16761798;
      Colors[3,0]:=15204327;
      Colors[3,2]:=15204327;
      RowColor[6] := 15204327;
      RowColor[7] := 15204327;
      RowColor[8] := 15204327;
      RowColor[9] := 13041663;
      RowColor[10] := 15204327;
      Colors[6,11]:=13041663;
      Colors[10,11]:=13041663;

      for i := 6 to 8 do
        for j := 0 to 13 DO
          Alignments[J, I] := taCenter;
      Label10.Top := 252;
      VAlignment := vtaCenter;
    end;
  end;
end;

procedure TMain.SaveFP05;
var
  FMax: Integer;
  i, s: integer;
begin
  with DataModule1 do
  begin
    try
      ADOTableTax.TableName := 'TaxWxzc';
      ADOTableTax.Open;
      ADOTableTax.First;
      for i := 6 to 8 do
      begin
        if InVoiceTable.Cells[0, i] = '' then
        begin
          Inc(s);
          Continue;
        end
        else
        begin
          with ADOTableTax do
          begin
            Append;
            FMax := GetMax('Select Max(ID) From TaxWxzc');
            FieldByName('ID').AsInteger := FMax + 1;
            FieldByName('发票号码').AsString := AdvEdit3.Text;
            FieldByName('客户名称').AsString := AdvEdit5.Text;
            FieldByName('客户编码').AsString := AdvEdit6.Text;
            FieldByName('开票日期').AsDateTime := cxDateEdit1.Date;
            if InVoiceTable.Cells[3, 0] <> '' then
              FieldByName('付款单位').AsString := InVoiceTable.Cells[3, 0];
            if InVoiceTable.Cells[3, 2] <> '' then
              FieldByName('收款单位').AsString := InVoiceTable.Cells[3, 2];
            if InVoiceTable.Cells[0, i] <> '' then
              FieldByName('合同号').AsString := InVoiceTable.Cells[0, i];
            if InVoiceTable.Cells[3, i] <> '' then
              FieldByName('项目').AsString := InVoiceTable.Cells[3, i];
            if InVoiceTable.Cells[6, i] <> '' then
              FieldByName('名称').AsString := InVoiceTable.Cells[6, i];
            if InVoiceTable.Cells[9, i] <> '' then
              FieldByName('金额').AsCurrency := StrToCurr(InVoiceTable.Cells[9,i]);
            if InVoiceTable.Cells[3, 9] <> '' then
              FieldByName('金额大写').AsString := InVoiceTable.Cells[3, 9];
            if InVoiceTable.Cells[9, 9] <> '' then
              FieldByName('金额合计').AsCurrency := StrToCurr(InVoiceTable.Cells[9,9]);
            if InVoiceTable.Cells[6, 11] <> '' then
              FieldByName('开票人').AsString := InVoiceTable.Cells[6, 11];
            if InVoiceTable.Cells[10, 11] <> '' then
              FieldByName('收款人').AsString := InVoiceTable.Cells[10, 11];
            if InVoiceTable.Cells[3, 10] <> '' then
              FieldByName('备注').AsString := InVoiceTable.Cells[3, 10];
            Post;
          end;
        end;
      end;
      if s = 3 then
        Application.MessageBox('数据只能填写三行!!', '贝壳提示', MB_OK +
          MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST)
      else
      begin
        if WorksFlags <> 3 then 
                                   
          Application.MessageBox('保存成功!', '贝壳提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON3 + MB_TOPMOST);
        ADOTableTax.Close;
        SpeedButton15.Enabled := False;
        SpeedButton20.Enabled := True;
        
        
      end;
    except
      Application.MessageBox('保存错误！', '贝壳提示', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON3 + MB_TOPMOST);
      ADOTableTax.Close;            
    end;
  end;
end;

function TMain.SelectFP05(aText: String): Boolean;
var
  aSql: string;
  i: Integer;
begin
  i := 6;
  Result := True;
  with DataModule1.ADOSelect do
  begin
    SQL.Clear;
    aSql := 'Select * From TaxWxzc Where 发票号码=' + QuotedStr(aText);
    SQL.Add(aSql);
    Open;
    if RecordCount <= 0 then
    begin
      Application.MessageBox('数据库中无此发票！  ', '贝壳提示', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
      AdvEdit1.Clear;
      advedit1.SetFocus;
      Result := False;
      Exit;
    end;
    try
      while not Eof do
      begin
        if i > 9 then
          Exit;
        if i = 6 then
        begin
          cxDateEdit1.Date := FieldByName('开票日期').AsDateTime;
          AdvEdit3.Text := FieldByName('发票号码').AsString;
          AdvEdit5.Text := FieldByName('客户名称').AsString;
          AdvEdit6.Text := FieldByName('客户编码').AsString;
          InVoiceTable.Cells[3, 0] := FieldByName('付款单位').AsString;
          InVoiceTable.Cells[3, 2] := FieldByName('收款单位').AsString;
          InVoiceTable.Cells[3, 9] := FieldByName('金额大写').AsString;
          InVoiceTable.Cells[9, 9] := CurrToStr(FieldByName('金额合计').AsCurrency);
          InVoiceTable.Cells[6, 11] := FieldByName('开票人').AsString;
          InVoiceTable.Cells[10, 11] := FieldByName('收款人').AsString;
          InVoiceTable.Cells[3, 10] := FieldByName('备注').AsString;
        end;
        InVoiceTable.Cells[0, i] := FieldByName('合同号').AsString;
        InVoiceTable.Cells[3, i] := FieldByName('项目').AsString;
        InVoiceTable.Cells[6, i] := FieldByName('名称').AsString;
        InVoiceTable.Cells[9, i] := CurrToStr(FieldByName('金额').AsCurrency);
        Inc(i);
        Next;
      end;
    except
      Result:=false;
    end;
  end;
end;

procedure TMain.PrintFP05;
var
  CurrentIndex: Integer;
  aTmpFont: TFont;
  DrawMoneyCp, DrawMoney, DrawOne: string;
  i, j, THeight, TWidth: Integer;
begin
  with aPrintForm.Image1 do
  begin
    THeight := Canvas.TextHeight('1');
    aTmpFont := Canvas.Font;
    with Canvas do
    begin
      TextOut(500, 20, BKString);
      Font.Size := 14;
      Font.Name := '宋体';
      Font.Style := [fsBold];
      TextOut(250, 20, '其 它 服 务 业');
      Font.Size := 10;
      Font.Name := '宋体';
      Font.Color := $004080FF;
      Font.Style := Font.Style - [fsBold];
    
      TextOut(370, 60, '开票日期：'); 
      TextOut(430, 60, DateToStr(cxDateEdit1.Date));
      TextOut(510, 60, '发票号码：'); 
      TextOut(570, 60, AdvEdit3.Text);
      TextOut(20, 80, '制票单位：'); 
      TextOut(80, 80, AdvEdit4.Text);
      TextOut(280, 80, '客户名称：'); 
      TextOut(340, 80, AdvEdit5.Text);
      TextOut(510, 80, '发票号码：'); 
      TextOut(570, 80, AdvEdit6.Text);

      Pen.Color := clBackground;
      MoveTo(430, 60 + THeight); 
      LineTo(500, 60 + THeight);

      MoveTo(570, 60 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 60 + THeight);

      MoveTo(80, 80 + THeight);
      LineTo(80 + TextWidth(AdvEdit4.Text), 80 + THeight);

      MoveTo(340, 80 + THeight);
      LineTo(500, 80 + THeight);

      MoveTo(570, 80 + THeight);
      LineTo(570 + TextWidth(AdvEdit3.Text), 80 + THeight);

      MoveTo(20, 100); LineTo(650, 100); 
      MoveTo(20, 100); LineTo(20, 340); 
      MoveTo(650, 100); LineTo(650, 340); 

      MoveTo(20, 125); LineTo(650, 125);
      MoveTo(20, 150); LineTo(650, 150);
      MoveTo(20, 185); LineTo(650, 185);
      MoveTo(20, 210); LineTo(650, 210);
      MoveTo(20, 235); LineTo(650, 235);
      MoveTo(20, 260); LineTo(650, 260);
      MoveTo(20, 290); LineTo(650, 290);
      MoveTo(20, 320); LineTo(650, 320);
      MoveTo(20, 340); LineTo(650, 340);

      MoveTo(150, 100); LineTo(150, 340);
      MoveTo(330, 150); LineTo(330, 260);
      MoveTo(485, 150); LineTo(485, 320);

      MoveTo(485, 165); LineTo(650, 165);  

      TextOut(45,108,'付 款 单 位');
      TextOut(45,135,'收 款 单 位');
      TextOut(30,165,'合 同 登 记 号');
      TextOut(200,165,'项      目');
      TextOut(370,165,'名      称');
      TextOut(545,152,'金    额');





      TextOut(180, 108, InVoiceTable.Cells[3, 0]);
      TextOut(180, 135, InVoiceTable.Cells[3, 2]);
      for i := 0 to 2 do
      begin
        TWidth := 20 + (150 - 20 - (TextWidth('杨') * Length(InVoiceTable.Cells[0, 6 + i]) div 2)) div 2;
        TextOut(TWidth, 193 + 25 * i, InVoiceTable.Cells[0, 6 + i]);
        TWidth := 150 + (330 - 150 - (TextWidth('杨') * Length(InVoiceTable.Cells[3, 6 + i]) div 2)) div 2;
        TextOut(TWidth, 193 + 25 * i, InVoiceTable.Cells[3, 6 + i]);
        TWidth := 330 + (485 - 330 - (TextWidth('杨') * Length(InVoiceTable.Cells[6, 6+ i]) div 2)) div 2;
        TextOut(TWidth, 193 + 25 * i, InVoiceTable.Cells[6, 6 + i]);
      end;
      for i := 1 to 11 do
      begin
        if i = 2 then
          Pen.Color := clRed
        else
          Pen.Color := clBackground;
        if i <> 11 then
        begin
          MoveTo(650 - (20 * I) + 5 * i, 165);
          LineTo(650 - (20 * I) + 5 * i, 290);
        end;
        CurrentIndex := (12 - i + 1);
        DrawMoneyCp := Copy(MoneyCaStr, CurrentIndex * 2 - 1, 2);
        TextOut(637 - (20 * i - 5 * i) + 15, 170, DrawMoneyCp);
      end;
      for i := 0 to 3 do
      begin
        DrawMoney := InVoiceTable.Cells[9, 6 + i];
        if DrawMoney <> '' then
          DrawMoney := FormatFloat('0.00', StrToFloat(DrawMoney));
        DrawMoney := StringReplace(DrawMoney, '.', '', []);
        for J := 1 to 12 do
        begin
          TWidth := TextWidth('1') + 8;
          if J > Length(DrawMoney) then
            DrawOne := ''
          else
            DrawOne := Copy(DrawMoney, Length(DrawMoney) - J + 1, 1);
          TextOut(640 - (20 * j - 5 * j) + 15, 193 + i * 27, DrawOne);
        end;
      end;

      TextOut(25,270,'合计人民币(大写)');
      TextOut(180,270,InVoiceTable.Cells[3, 9]);
      TextOut(50,300,'备    注');
      TextOut(180, 300, InVoiceTable.Cells[3, 10]);
      MoveTo(260, 320); LineTo(260, 340);
      MoveTo(380, 320); LineTo(380, 340);
      MoveTo(520, 320); LineTo(520, 340);
      TextOut(28,325,'单位(盖章有效)');
      TextOut(207,325,'开票人：');
      TextOut(467,325,'收款人：');
      TWidth := 260 + (380 - 260 - (TextWidth('杨') * Length(InVoiceTable.Cells[6, 11]) div 2)) div 2;
      TextOut(TWidth, 325, InVoiceTable.Cells[6, 11]);
      TWidth := 520 + (650 - 520 - (TextWidth('杨') * Length(InVoiceTable.Cells[10, 11]) div 2)) div 2;
      TextOut(TWidth, 325, InVoiceTable.Cells[10, 11]);
      TWidth := 0 + (650 - 0 - (TextWidth('杨') * Length(BKTitle.Text) div 2)) div 2;





    end;
  end;
end;
procedure TMain.SpeedButton10Click(Sender: TObject);
begin
  AdminMan.ShowModal;
end;

procedure TMain.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[5].Text:= TimeToStr(NowDate);
end;

procedure TMain.N11Click(Sender: TObject);
begin
  CurrentFP := 'FP01';
  SpeedButton4.Click;
end;

procedure TMain.N12Click(Sender: TObject);
begin
  CurrentFP := 'FP02';
  SpeedButton4.Click;
end;

procedure TMain.N13Click(Sender: TObject);
begin
  CurrentFP := 'FP03';
  SpeedButton4.Click;
end;

procedure TMain.N14Click(Sender: TObject);
begin
  CurrentFP := 'FP04';
  SpeedButton4.Click;
end;

procedure TMain.N3Click(Sender: TObject);
begin
  CurrentFP := 'FP05';
  SpeedButton4.Click;
end;

procedure TMain.SpeedButton1Click(Sender: TObject);
begin
  GenLibrary.ShowModal;
end;

procedure TMain.SpeedButton3Click(Sender: TObject);
begin
  Backup:=TBackup.Create(Self);
  Backup.ShowModal;
end;

procedure TMain.N32Click(Sender: TObject);
begin
  About.ShowModal;
end;

procedure TMain.N1Click(Sender: TObject);
begin
  AdminMan.ShowModal;
end;

procedure TMain.N15Click(Sender: TObject);
begin
  AdminMan.ShowModal;
end;

procedure TMain.InVoiceTableClick(Sender: TObject);
begin

end;

end.

