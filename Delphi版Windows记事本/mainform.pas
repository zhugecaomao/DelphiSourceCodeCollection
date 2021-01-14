//------------------------------------------------------------------------------
//有點地方還需要改進......
//屏幕會抖，得想辦法解決.
//皮服的標題怎麼改呢？
//------------------------------------------------------------------------------
unit mainform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ExtCtrls, ComCtrls, ToolWin, StdCtrls, MPlayer,unit2,
  WinSkinData,Clipbrd,strutils;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    x1: TMenuItem;
    ImageList1: TImageList;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton15: TToolButton;
    Memo1: TMemo;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    SkinData1: TSkinData;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N20: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    PageSetupDialog1: TPageSetupDialog;
    PrintDialog1: TPrintDialog;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    FontDialog1: TFontDialog;
    N29: TMenuItem;
    StatusBar1: TStatusBar;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    procedure x1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Memo1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
  private
    procedure openfileskin(var skinname:string);
    procedure savedialog;
    procedure opendialog;
    function searchmemo(memo:Tcustomedit;const searchstring:string;options:TfindOptions):boolean;
    function SearchBuf(Buf: PChar; BufLen: Integer;SelStart, SelLength: Integer;SearchString: String;Options: TFindOptions): PChar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  filename:TFilename;
  skinname,fileskin,str:string;
