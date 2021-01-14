unit ComePas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants, DB, Xeduser, StdCtrls, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls;

type
  TComeForm = class(TForm)
    Group1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Group2: TGroupBox;
    Edit13: TEdit;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button3: TButton;
    Label7: TLabel;
    Edit06: TEdit;
    Label10: TLabel;
    Edit14: TEdit;
    Button1: TButton;
    Edit05: TComboBox;
    Edit11: TDBLookupComboBox;
    Label6: TLabel;
    Label11: TLabel;
    Edit01: TComboBox;
    Edit02: TDateTimePicker;
    Edit03: TComboBox;
    Edit12: TDBEdit;
    SBar: TPanel;
    Edit04: TEdit;
    Edit21: TDateTimePicker;
    Check1: TCheckBox;
    Button4: TButton;
    Timer1: TTimer;
    Image1: TImage;
    Button2: TButton;
    Label12: TLabel;
    CardList: TComboBox;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Edit03Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit01Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure Check1Exit(Sender: TObject);
    procedure Edit03Change(Sender: TObject);
    procedure Edit05Click(Sender: TObject);
    procedure Edit06KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit01DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ComeForm: TComeForm;

implementation

uses Work01, Data, Printers;

{$R *.DFM}

var Change: Boolean = False;
  NtCode: Word;
  Newer: Boolean;
  PSort: Word;

procedure TComeForm.FormCreate(Sender: TObject);
var
  I: Word;
begin
  DM.Water.Open;
  DM.Ball00.Open;
  DM.Ball01.Open;
  DM.Ball02.Open;
  DM.Ball03.Open;
  DM.Rate.Open;
  DM.Ball01.Last;
  if DM.Ball01.Bof or not VarIsNull(DM.Ball01['娱乐类别']) then
    DM.Ball01.AppendRecord([]);

  NtCode := DM.Ball01['流水号'];

  DM.State.Close;
  DM.State.SQL.Text :=
    'Select 流水号 From Ball01 Where ' +
    '(结帐标志 = False or 结帐标志 is NULL)';
  DM.State.Open;
  with DM.State do while not Eof do begin
      I := FieldByName('流水号').AsInteger;
      Edit01.Items.Add(Format('%8d', [I]));
      DM.State.Next;
    end;
  DM.State.Close;

  DM.Ball00.First;
  repeat
    Edit03.Items.Add(DM.Ball00['名称']);
    DM.Ball00.Next;
  until DM.Ball00.Eof;

  Edit01.ItemIndex := Edit01.Items.Count - 1;
  Edit01Click(Self);
end;

procedure TComeForm.Edit03Click(Sender: TObject);
begin
  Edit03Change(Self);
  Edit05Click(Self);
end;

procedure TComeForm.Button3Click(Sender: TObject);
var
  T: TDateTime;
  Code, Num9: Word;
  Price: Real;
begin
  Code := StrToInt(Trim(Edit01.Text));
  if Check1.Checked then begin
    if not DM.Ball03.Locate('流水号', Code, []) then begin
      T := DM.Ball01['开始时间']; // 初次截钟
      DM.Ball03.Append;
      DM.Ball03['流水号'] := Code;
      DM.Ball03['开始时间'] := T;
      DM.Ball03['结束时间'] := Edit21.DateTime;
      DM.Ball03.POST;
      ShowMessage('[初次]截钟时间已经增加');
    end else begin //再次截钟
      DM.Ball03.Last; //得到最后截钟时间
      while DM.Ball03['流水号'] <> Code do DM.Ball03.Prior;
      T := DM.Ball03['结束时间'];
      DM.Ball03.Append;
      DM.Ball03['流水号'] := Code;
      DM.Ball03['开始时间'] := T;
      DM.Ball03['结束时间'] := Edit21.DateTime;
      DM.Ball03.Post;
      ShowMessage('[新的]截钟时间已经增加');
    end;
    Check1.Checked := False;
  end;
  if Trim(Edit13.Text) = '' then Exit;
  Num9 := StrToInt(Edit13.Text);
  if Num9 = 0 then Exit;
  Price := DM.Water['单价'];
  Edit14.Text := FloatToStr(Price * Num9);
  with DM.Ball02 do begin
    if Locate('流水号;名称', VarArrayof([Code, Edit11.Text]), [])
      then begin
      Num9 := Num9 + DM.Ball02['数量'];
      Edit;
    end else begin
      Append;
      FieldByName('流水号').asInteger := Code;
      FieldByName('名称').AsString := Edit11.Text;
    end;
    FieldByName('数量').AsInteger := Num9;
    FieldByName('单价').AsCurrency := Price;
    FieldByName('金额').AsCurrency := Round(Num9 * Price);
    Post;
    Edit13.Text := '';
    Edit14.Text := '';
    Showmessage('新的酒水记录已经增加');
  end;
  Button3.Enabled := False;
