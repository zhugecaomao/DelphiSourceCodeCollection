unit ygfdgzgl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mp, ExtCtrls, StdCtrls, Buttons, Grids, jpeg;

type
  TForm82 = class(TForm41)
    Image1: TImage;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    Procedure Clear;
    Procedure ClearString;
    Procedure ClearStringEnd;
    Function Biscf: Boolean;//判断员工信息在员工基础信息表中是否存在
    Function Iscf: Boolean;  //判断列表项是否有重复选项
    Function IsNull: Boolean;
    Function JCXmlb: Boolean;
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form82: TForm82;
  x,y: Integer;
implementation

uses dataa;

{$R *.dfm}

procedure TForm82.FormShow(Sender: TObject);
var
  i: Integer;
begin
  StringGrid1.Cells[0,0]:='         员工编号';
  StringGrid1.Cells[1,0]:='       员工姓名' ;
  StringGrid1.Cells[2,0]:='   住房补助';
  StringGrid1.Cells[3,0]:='    生活补助';
  StringGrid1.Cells[4,0]:='      保险费';
  StringGrid1.Cells[5,0]:=' 个人所得税';
  with Data3.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 员工编号,员工姓名 from 员工基础信息表 where 员工编号 not in(select 员工编号 from 员工浮动工资项目表)');
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
      inc(i);
      Data3.ADOQuery1.Next;
    end;
  end
  else
    Application.MessageBox('当前没有可录入的员工信息.','提示',64);
end;

procedure TForm82.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TBitBtn(Sender).Font.Color := clRed;
end;

procedure TForm82.BitBtn1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TBitBtn(Sender).Font.Color :=clBlue;
end;

procedure TForm82.StringGrid1KeyPress(Sender: TObject; var Key: Char);
var
  mm: Boolean;
begin
  if(y = 2)or(y =3)or(Y = 4)or(y = 5)then
  begin
    mm := (Key <#8)or(Key >#8)and(Key <#46)or(Key>#46)and(Key<#48)or(Key>#57);
    if mm then
      Key := #0;
  end;
end;

procedure TForm82.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  y := ACol;
  x := ARow;
  if (ACol = 1)and( Trim(StringGrid1.Cells[0,x])='')or((ACol = 2)or(Acol = 3)or(Acol = 4)or(Acol = 5))and(Trim(StringGrid1.Cells[0,x])<>'') then
    StringGrid1.Options := StringGrid1.Options +[goEditing]
  else
    StringGrid1.Options := StringGrid1.Options -[goEditing];
end;

procedure TForm82.Clear;
var
  a,b: Integer;
begin
  For a := 1 to StringGrid1.RowCount-1 do
    For b := 0 to StringGrid1.ColCount-1 do
      StringGrid1.Cells[b,a]:='';
  StringGrid1.RowCount := 2;
  StringGrid1.SetFocus;
  StringGrid1.Col := 1;
end;
procedure TForm82.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Clear;
end;

procedure TForm82.ListBox1DblClick(Sender: TObject);
begin
  StringGrid1.Cells[0,x]:= ListBox1.Items[ListBox1.ItemIndex];
  ListBox1.Visible := False;
  StringGrid1.SetFocus;
  StringGrid1.Col := 2;
end;

procedure TForm82.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    ListBox1.OnDblClick(Sender);
end;

procedure TForm82.StringGrid1KeyDown(Sender: TObject; var Key: Word;
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
        StringGrid1.Col := 1;
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
      SQL.Add('Select * from 员工基础信息表 where 员工姓名 = :a');
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
      end
      else
      begin
        StringGrid1.Cells[0,x]:= Data3.ADOQuery1.FieldByName('员工编号').Value;
        StringGrid1.Col := 2;
      end;
    end
    else
    begin
      StringGrid1.Cells[1,x]:= '';
      Application.MessageBox('该员工不存在，请重新输入。','提示',64);
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
procedure TForm82.ClearString;
var
  c: Integer;
begin
  For c := 0 to StringGrid1.ColCount-1 do
    StringGrid1.Cells[c,x]:='';
end;

procedure TForm82.ClearStringEnd;
var
  c: Integer;
begin
  For c := 0 to StringGrid1.ColCount-1 do
    StringGrid1.Cells[c,StringGrid1.RowCount-1]:='';
end;


function TForm82.Biscf: Boolean;
var
  m: Integer;
begin
  Biscf := False;
  For m := 1 to StringGrid1.RowCount-1 do
  begin
    with Data3.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * From 员工浮动工资项目表 where 员工编号 =:a');
      Parameters.ParamByName('a').Value := Trim(StringGrid1.Cells[0,m]);
      Open;
    end;
    if Data3.ADOQuery1.RecordCount>0 then
    begin
      Biscf := True;
      Application.MessageBox(Pchar('员工编号为'+ StringGrid1.Cells[0,m] +'的员工信息已经存在。'),'提示',64);
      Break;
    end;
  end;
end;

function TForm82.Iscf: Boolean;
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

function TForm82.IsNull: Boolean;
var
  a: Integer;
begin
  IsNull := False;
  For a:= 0 to StringGrid1.ColCount -1 do
  begin
    if Trim(Stringgrid1.Cells[a,x])='' then
    begin
      IsNull := True;
      Break;
    end;
  end;
end;
function TForm82.JCXmlb: Boolean;
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

procedure TForm82.BitBtn1Click(Sender: TObject);
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
            SQL.Add('insert 员工浮动工资项目表 values(:a ,:b,:c,:d,:e,:f)');
            Parameters.ParamByName('a').Value := Trim(StringGrid1.Cells[0,i]);
            Parameters.ParamByName('b').Value := Trim(StringGrid1.Cells[1,i]);
            Parameters.ParamByName('c').Value := StrToFloat(StringGrid1.Cells[5,i]);
            Parameters.ParamByName('d').Value := StrToFloat(StringGrid1.Cells[2,i]);
            Parameters.ParamByName('e').Value := StrToFloat(StringGrid1.Cells[4,i]);
            Parameters.ParamByName('f').Value := StrToFloat(StringGrid1.Cells[3,i]);
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
end.
