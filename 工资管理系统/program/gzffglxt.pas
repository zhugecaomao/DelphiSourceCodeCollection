unit gzffglxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mp, ExtCtrls, StdCtrls, Buttons, Grids, jpeg, Mask;

type
  TForm83 = class(TForm41)
    Image1: TImage;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
    Function IsNull: Boolean;
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    Procedure ClearString;
    Procedure Clear;
    Procedure ClearStringEnd;
    Function isCF:Boolean;
    Function JCxmlb: Boolean;
    Function Biscf: Boolean;
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form83: TForm83;
  x,y: Integer;
  Ye: Real = 0.0;//记录本月余额
  Day1,month1,Year1: Word;
implementation

uses dataa;

{$R *.dfm}
  
procedure TForm83.FormShow(Sender: TObject);
var
  i: integer;
begin
  Label5.Caption := FormatDateTime('yyyy-mm-dd',Now());
  StringGrid1.Cells[0,0]:='         员工编号';
  StringGrid1.Cells[1,0]:='    员工姓名' ;
  StringGrid1.Cells[2,0]:='   基本工资';
  StringGrid1.Cells[3,0]:='  职务工资';
  StringGrid1.Cells[4,0]:='  工龄工资';
  StringGrid1.Cells[5,0]:='  养老保险金';
  StringGrid1.Cells[6,0]:='  加班天数';
  StringGrid1.Cells[7,0]:='  加班工资';
  StringGrid1.Cells[8,0]:=' 事假天数';
  StringGrid1.Cells[9,0]:='   事假扣款';
  StringGrid1.Cells[10,0]:=' 个人所得税';
  StringGrid1.Cells[11,0]:='   住房补助';
  StringGrid1.Cells[12,0]:='  上月余额';
  StringGrid1.Cells[13,0]:='    保险费';
  StringGrid1.Cells[14,0]:='  生活补助';
  StringGrid1.Cells[15,0]:='  应发金额';
  StringGrid1.Cells[16,0]:='  实发金额';
  DecodeDate(Now(),Year1,Month1 ,Day1);
  with Data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 工资发放');
    Open;
  end;
  if Data3.ADOQuery1.RecordCount>0 then
  begin
    Clear;
    StringGrid1.RowCount := Data3.ADOQuery1.RecordCount+1;
    i:= 1;
    while not Data3.ADOQuery1.Eof do
    begin
      StringGrid1.Cells[0,i]:= Data3.ADOQuery1.Fields[0].AsString;
      StringGrid1.Cells[1,i]:= Data3.ADOQuery1.Fields[1].AsString;
      StringGrid1.Cells[2,i]:= Data3.ADOQuery1.Fields[2].AsString;
      StringGrid1.Cells[3,i]:= Data3.ADOQuery1.Fields[3].AsString;
      StringGrid1.Cells[4,i]:= Data3.ADOQuery1.Fields[4].AsString;
      StringGrid1.Cells[5,i]:= Data3.ADOQuery1.Fields[5].AsString;
      StringGrid1.Cells[6,i]:= '0';
      StringGrid1.Cells[7,i]:= '0.0';
      StringGrid1.Cells[8,i]:= '0';
      StringGrid1.Cells[9,i]:= '0.0';
      StringGrid1.Cells[10,i]:= Data3.ADOQuery1.Fields[6].AsString;
      StringGrid1.Cells[11,i]:= Data3.ADOQuery1.Fields[7].AsString;
      with Data3.ADOQuery2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select 余额 from 工资发放明细表 where 员工编号 = :c and year(时间) = :a and month(时间) = :b');
        //如果当前月份是一月，上月余额应为上一年十二月份的余额
        if Month1 >1 then
        begin
          Parameters.ParamByName('a').Value := Year1;
          Parameters.ParamByName('b').Value := Month1-1;
        end
        else
        begin
          Parameters.ParamByName('a').Value := Year1-1;
          Parameters.ParamByName('b').Value := 12;
        end;
        Parameters.ParamByName('c').Value := Trim(StringGrid1.Cells[0,x]);
        Open;
      end;
      if Data3.ADOQuery2.FieldByName('余额').Value = Null then
        StringGrid1.Cells[12,i] := '0'
      else
        StringGrid1.Cells[12,i] := FloatToStr(Data3.ADOQuery2.FieldByName('余额').Value);
      StringGrid1.Cells[13,i]:= Data3.ADOQuery1.Fields[8].AsString;
      StringGrid1.Cells[14,i]:= Data3.ADOQuery1.Fields[9].AsString;
      if Trim(StringGrid1.Cells[6,i])<>'' then
      begin
        StringGrid1.Cells[7,i]:= FloatToStr(StrToInt(StringGrid1.Cells[6,i])*StrToFloat(Edit1.Text)) ;
        if (Trim(StringGrid1.Cells[0,i])<>'')and(Trim(StringGrid1.Cells[9,i])<>'')then
          StringGrid1.Cells[15,i]:= FloatToStr(StrToFloat(StringGrid1.Cells[2,i])+StrToFloat(StringGrid1.Cells[3,i])+StrToFloat(StringGrid1.Cells[4,i])
          -StrToFloat(StringGrid1.Cells[5,i])+StrToFloat(StringGrid1.Cells[7,i])-StrToFloat(StringGrid1.Cells[9,i])-StrToFloat(StringGrid1.Cells[10,i])+StrToFloat(StringGrid1.Cells[11,i])+StrToFloat(StringGrid1.Cells[12,i])+StrToFloat(StringGrid1.Cells[13,i])+StrToFloat(StringGrid1.Cells[14,i]));
      end
      else
      begin
        StringGrid1.Cells[7,i]:= '';
        StringGrid1.Cells[15,i]:='';
      end;
      if Trim(StringGrid1.Cells[8,i])<>'' then
      begin
        StringGrid1.Cells[9,i]:= FloatToStr(StrToInt(StringGrid1.Cells[8,i])*StrToFloat(Edit2.Text));
        if (Trim(StringGrid1.Cells[0,i])<>'')and(Trim(StringGrid1.Cells[7,i])<>'')then
          StringGrid1.Cells[15,i]:= FloatToStr(StrToFloat(StringGrid1.Cells[2,i])+StrToFloat(StringGrid1.Cells[3,i])+StrToFloat(StringGrid1.Cells[4,i])
           -StrToFloat(StringGrid1.Cells[5,i])+StrToFloat(StringGrid1.Cells[7,i])-StrToFloat(StringGrid1.Cells[9,i])-StrToFloat(StringGrid1.Cells[10,i])
           +StrToFloat(StringGrid1.Cells[11,i])+StrToFloat(StringGrid1.Cells[12,i])+StrToFloat(StringGrid1.Cells[13,i])+StrToFloat(StringGrid1.Cells[14,i]));
      end
      else
      Begin
        StringGrid1.Cells[9,i]:='';
        StringGrid1.Cells[15,i]:='';
      end ;
      inc(i);
      Data3.ADOQuery1.Next;
    end;
  end
  else
    Application.MessageBox('没有员工信息,或员工信息不完整.','提示',64);