end;

procedure TComeForm.Button1Click(Sender: TObject);
var
  LastCode: Boolean;
  Pri1: Real;
  Num1: Word;
  B: TBookMark;
begin
  if Trim(Edit03.Text) = '' then Exit;
  if Trim(Edit05.Text) = '' then Exit;
  Button1.Enabled := False;
  Button4.Enabled := True;
  Button4.SetFocus;
  Group2.Enabled := True;
  with DM.Ball01 do begin
    Locate('流水号', Edit01.Text, []);
    LastCode := VarIsNull(DM.Ball01['娱乐类别']);
    Edit;
    DM.Ball01['日期'] := Edit02.DateTime;
    DM.Ball01['开始时间'] := Edit02.DateTime;
    DM.Ball01['娱乐类别'] := Edit04.Text;
    DM.Ball01['编号'] := Copy(Edit05.Text, 4, 2);
    DM.Ball01['结帐标志'] := False;
    if Trim(Edit06.Text) = '' then Edit06.Text := '0';
    Pri1 := DM.Ball00['租拍单价'];
    Num1 := StrToInt(Edit06.Text);
    DM.Ball01['租拍数量'] := Num1;
    DM.Ball01['租拍金额'] := Pri1 * Num1;
    Post;
  end;
  SBar.Font.Color := clWhite;
  SBar.Caption := '该客户的数据已经记录';
  if LastCode then begin
    B := DM.Ball01.GetBookMark;
    DM.Ball01.Append;
    DM.Ball01.Post;
    NtCode := DM.Ball01['流水号'];
    Edit01.Items.Add(Format('%8d', [NtCode]));
    DM.Ball01.GotoBookMark(B);
  end;
end;

procedure TComeForm.Edit01Click(Sender: TObject);
var
  Code, Sort: Word;
//  Indx: Word;
  Codes, SortName: string;
begin
  Newer := Edit01.Text = Format('%8d', [NtCode]);
  Group2.Enabled := not Newer;
  Button4.Enabled := False;
  Button1.Enabled := False;
//  Edit03.Enabled := Newer;
  if Newer then begin
    SBar.Font.Color := clWhite;
    SBar.Caption := '提示信息：新的客户记录';
    Edit02.DateTime := Now;
    Edit03.ItemIndex := -1;
    Edit04.Text := '';
    Edit05.ItemIndex := -1;
    Edit06.Text := '0';
  end else begin
    SBar.Font.Color := clGray;
    SBar.Caption := '提示信息：已有客户记录';
    with DM.Ball01 do
      if Locate('流水号', Edit01.Text, []) then begin
        Edit02.DateTime := FieldByName('开始时间').AsDateTime;
        Sort := DM.Ball01['娱乐类别'];
        DM.Ball00.Locate('娱乐类别', Sort, []);
        SortName := DM.Ball00['名称'];
        Edit03.ItemIndex := Edit03.Items.IndexOf(SortName);
        Edit03Change(Self);
        Code := FieldByName('编号').Value;
        Codes := Format('第 %2d 号', [Code]);
        Edit05.Items.Add(CodeS);
        Edit05.ItemIndex := Edit05.Items.IndexOf(Codes);
        Edit05.Update;
        if VarIsNull(DM.Ball01['租拍数量']) then
          Edit06.Text := '0' else Edit06.Text :=
          FieldByName('租拍数量').Value;
      end;
  end;
end;

procedure TComeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Water.Close;
  DM.Ball00.Close;
  DM.Ball01.Close;
  DM.Ball02.Close;
  DM.Ball03.Close;
  DM.Rate.Close;
  Action := caFree;
end;

procedure TComeForm.Button4Click(Sender: TObject);
var
  Prnt: TextFile;
