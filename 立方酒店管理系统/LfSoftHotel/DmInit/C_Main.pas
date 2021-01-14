unit C_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, DBTables, Buttons;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Memo1: TMemo;
    Table2: TTable;
    Database1: TDatabase;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//产生汉字串的拼音开头大写字母（常用汉字，用时需确定是否产生大写字母）
//此函数嵌套了GetPYIndexChar()函数
function GetPYIndexChar( hzchar:string):char;
begin
  case WORD(hzchar[1]) shl 8 + WORD(hzchar[2]) of
    $B0A1..$B0C4 : result := 'A';
    $B0C5..$B2C0 : result := 'B';
    $B2C1..$B4ED : result := 'C';
    $B4EE..$B6E9 : result := 'D';
    $B6EA..$B7A1 : result := 'E';
    $B7A2..$B8C0 : result := 'F';
    $B8C1..$B9FD : result := 'G';
    $B9FE..$BBF6 : result := 'H';
    $BBF7..$BFA5 : result := 'J';
    $BFA6..$C0AB : result := 'K';
    $C0AC..$C2E7 : result := 'L';
    $C2E8..$C4C2 : result := 'M';
    $C4C3..$C5B5 : result := 'N';
    $C5B6..$C5BD : result := 'O';
    $C5BE..$C6D9 : result := 'P';
    $C6DA..$C8BA : result := 'Q';
    $C8BB..$C8F5 : result := 'R';
    $C8F6..$CBF9 : result := 'S';
    $CBFA..$CDD9 : result := 'T';
    $CDDA..$CEF3 : result := 'W';
    $CEF4..$D188 : result := 'X';
    $D1B9..$D4D0 : result := 'Y';
    $D4D1..$D7F9 : result := 'Z';
  else
    result := char(0);
  end;
end;

//GetPYIndexChar()函数
//产生汉字的拼音开头大写字母（常用汉字，用时需确定是否产生大写字母）
function GetIndexStr(hzchar:Widestring):string;
var
    i:      integer;
    tStr:   WideString;
begin
    for i := 1 to length(hzchar) do
    begin
        tStr := GetPYIndexChar(hzchar[i]);
        if tStr = #0 then
            result := result + UPPERCASE(hzchar[i])
        else
            result := result + LowerCase(tStr);
    end
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  F : TextFile;
  AFileName : string;
begin
  if SaveDialog1.Execute then
  begin
    AFileName := SaveDialog1.FileName;
    AssignFile(F,AFileName);
    Rewrite(F);
    Table1.First;
    while not Table1.Eof do
    begin
      WriteLn(F,Table1.FieldByName('NAME').AsString);
      Table1.Next;
    end;
    CloseFile(F);
    ShowMessage('OK');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  F : TextFile;
  AFileName : string;
  s : string;
begin
  if OpenDialog1.Execute then
  begin
    AFileName := OpenDialog1.FileName;
    AssignFile(F,AFileName);
    Reset(F);
    while not Eof(F) do
    begin
      ReadLn(F,s);
      Memo1.Lines.Add(s);
    end;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  i: Integer;
begin
  with Table2 do
  begin
    for i:= 2301 to 2322 do
    begin
      Insert;
      FieldByName('D_KFBH').AsString := IntToStr(i);
      FieldByName('D_KFMC').AsString := IntToStr(i)+'房';
      FieldByName('D_BZFJ').AsCurrency := 200;
      FieldByName('D_FXBH').AsString := '01';
      FieldByName('D_LCBH').AsString := '23';
      FieldByName('D_CWS').AsInteger := 2;
      Post;
    end;
  end;
  ShowMessage('OK');
end;

end.