end;

procedure TForm83.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  inherited;
  if (y = 6) or (y =8) then
  begin
    if Trim(StringGrid1.Cells[6,x])<>'' then
    begin
      StringGrid1.Cells[7,x]:= FloatToStr(StrToInt(StringGrid1.Cells[6,x])*StrToFloat(Edit1.Text)) ;
      if (Trim(StringGrid1.Cells[0,x])<>'')and(Trim(StringGrid1.Cells[9,x])<>'')then
       StringGrid1.Cells[15,x]:= FloatToStr(StrToFloat(StringGrid1.Cells[2,x])+StrToFloat(StringGrid1.Cells[3,x])+StrToFloat(StringGrid1.Cells[4,x])
       -StrToFloat(StringGrid1.Cells[5,x])+StrToFloat(StringGrid1.Cells[7,x])-StrToFloat(StringGrid1.Cells[9,x])-StrToFloat(StringGrid1.Cells[10,x])+StrToFloat(StringGrid1.Cells[11,x])+StrToFloat(StringGrid1.Cells[12,x])+StrToFloat(StringGrid1.Cells[13,x])+StrToFloat(StringGrid1.Cells[14,x]));
    end
    else
    begin
      StringGrid1.Cells[7,x]:= '';
      StringGrid1.Cells[15,x]:='';
    end;
    if Trim(StringGrid1.Cells[8,x])<>'' then
    begin
      StringGrid1.Cells[9,x]:= FloatToStr(StrToInt(StringGrid1.Cells[8,x])*StrToFloat(Edit2.Text));
      if (Trim(StringGrid1.Cells[0,x])<>'')and(Trim(StringGrid1.Cells[7,x])<>'')then
        StringGrid1.Cells[15,x]:= FloatToStr(StrToFloat(StringGrid1.Cells[2,x])+StrToFloat(StringGrid1.Cells[3,x])+StrToFloat(StringGrid1.Cells[4,x])
         -StrToFloat(StringGrid1.Cells[5,x])+StrToFloat(StringGrid1.Cells[7,x])-StrToFloat(StringGrid1.Cells[9,x])-StrToFloat(StringGrid1.Cells[10,x])
         +StrToFloat(StringGrid1.Cells[11,x])+StrToFloat(StringGrid1.Cells[12,x])+StrToFloat(StringGrid1.Cells[13,x])+StrToFloat(StringGrid1.Cells[14,x]));
    end
    else
    Begin
      StringGrid1.Cells[9,x]:='';
      StringGrid1.Cells[15,x]:='';
    end ;
  end;