begin
  Button4.Enabled := False;
  SBar.Caption := '提示信息：正在打印客户开台单....';
  AssignPRN(Prnt);
  Rewrite(Prnt);
  Printer.Canvas.Font.Name := '宋体';
  Printer.Canvas.Font.Style := [];
  Printer.Canvas.Font.PixelsPerInch :=
    GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY);
  Printer.Canvas.Font.Size := 16;
  Printer.Canvas.Font.Name := '黑体';
  Writeln(Prnt, '雄 祺 体 育 活 动 中 心');
  Writeln(Prnt);
  Printer.Canvas.Font.Name := '宋体';
  Printer.Canvas.Font.Size := 12;
  Writeln(Prnt, '流水号: ' + Edit01.text);
  Writeln(Prnt, Edit03.Text + Edit05.Text);
  Writeln(Prnt, '收费标准:');
  DM.Ball00.Locate('娱乐类别', PSort, []);
  Writeln(Prnt,
    DM.Ball00['时间1']: 8, '--',
    DM.Ball00['时间2'], '单价:': 8,
    DM.Ball00['单价1']: 2, '元/小时');
  Writeln(Prnt,
    DM.Ball00['时间2'], '--',
    DM.Ball00['时间3']: 2, '单价:': 8,
    DM.Ball00['单价2'], '元/小时');
  Writeln(Prnt,
    DM.Ball00['时间3'], '以后', '': 6, '单价:': 8,
    DM.Ball00['单价3']: 2, '元/小时');
  Writeln(Prnt);
  Printer.Canvas.Font.Name := '黑体';
  Printer.Canvas.Font.Size := 14;
  Writeln(Prnt, '开台时间: ' + timetostr(Edit02.time));

  Writeln(Prnt);
  Writeln(Prnt, '注：最低消费时间一小时起');
  Printer.Canvas.Font.Name := '宋体';
  Printer.Canvas.Font.Size := 11;
  CloseFile(Prnt);
end;

procedure TComeForm.Edit13Exit(Sender: TObject);
var
  Price, Num9: Real;
begin
  Button3.Enabled := Check1.Checked or (Edit13.Text <> '');
  if not Button3.Enabled then Exit;
  Num9 := StrToInt(Edit13.Text);
  if Num9 = 0 then Exit;
  Price := DM.Water.FieldByName('单价').AsFloat;
  Edit14.Text := FloatToStr(Price * Num9);
end;

procedure TComeForm.Check1Exit(Sender: TObject);
begin
  Edit21.DateTime := Now;
  Button3.Enabled := Check1.Checked or (Edit13.Text <> '');
end;

procedure TComeForm.Edit03Change(Sender: TObject);
var
  I, Sort, Summ: Word;
  S: string;
begin
  Button3.Enabled := False;
  DM.Ball00.Locate('名称', Edit03.Text, []);
  Sort := DM.Ball00['娱乐类别'];
  PSort := Sort;
  Summ := DM.Ball00['数量'];
  Edit04.Text := Format('%d', [Sort]);
  DM.State.SQL.Text :=
    'Select * From Ball01 Where ' +
    '(结帐标志 = False or 结帐标志 is NULL) ' +
    'and 娱乐类别="' + Edit04.Text + '"';
  DM.State.Open;
  Edit05.Items.Clear;
  for I := 1 to Summ do Edit05.Items.Add(Format('第 %2d 号', [I]));
  while not DM.State.Eof do begin
    I := DM.State['编号'];
    S := Format('第 %2d 号', [I]);
    with Edit05.Items do Delete(Indexof(S));
    DM.State.Next;
  end;
  DM.State.Close;
end;

procedure TComeForm.Edit05Click(Sender: TObject);
begin
  Button1.Enabled := (Edit03.Text <> '') and (Edit05.Text <> '');
end;

procedure TComeForm.Edit06KeyPress(Sender: TObject; var Key: Char);
begin
  Button1.Enabled := (Edit03.Text <> '') and (Edit05.Text <> '');
end;

procedure TComeForm.Timer1Timer(Sender: TObject);
begin
  ShowTime(image1);
end;

procedure TComeForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TComeForm.Edit01DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  if odSelected in State then Begin
    Edit01.Canvas.Brush.Color := clBlue;
  End;
  Edit01.Canvas.FillRect(Rect);
  Edit01.Canvas.TextOut(Rect.Left + 01, Rect.Top + 1, Edit01.Items[Index]);
end;

procedure TComeForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  NewHeight := 450;
end;

end.