const
  WordDelimiters: set of Char = [#0..#255] - ['a'..'z','A'..'Z','1'..'9','0'];
implementation

{$R *.dfm}


procedure TForm1.x1Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.N2Click(Sender: TObject);
var rt:integer;
begin
if memo1.Modified then
begin
  rt:=application.MessageBox('文件無標題文字已經改變。'+#13+'想保存文件嗎？','寫字板',mb_yesnocancel+mb_iconquestion);
  case rt of
     idyes:  if extractfilename(filename)='*.txt' then
             begin
               savedialog;
               opendialog;
             end
             else
             begin
               memo1.Lines.SaveToFile(filename);
               opendialog;
             end;
     idno:opendialog;
     else exit;
  end;
end else
opendialog;
end;

procedure TForm1.opendialog;
begin
  if opendialog1.Execute then
  begin
    filename:=opendialog1.FileName;
    memo1.Lines.LoadFromFile(filename);
    n30.Enabled:=false;
  end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  memo1.CutToClipboard;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
memo1.CopyToClipboard;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
memo1.PasteFromClipboard;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if extractfilename(filename)<>'*.txt' then
begin
  memo1.Lines.SaveToFile(filename);
  memo1.Clear;
  memo1.Lines.LoadFromFile(filename);
end
else
    if savedialog1.Execute then
    begin
      filename:=savedialog1.filename;
      memo1.lines.savetofile(filename);
      memo1.Clear;
      memo1.Lines.LoadFromFile(filename);
    end;
end;

procedure TForm1.N5Click(Sender: TObject);
var rt:integer;
begin
if memo1.Modified then
begin
  rt:=application.MessageBox ('文件無題文字已經改變。'+#13+'想保存文件嗎？','寫字板',mb_yesnocancel+mb_iconquestion);
  case rt of
    idyes:if extractfilename(filename)='*.txt' then
          begin
            savedialog;
            memo1.Clear;
            filename:=extractfilepath(savedialog1.FileName)+'*.txt';
            n30.Enabled:=false;
          end
          else
          begin
            memo1.Lines.SaveToFile(filename);
            memo1.Clear;
            filename:=extractfilepath(savedialog1.FileName)+'*.txt';
            n30.Enabled:=false;
          end;
    idno: begin
            memo1.Clear;
            filename:=extractfilepath(savedialog1.FileName)+'*.txt';
            n30.Enabled:=false;
          end;
    else  exit;
  end;
end
else
begin
memo1.Clear;
filename:=extractfilepath(savedialog1.FileName)+'*.txt';
n30.Enabled:=false;
end;
end;

procedure Tform1.savedialog;
begin
if savedialog1.Execute  then
begin
  filename:=savedialog1.FileName;
  memo1.Lines.SaveToFile(filename);
end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var result:integer;
begin
if memo1.Modified  then
begin
  result:=application.Messagebox('文件內容已經改變。'+#13+'想保存文件嗎？','寫字板',mb_yesnocancel+mb_iconquestion);
  case  result of
    idyes: N3Click(nil);
    idcancel:canclose:=false;
    else  canclose:=true;
  end;
end;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
N5click(nil);
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
 N2click(nil);
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  n3click(nil);
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
 n8click(nil);
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  n7click(nil);
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
 n9click(nil);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
filename:=savedialog1.FileName;
skinname:='skin1.skn';
openfileskin(skinname);
str:=' Val 0,Col 0';
statusbar1.Panels[1].Text:=str;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
form2.ShowModal;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
application.MessageBox('寫字板人人都會用，就不用幫助了吧！','寫字板',mb_ok);
end;

procedure TForm1.openfileskin(var skinname:string);
begin
fileskin:=extractfilepath(application.exename)+skinname;
if fileexists(fileskin) then
begin
  skindata1.LoadFromFile(fileskin);
  skindata1.Active:=true;
end
else
  skindata1.Active:=false;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
skinname:='skin2.skn';
openfileskin(skinname);
end;

procedure TForm1.N19Click(Sender: TObject);
begin
skinname:='skin1.skn';
openfileskin(skinname);

end;

procedure TForm1.N22Click(Sender: TObject);
begin
skinname:='skin3.skn';
openfileskin(skinname);
end;

procedure TForm1.N41Click(Sender: TObject);
begin
skinname:='skin4.skn';
openfileskin(skinname);
end;

procedure TForm1.N51Click(Sender: TObject);
begin
skinname:='skin5.skn';
openfileskin(skinname);
end;

procedure TForm1.N18Click(Sender: TObject);
begin
skindata1.Active:=false;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
if savedialog1.execute then
begin
  filename:=savedialog1.filename;
  memo1.lines.savetofile(filename);
  memo1.Clear;
  memo1.Lines.LoadFromFile(filename);
end;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
printdialog1.Execute
end;

procedure TForm1.N23Click(Sender: TObject);
begin
PageSetupDialog1.Execute;
end;

procedure TForm1.N27Click(Sender: TObject);
begin
if fontDialog1.Execute then
  memo1.Font:=fontdialog1.Font;
end;

procedure TForm1.N28Click(Sender: TObject);
begin
if n28.Checked then
begin
  memo1.WordWrap:=true;
  memo1.ScrollBars:=ssvertical;
end
else
begin
  memo1.WordWrap:=false;
  memo1.ScrollBars:=ssboth;
end;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
if n29.Checked then
  statusbar1.Visible:=true
else
  statusbar1.Visible:=false;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  statusbar1.Panels[0].Width:=round(memo1.Width*11/15);
end;

procedure TForm1.Memo1Click(Sender: TObject);
begin
str:=' Val '+inttostr(memo1.CaretPos.y)+',Col '+inttostr(memo1.CaretPos.x);
statusbar1.Panels[1].Text:=str;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
str:=' Val '+inttostr(memo1.CaretPos.y)+',Col '+inttostr(memo1.CaretPos.x);
statusbar1.Panels[1].Text:=str;
if n30.Enabled=false then
  n30.Enabled:=true;

end;

procedure TForm1.N39Click(Sender: TObject);
begin
memo1.SelectAll;
end;

procedure TForm1.N40Click(Sender: TObject);
begin
memo1.SelText:=datetostr(now);
{var sTmp: string; 　*sendmessage()*
begin
  sTmp := Memo1.Lines[1];
  Insert('borland', sTmp, 4);
  Memo1.Lines[1] := sTmp;
end;
}
end;

procedure TForm1.N30Click(Sender: TObject);
begin
  memo1.Undo;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
  memo1.ClearSelection;
end;

procedure TForm1.N37Click(Sender: TObject);
var a:string;
b,c,d,s,i:integer;
begin
s:=0;
a:=inputbox('轉到以下行','行號:',inttostr(memo1.CaretPos.Y));
d:=strtoint(a);
if (d>=0) and (d<=memo1.Lines.Count) then
  for i:=0 to d-1 do
  begin
    b:=SendMessage(memo1.Handle,EM_LINEINDEX,i,0);
    c:=SendMessage(memo1.handle,EM_LINELENGTH,b,0)+2;
    s:=s+c;
  end
else
  showmessage('行號超出範圍！');
memo1.SelStart:=s;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
finddialog1.Execute;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if memo1.sellength>0 then
begin
  n7.Enabled:=true;
  n8.Enabled:=true;
  n32.Enabled:=true;
end
else
begin
  n7.Enabled:=false;
  n8.Enabled:=false;
  n32.Enabled:=false;
end;
if Clipboard.HasFormat(CF_TEXT) then
  n9.Enabled:=true
else
  n9.Enabled:=false;
end;
//真麻煩，用 richedit容易多了......
function TForm1.SearchMemo(memo:Tcustomedit;const searchstring:string;options:TfindOptions):Boolean;
var
buffer,p:pchar;
size:word;
begin
result:=false;
if length(searchstring)=0 then exit;
size:=memo.GetTextLen;
if size=0 then exit;
buffer:=stralloc(size+1);
try
  memo.GetTextBuf(buffer,size+1);
  p:=searchbuf(buffer,size,memo.SelStart,memo.SelLength,searchstring,options);
  if p<>nil then
  begin
    memo.SetFocus;
    memo.SelStart:=p-buffer;
    memo.SelLength:=length(searchstring);
    result:=true;
  end;
finally
  strdispose(buffer);
end;
end;

function TForm1.SearchBuf(Buf: PChar; BufLen: Integer;SelStart, SelLength: Integer;SearchString: String;Options: TFindOptions): PChar;
var
  SearchCount,I:integer;
  C:char;
  Direction:shortint;
  CharMap:array[Char] of Char;
  function FindNextWordStart(var BufPtr: PChar): Boolean;
  begin
    result:=false;
    while (SearchCount>0) and((Direction=1)xor(BufPtr^in WordDelimiters)) do
    begin
         Inc(BufPtr, Direction);
         Dec(SearchCount);
    end;
    while (SearchCount>0) and((Direction=-1)xor(BufPtr^in WordDelimiters)) do
    begin
         Inc(BufPtr, Direction);
         Dec(SearchCount);
    end;
    Result:=SearchCount>0;
    if Direction=-1 then
    begin
      Dec(BufPtr, Direction);
      Inc(SearchCount);
    end;
  end;
begin
  Result := nil;
  if BufLen<= 0 then Exit;
    if frDown in Options then
      begin
        Direction:=1;
        Inc(SelStart,SelLength);
            SearchCount:= BufLen-SelStart-Length(SearchString);
        if SearchCount<0 then Exit;
        if Longint(SelStart)+SearchCount>BufLen then Exit;
      end
    else
      begin
        Direction := -1;
        Dec(SelStart, Length(SearchString));
        SearchCount := SelStart;
      end;
  if (SelStart < 0) or (SelStart > BufLen) then Exit;
  Result := @Buf[SelStart];
  for C:=Low(CharMap) to High(CharMap) do
    CharMap[C] := C;
  if not (frMatchCase in Options) then
  begin
    AnsiUpperBuff(PChar(@CharMap),sizeof(CharMap));
    AnsiUpperBuff(@SearchString[1],Length(SearchString));
  end;
    while SearchCount > 0 do
     begin
       if frWholeWord in Options then
         if not FindNextWordStart(Result) then Break;
       I := 0;
       while (CharMap[Result[I]] = SearchString[I+1]) do
       begin
         Inc(I);
         if I >= Length(SearchString) then
         begin
           if (not (frWholeWord in Options)) or
              (SearchCount = 0) or
              (Result[I] in WordDelimiters) then
             Exit;
           Break;
         end;
       end;
       Inc(Result, Direction);
       Dec(SearchCount);
     end;
     Result := nil;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
begin
  if not searchmemo(memo1,finddialog1.findtext,finddialog1.options) then
  showmessage('找不到'+'"'+finddialog1.FindText+'"');
end;

procedure TForm1.Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if length(memo1.Text)=0 then
begin
  n35.Enabled:=false;
  n34.Enabled:=false;
end
else
begin
  n35.Enabled:=true;
  n34.Enabled:=true;
end;
end;


procedure TForm1.N35Click(Sender: TObject);
begin
if finddialog1.FindText='' then
 finddialog1.Execute
else
FindDialog1Find(nil);
end;

procedure TForm1.N36Click(Sender: TObject);
begin
replacedialog1.Execute;
end;

procedure TForm1.ReplaceDialog1Find(Sender: TObject);
begin
if not SearchMemo(Memo1,replacedialog1.FindText, replacedialog1.Options) then
 showmessage('找不到'+'"'+replacedialog1.FindText+'"');
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
var
 found:boolean;
begin
with ReplaceDialog1 do
begin
  if  ansicomparetext(memo1.SelText,FindText)=0 then
    memo1.SelText:=ReplaceText;
  found:=SearchMemo(Memo1, FindText, Options);
  while found and (frreplaceall in options) do
  begin
    memo1.SelText:=replacetext;
    found:=SearchMemo(Memo1, FindText, Options);
  end;
  if (not found) and (frreplace in options) then
  showmessage('找不到'+'"'+FindText+'"');
end;
end;

end.