end;

procedure TForm83.Edit1Exit(Sender: TObject);
begin
  inherited;
  if Trim(TEdit(Sender).Text)='' then
  begin
    Application.MessageBox('金额不能为空。','提示',64);
    TEdit(Sender).SetFocus;
    Exit;
  end;
  Try
    StrToFloat(TEdit(Sender).Text);
  Except
    Application.MessageBox('请输入合法字符。','提示',64);
    TEdit(Sender).Text := '40';
  end;
end;

procedure TForm83.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  mm: Boolean;
begin
  mm := (Key <#8)or(Key>#8)and(Key<#46)or(Key>#46)and(Key<#48)or(Key>#57);
  if mm then
    Key := #0;
end;
procedure TForm83.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TBitBtn(Sender).Font.Color :=clRed;
end;

procedure TForm83.BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TBitBtn(Sender).Font.Color := clBlue;
end;

procedure TForm83.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  y := ACol;
  x := ARow;
  if (ACol = 1)and( Trim(StringGrid1.Cells[0,x])='')or((ACol = 6)or(Acol = 8)or(Acol = 16))and(Trim(StringGrid1.Cells[0,x])<>'') then
    StringGrid1.Options := StringGrid1.Options +[goEditing]
  else
    StringGrid1.Options := StringGrid1.Options -[goEditing];
end;

procedure TForm83.StringGrid1KeyPress(Sender: TObject; var Key: Char);
var
  mm: Boolean;
begin
  if(y = 6)or(y =8)then
  begin
    mm := (Key <#8)or(Key >#8)and(Key<#48)or(Key>#57);
    if mm then
      Key := #0;
  end
  else if y =16 then
  begin
    mm := (Key <#8)or(Key >#8)and(Key<#46)or(Key>#46)and(Key<#48)or(Key>#57);
    if mm then
      Key := #0;
  end;
end;
procedure TForm83.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  R,L: Integer;
begin
  if Key = Vk_Delete then
  begin
    if StringGrid1.RowCount>2 then
    begin
      If Application.MessageBox('确实要删除该条记录吗？','提示',MB_YESNO )= ID_Yes then
      begin
        ClearString;
        if x <> StringGrid1.RowCount-1 then
        begin
          For r := x+1 to StringGrid1.RowCount-1 do
            For l := 0 to StringGrid1.ColCount-1 do
              StringGrid1.Cells[l,r-1]:= StringGrid1.Cells[l,r];
        end;
        ClearStringEnd;
        StringGrid1.RowCount := StringGrid1.RowCount-1;
        StringGrid1.SetFocus;
        StringGrid1.Col := 2;
        StringGrid1.Col := 6;
        Exit;
      end;
    end
    else if StringGrid1.RowCount = 2 then
      If Application.MessageBox('确实要删除该条记录吗？','提示',MB_YESNO )= ID_Yes then
      begin
        ClearString;
        StringGrid1.SetFocus;
        StringGrid1.Col := 2;
        StringGrid1.Col := 1;
      end;
  end;
  if (Key = Vk_Down)and(IsNull = False)and(x = StringGrid1.RowCount-1) then
  begin
    StringGrid1.RowCount := StringGrid1.RowCount +1;
    StringGrid1.Col := 1;
  end
  else if (Key = Vk_ReTurn)and(Trim(StringGrid1.Cells[0,x])='')and(Trim(StringGrid1.Cells[1,x])<>'')then
  begin
    with Data3.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from 工资发放 where 员工姓名 = :a');
      Parameters.ParamByName('a').Value := Trim(StringGrid1.Cells[1,x]);
      Open;
    end;
    if Data3.ADOQuery1.RecordCount >0 then
    begin
      if Data3.ADOQuery1.RecordCount>1 then
      begin
        ListBox1.Clear;
        while Not Data3.ADOQuery1.Eof  do
        begin
          ListBox1.Items.Add(Data3.ADOQuery1.FieldByName('员工编号').Value);
          Data3.ADOQuery1.Next ;
        end;
        ListBox1.Visible := True;
        ListBox1.SetFocus;
        ListBox1.ItemIndex := 0;
      end
      else
      begin
        StringGrid1.Cells[0,x]:= Data3.ADOQuery1.FieldByName('员工编号').Value;
        StringGrid1.Cells[1,x]:= Data3.ADOQuery1.FieldByName('员工姓名').Value ;
        StringGrid1.Cells[2,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('基本工资').Value);
        StringGrid1.Cells[3,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('职务工资').Value);
        StringGrid1.Cells[4,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('工龄工资').Value);
        StringGrid1.Cells[5,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('养老保险金').Value);
        StringGrid1.Cells[10,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('个人所得税').Value);
        StringGrid1.Cells[11,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('住房补助').Value);
        StringGrid1.Cells[13,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('保险费').Value);
        StringGrid1.Cells[14,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('生活补助').Value);
        with Data3.ADOQuery2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select 余额 from 工资发放明细表 where 员工编号 = :c and year(时间) = :a and month(时间) = :b');
          //如果当前月份是一月，上月余额应为上一年十二月份的余额
          if Month1 >1 then
          begin
            Parameters.ParamByName('a').Value := Year1;
            Parameters.ParamByName('b').Value := Month1-1;
          end
          else
          begin
            Parameters.ParamByName('a').Value := Year1-1;
            Parameters.ParamByName('b').Value := 12;
          end;
          Parameters.ParamByName('c').Value := Trim(StringGrid1.Cells[0,x]);
          Open;
          end;
          if Data3.ADOQuery2.FieldByName('余额').Value = Null then
            StringGrid1.Cells[12,x] := '0'
          else
            StringGrid1.Cells[12,x] := FloatToStr(Data3.ADOQuery2.FieldByName('余额').Value);
          StringGrid1.Col := 6;
      end;
    end
    else
    begin
      StringGrid1.Cells[1,x]:= '';
      Application.MessageBox('该员工工资信息不全或不存在，请重新输入。','提示',64);
    end;
  end
  else if (Key = VK_ReTurn)and(Trim(StringGrid1.Cells[0,x])<>'')then
  begin
    if StringGrid1.Col < StringGrid1.ColCount-1 then
      StringGrid1.Col := StringGrid1.Col+1;
  end;
  if (Key = VK_Shift)and(JCxmlb = True) then
    BitBtn1.SetFocus;
end;
procedure TForm83.ClearString;
var
  c: Integer;
begin
  For c := 0 to StringGrid1.ColCount-1 do
    StringGrid1.Cells[c,x]:='';
end;

procedure TForm83.ClearStringEnd;
var
  c: Integer;
begin
  For c := 0 to StringGrid1.ColCount-1 do
    StringGrid1.Cells[c,StringGrid1.RowCount-1]:='';
end;

function TForm83.JCxmlb: Boolean;
var
  a,b: Integer;
begin
  JCxmlb := True;
  For a := 1 to StringGrid1.RowCount-1 do
    For b := 0 to StringGrid1.ColCount-1 do
      if Trim(StringGrid1.Cells[b,a])='' then
      begin
        Jcxmlb := False;
        break;
      end;
end;

procedure TForm83.ListBox1DblClick(Sender: TObject);
begin
  with Data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 工资发放 where 员工编号 = :a');
    Parameters.ParamByName('a').Value := Trim(ListBox1.Items[ListBox1.ItemIndex]);
    OPen;
  end;
  StringGrid1.Cells[0,x]:= Data3.ADOQuery1.FieldByName('员工编号').Value;
  StringGrid1.Cells[1,x]:= Data3.ADOQuery1.FieldByName('员工姓名').Value ;
  StringGrid1.Cells[2,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('基本工资').Value);
  StringGrid1.Cells[3,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('职务工资').Value);
  StringGrid1.Cells[4,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('工龄工资').Value);
  StringGrid1.Cells[5,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('养老保险金').Value);
  StringGrid1.Cells[10,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('个人所得税').Value);
  StringGrid1.Cells[11,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('住房补助').Value);
  StringGrid1.Cells[13,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('保险费').Value);
  StringGrid1.Cells[14,x]:= FloatToStr(Data3.ADOQuery1.FieldByName('生活补助').Value);
  with Data3.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 余额 from 工资发放明细表 where 员工编号 = :c and year(时间) = :a and month(时间) = :b');
    //如果当前月份是一月，上月余额应为上一年十二月份的余额
    if Month1 >1 then
    begin
      Parameters.ParamByName('a').Value := Year1;
      Parameters.ParamByName('b').Value := Month1-1;
    end
    else
    begin
      Parameters.ParamByName('a').Value := Year1-1;
      Parameters.ParamByName('b').Value := 12;
    end;
    Parameters.ParamByName('c').Value := Trim(StringGrid1.Cells[0,x]);
    Open;
  end;
  if Data3.ADOQuery2.FieldByName('余额').Value = Null then
    StringGrid1.Cells[12,x] := '0'
  else
    StringGrid1.Cells[12,x] := FloatToStr(Data3.ADOQuery2.FieldByName('余额').Value);
  StringGrid1.SetFocus;
  StringGrid1.Col := 6;
  ListBox1.Visible := False;
end;

function TForm83.IsNull: Boolean;
var
  a: integer;
begin
  IsNull := False;
  For a := 0 to StringGrid1.ColCount-1 do
    if Trim(StringGrid1.Cells[a,x])='' then
    begin
      IsNull := True;
      Break;
    end;
end;

procedure TForm83.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_ReTurn then
    ListBox1.OnDblClick(Sender);
end;

procedure TForm83.Clear;
var
  a,b: Integer;
begin
  For a := 1 to StringGrid1.RowCount-1 do
    For b := 0 to StringGrid1.ColCount-1 do
      StringGrid1.Cells[b,a]:= '';
  StringGrid1.RowCount := 2;
  StringGrid1.SetFocus;
  StringGrid1.Col := 1;
end;

procedure TForm83.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Clear;
end;

procedure TForm83.BitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if Jcxmlb = True then
  begin
    if iscf = True then
    begin
      Application.MessageBox('员工信息不能重复。','提示',64);
      Exit;
    end;
    if Biscf = False then
    begin
      Try
        For i := 1 to StringGrid1.RowCount-1 do
        begin
          with Data3.ADOQuery2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert 工资发放明细表 values(:a ,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,Default)');
            Parameters.ParamByName('a').Value := Trim(StringGrid1.Cells[0,i]);
            Parameters.ParamByName('b').Value := Trim(StringGrid1.Cells[1,i]);
            Parameters.ParamByName('c').Value := StrToFloat(StringGrid1.Cells[2,i]);
            Parameters.ParamByName('d').Value := StrToFloat(StringGrid1.Cells[3,i]);
            Parameters.ParamByName('e').Value := StrToFloat(StringGrid1.Cells[4,i]);
            Parameters.ParamByName('f').Value := StrToFloat(StringGrid1.Cells[5,i]);
            Parameters.ParamByName('g').Value := StrToInt(StringGrid1.Cells[6,i]);
            Parameters.ParamByName('h').Value := StrToFloat(StringGrid1.Cells[7,i]);
            Parameters.ParamByName('i').Value := StrToInt(StringGrid1.Cells[8,i]);
            Parameters.ParamByName('j').Value := StrToFloat(StringGrid1.Cells[9,i]);
            Parameters.ParamByName('k').Value := StrToFloat(StringGrid1.Cells[10,i]);
            Parameters.ParamByName('l').Value := StrToFloat(StringGrid1.Cells[11,i]);
            Parameters.ParamByName('m').Value := StrToFloat(StringGrid1.Cells[13,i]);
            Parameters.ParamByName('n').Value := StrToFloat(StringGrid1.Cells[14,i]);
            Parameters.ParamByName('o').Value := StrToFloat(StringGrid1.Cells[15,i]);
            Parameters.ParamByName('p').Value := StrToFloat(StringGrid1.Cells[16,i]);
            ExecSQL;
          end;
        end;
        Application.MessageBox('操作成功。','提示',64);
        Clear;
      Except
        Application.MessageBox('系统出错。','提示',64);
        Close;
      end;
    end;
  end
  else
    Application.MessageBox('项目列表有误。','提示',64);
end;

function TForm83.isCF: Boolean;
var
  a,b: Integer;
begin
  iscf := False;
  if StringGrid1.RowCount>3 then
  begin
    For a := 1 to StringGrid1.RowCount-2 do
      For b := a +1 to StringGrid1.RowCount-1 do
      if Trim(StringGrid1.Cells[0,a])= Trim(StringGrid1.Cells[0,b]) then
      begin
        Iscf := True;
        Break;
      end;
  end
  else if StringGrid1.RowCount=3 then
  begin
    if Trim(StringGrid1.Cells[0,1])=Trim(StringGrid1.Cells[0,2]) then
      Iscf := True;
  end;
end;

function TForm83.Biscf: Boolean;
var
  m: Integer;
  Year1,Month1,Day1: Word;
begin
  Biscf := False;
  DecodeDate(Now(),year1,month1,day1);
  For m := 1 to StringGrid1.RowCount-1 do
  begin
    with Data3.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * From 工资发放明细表 where 员工编号 =:a and year(时间) = :b and Month(时间)= :c');
      Parameters.ParamByName('a').Value := Trim(StringGrid1.Cells[0,m]);
      Parameters.ParamByName('b').Value := Year1;
      parameters.ParamByName('c').Value := Month1;
      Open;
    end;
    if Data3.ADOQuery1.RecordCount>0 then
    begin
      Biscf := True;
      Application.MessageBox(Pchar('员工编号为'+ StringGrid1.Cells[0,m] +'的员工本月工资已发放。'),'提示',64);
      Break;
    end;
  end;
end;
end.
