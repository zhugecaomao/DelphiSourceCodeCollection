unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CPortCtl, Buttons, ComCtrls, SkinCaption,
  WinSkinStore, WinSkinData, CPort;

type
  Tfrmcom = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shpcom: TShape;
    btnopencom: TButton;
    Panel2: TPanel;
    combport: TComComboBox;
    combbuarte: TComComboBox;
    combdata: TComComboBox;
    combparity: TComComboBox;
    combstopbit: TComComboBox;
    btnrecclean: TButton;
    btnstoprec: TButton;
    stxrec: TStaticText;
    chkautoclean: TCheckBox;
    chkrechex: TCheckBox;
    btnsave: TButton;
    btnturn: TButton;
    stxrecsave: TStaticText;
    Panel3: TPanel;
    combsecond: TComboBox;
    Label6: TLabel;
    chkauto: TCheckBox;
    chkhex: TCheckBox;
    btnsendclean: TBitBtn;
    StaticText3: TStaticText;
    btnsend: TButton;
    Panel4: TPanel;
    StatusBar1: TStatusBar;
    Panel5: TPanel;
    Panel6: TPanel;
    btnselectfile: TButton;
    btnsendfile: TBitBtn;
    memsend: TMemo;
    btncountzero: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btncommand1: TButton;
    btncommand2: TButton;
    btncommand3: TButton;
    Label10: TLabel;
    TrbTransparence: TTrackBar;
    Button12: TButton;
    chktop: TCheckBox;
    Label11: TLabel;
    btncommand5: TButton;
    Label12: TLabel;
    btncommand4: TButton;
    Label13: TLabel;
    btncommand6: TButton;
    Label14: TLabel;
    SkinData1: TSkinData;
    SkinStore1: TSkinStore;
    SkinCaption1: TSkinCaption;
    com: TComPort;
    cpdrec: TComDataPacket;
    OpenDialog1: TOpenDialog;
    edtsendfile: TEdit;
    tmsendauto: TTimer;
    memcommand1: TMemo;
    memcommand2: TMemo;
    memcommand4: TMemo;
    memcommand3: TMemo;
    memcommand6: TMemo;
    memcommand5: TMemo;
    memrec: TRichEdit;
    chkcrc8: TCheckBox;
    edtcrc8: TEdit;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TrbTransparenceChange(Sender: TObject);
    procedure chktopClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure combportChange(Sender: TObject);
    procedure btnopencomClick(Sender: TObject);
    procedure combbuarteChange(Sender: TObject);
    procedure combparityChange(Sender: TObject);
    procedure btnreccleanClick(Sender: TObject);
    procedure btnstoprecClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btnturnClick(Sender: TObject);
    procedure btnsendcleanClick(Sender: TObject);
    procedure btnselectfileClick(Sender: TObject);
    procedure cpdrecPacket(Sender: TObject; const Str: String);
    procedure btnsendClick(Sender: TObject);
    procedure chkautoClick(Sender: TObject);
    procedure tmsendautoTimer(Sender: TObject);
    procedure btnsendfileClick(Sender: TObject);
    procedure btncountzeroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncommand1Click(Sender: TObject);
    procedure btncommand2Click(Sender: TObject);
    procedure btncommand3Click(Sender: TObject);
    procedure btncommand4Click(Sender: TObject);
    procedure btncommand5Click(Sender: TObject);
    procedure btncommand6Click(Sender: TObject);
    procedure combdataChange(Sender: TObject);
    procedure chkcrc8Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
  private
    bstop:boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcom: Tfrmcom;

implementation
uses   FileCtrl;
{$R *.dfm}
//接收1个字符，转换成功输出字符对应的数，转换失败输出-1
function hex(c:char):integer;
var
  x:integer;
begin
  //if c='' then
    //x:=0
  //else
  if (ord(c)>=ord('0'))and(ord(c)<=ord('9'))then
    x:=ord(c)-ord('0')
  else if (ord(c)>=ord('a'))and(ord(c)<=ord('f'))then
    x:=ord(c)-ord('a')+10
  else if (ord(c)>=ord('A'))and(ord(c)<=ord('F'))then
    x:=ord(c)-ord('A')+10
  else
    x:=-1;
    result:=x;
end;

procedure Tfrmcom.FormCreate(Sender: TObject);
begin
 skindata1.LoadFromCollection(skinstore1,0);
 skindata1.Active:=true;
 memrec.Text :='';

 try
  com.Connected :=true;
  if com.Connected then
  begin
  shpcom.Brush.Color:=clred;
  shpcom.Pen.Color  :=clwhite;
  statusbar1.Panels[0].Text:= com.Port+'打开,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
  btnopencom.Caption :='关闭串口';
  end;
 except
  shpcom.Brush.Color:=clblack;
  shpcom.Pen.Color  :=clwhite;
  com.Close;
  statusbar1.Panels[0].Text:= com.Port+'关闭,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
  showmessage('没有发现此串口');
 end;
 try
 memcommand1.Lines.LoadFromFile('c:\comdata\command1.txt');
 memcommand2.Lines.LoadFromFile('c:\comdata\command2.txt');
 memcommand3.Lines.LoadFromFile('c:\comdata\command3.txt');
 memcommand4.Lines.LoadFromFile('c:\comdata\command4.txt');
 memcommand5.Lines.LoadFromFile('c:\comdata\command5.txt');
 memcommand6.Lines.LoadFromFile('c:\comdata\command6.txt');
 except
  MkDir('c:\comdata');
 end;

end;

procedure Tfrmcom.TrbTransparenceChange(Sender: TObject);
begin
   frmcom.AlphaBlend :=true;
   frmcom.AlphaBlendValue:= TrbTransparence.Position *20;
end;

procedure Tfrmcom.chktopClick(Sender: TObject);
begin
 if  chktop.Checked then
   SetWindowPos(frmcom.handle, HWND_TOPMOST, frmcom.Left, frmcom.Top, frmcom.Width, frmcom.Height,0) 
 else
   SetWindowPos(frmcom.handle, HWND_NOTOPMOST, frmcom.Left, frmcom.Top, frmcom.Width, frmcom.Height,0);

end;

procedure GenerateCRC8(value:byte; var CrcValue:byte);
var
  CRC:word;
begin
  crc:= crcvalue xor value;
  crc:= crc xor (crc shl 1) xor (crc shl 2) xor (crc shl 3) xor (crc shl 4)
         xor (crc shl 5) xor (crc shl 6) xor (crc shl 7);
  crc:= (crc and $fe) xor ((crc shr 8) and $01);
  crcValue:= Crc;
end;

function GetCrc8(AStr: string; Count:integer):Byte;
var
  i:integer;
begin
  result:= 0;
  for i:= 1 to count do
    GenerateCRC8(ord(Astr[i]), result);
  result:= result xor $ff;
end;

function  Changefjbh(Afjbh:string): string;
var
  Lfjbh: Char;
  i: Integer;
begin
  result:='';
  for i:= 1 to length(Afjbh) div 2 do
  begin
    Lfjbh:= chr(strtoint('$' + copy(Afjbh, i*2-1,2)));
    result:= result + lfjbh;
  end;
end;

procedure Tfrmcom.Button12Click(Sender: TObject);
begin
    close;
 if com.Connected   then
    com.Close;
end;

procedure Tfrmcom.combportChange(Sender: TObject);
begin
 if com.Connected then com.Close;

 com.Port :=combport.Text;
 try
  com.Open;
  shpcom.Brush.Color:=clred;
  shpcom.Pen.Color  :=clwhite;
  btnopencom.Caption :='关闭串口';
   statusbar1.Panels[0].Text:= com.Port+'打开,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
 except
  shpcom.Brush.Color:=clblack;
  shpcom.Pen.Color  :=clwhite;
  com.Close;
  statusbar1.Panels[0].Text:= com.Port+'关闭,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
  showmessage('没有发现此串口');
  btnopencom.Caption :='打开串口';
 end;
end;

procedure Tfrmcom.btnopencomClick(Sender: TObject);
begin
  if btnopencom.Caption = '打开串口' then
  begin
    try
      com.Connected :=true;
      if com.Connected then
      begin
      shpcom.Brush.Color:=clred;
      shpcom.Pen.Color  :=clwhite;
      statusbar1.Panels[0].Text:= com.Port+'打开,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);

      btnopencom.Caption :='关闭串口';
      end;
      


    except
      statusbar1.Panels[0].Text:= com.Port+'关闭,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
      btnopencom.Caption :='打开串口';
      shpcom.Brush.Color:=clblack;
      shpcom.Pen.Color  :=clwhite;
      com.Close;
     showmessage('没有发现此串口');
    end;
 end
 else
 if btnopencom.Caption = '关闭串口' then
 begin
   com.Close;
   statusbar1.Panels[0].Text:= com.Port+'关闭,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
   shpcom.Brush.Color:=clblack;
   shpcom.Pen.Color  :=clwhite;
   btnopencom.Caption :='打开串口';
 end;

end;

procedure Tfrmcom.combbuarteChange(Sender: TObject);
begin
 if com.Connected then com.Close;
 com.BaudRate :=strtoBaudRate (combbuarte.text);
 try
  com.Open;
  if com.Connected then
  begin
  shpcom.Brush.Color:=clred;
  shpcom.Pen.Color  :=clwhite;
  statusbar1.Panels[0].Text:= com.Port+'打开,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
  btnopencom.Caption :='关闭串口';
  end;
 except
  shpcom.Brush.Color:=clblack;
  shpcom.Pen.Color  :=clwhite;
  com.Close;
  statusbar1.Panels[0].Text:= com.Port+'关闭,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
  showmessage('没有发现此串口');
  btnopencom.Caption :='打开串口';
 end;
end;

procedure Tfrmcom.combparityChange(Sender: TObject);
begin
 if com.Connected then com.Close;
 combparity.ApplySettings;
 try
  com.Open;
  if com.Connected then
  begin
  shpcom.Brush.Color:=clred;
  shpcom.Pen.Color  :=clwhite;
  statusbar1.Panels[0].Text:= com.Port+'打开,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
  btnopencom.Caption :='关闭串口';
  end;
 except
  shpcom.Brush.Color:=clblack;
  shpcom.Pen.Color  :=clwhite;
  com.Close;
  statusbar1.Panels[0].Text:= com.Port+'关闭,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);
  showmessage('没有发现此串口');
  btnopencom.Caption :='打开串口';
 end;
end;

procedure Tfrmcom.btnreccleanClick(Sender: TObject);
begin
 memrec.Text :='';
 memrec.SetFocus;
end;

procedure Tfrmcom.btnstoprecClick(Sender: TObject);
begin
 if btnstoprec.Caption ='停止显示' then
 begin

   btnstoprec.Caption :='继续显示';
   bstop:=true;
 end
 else
 begin
   btnstoprec.Caption :='停止显示';
   bstop:=false;
 end;
end;

procedure Tfrmcom.btnsaveClick(Sender: TObject);
var
 ds:TDatetime;
 filename:string;
begin
 ds:=now();
 ShortDateFormat := 'yyyymmddhhnnss';
 filename:=Datetostr(ds);
 memrec.Lines.SaveToFile(stxrecsave.Caption+'\'+filename+'.doc');
end;

procedure Tfrmcom.btnturnClick(Sender: TObject);
//const
// SELDIRHELP   =   1000;
var
  Dir:   string;
begin
   Dir   :=   'C:\COMDATA';
//  if   SelectDirectory(Dir,   [sdAllowCreate,   sdPerformCreate,   sdPrompt],SELDIRHELP)   then
   if SelectDirectory('请选择一个目录', '', Dir) then
   stxrecsave.Caption   :=Dir;
end;

procedure Tfrmcom.btnsendcleanClick(Sender: TObject);
begin
 memsend.Text :='';
 memsend.SetFocus;
end;

procedure Tfrmcom.btnselectfileClick(Sender: TObject);
begin
 if opendialog1.Execute then
    edtsendfile.text := opendialog1.FileName;
end;
{function  singletodouble(SingleStr: string): string;
var 
  i:integer; 
  temp:string; 
  single:char; 
  sinstr:string; 
begin  
  temp:='';
  i:=1; 
  sinstr:=SingleStr; 
  while i<=length(sinstr) do
  begin
     single:=sinstr[i];
     if  ord(single)<128 then
     begin
        temp:=temp+#163+chr(ord(single)+128); 
        inc(i); 
     end 
     else 
     begin 
        temp:=temp+copy(sinstr,i,2); 
        Inc(i,2);
     end;
  end;
   result:=temp; 
end;   }
procedure Tfrmcom.cpdrecPacket(Sender: TObject; const Str: String);
var
  strtemp:string;
 i,j:integer;
begin
  j:=0;
  j:=j+strtointdef(copy(StatusBar1.Panels[1].Text,4,length(StatusBar1.Panels[1].Text)-3),0);
  if chkrechex.Checked then
  begin
    for i:=1 to length(str) do
        //if str[i]<>' ' then
        begin
         strtemp := trim(strtemp+' '+inttohex(ord(str[i]),2));
         j:=j+1;
         StatusBar1.Panels[1].Text:='RX:'+inttostr(j);
        end;
    if not bstop   then
    memrec.Text:= trim(memrec.Text+' ' + strtemp) ;

  end
  else
  begin
    if not bstop   then
    memrec.Text :=memrec.Text +str;
    j:=j+length(str);
    StatusBar1.Panels[1].Text:='RX:'+inttostr(j);
  end;

 if chkautoclean.Checked then
    if memrec.Lines.Count>2000  then
       memrec.Text :='';
end;

function strtobcd(s:string):integer;

var
  tmpint1,tmpint2:integer;
begin
   if length(s)=1 then
   begin
    result:=hex(s[1]) ;
   end
   else
   begin
     if length(s)=2 then
     begin
      tmpint1:=hex(s[1]);
      tmpint2:=hex(s[2]);
      if (tmpint1=-1)or(tmpint2=-1) then
      begin
        result:=-1;
      end
      else
      begin
        result:=tmpint1*16+tmpint2;
      end;
     end
     else
       begin
         result:=-1;
       end;
   end;
end;
procedure Tfrmcom.btnsendClick(Sender: TObject);
var
 i,j,len:integer;
 crc8:integer;
 strsend:string;
 strtemp,strtempsend:string;
begin
  if chkhex.Checked then
  begin
     strsend :=memsend.Text;
     len :=length(strsend);
     for i:=1 to len do
     begin
       if strsend[i]<>' 'then
       strtempsend:=strtempsend+ strsend[i] ;
     end;
     strsend:=strtempsend;
     strtempsend:='';
     i:=1;
     j:=0;
     j:=j+strtointdef(copy(StatusBar1.Panels[2].Text,4,length(StatusBar1.Panels[2].Text)-3),0);
     len :=length(strsend);
     while i<len do
     begin
       try
        strtempsend:=strtempsend + chr(strtobcd(copy(strsend,i,2)));
        i:=i+2;
        j:=j+1;

        StatusBar1.Panels[2].Text:='TX:'+inttostr(j);
       except
       end;
     end;
     strsend :=strtempsend;
     if chkcrc8.Checked then
     begin
      crc8 :=GetCrc8(strsend,length(strsend));
      edtcrc8.Text :=inttohex(crc8,2);
      //edtcrc8.Text :=  inttostr(GetCrc8(strsend,length(strsend)));
      strsend :=strsend+chr(crc8);
     end;
     try
     com.WriteStr(strsend);
     except
     end;
  end
  else
  begin
     strsend :=memsend.Text;
     try
     com.WriteStr(strsend);
     except
     end;
     j:=0;
     j:=j+strtointdef(copy(StatusBar1.Panels[2].Text,4,length(StatusBar1.Panels[2].Text)-3),0);
     j:=j+length(strsend);
     StatusBar1.Panels[2].Text:='TX:'+inttostr(j);
  end;


end;


procedure Tfrmcom.chkautoClick(Sender: TObject);
begin
 if chkauto.Checked then
 begin
   tmsendauto.Interval:=strtointdef(combsecond.Text,1000);
   tmsendauto.Enabled :=true;
 end
 else
 begin
   tmsendauto.Enabled :=false;
 end;

end;

procedure Tfrmcom.tmsendautoTimer(Sender: TObject);
begin
  btnsendClick(self);
end;

procedure Tfrmcom.btnsendfileClick(Sender: TObject);
var
 f:TextFile;
 strsend:string;
 i,j:integer;
 ch:char;

begin
  AssignFile(f,edtsendfile.Text);
  try
  try
  reset(f);
  except
  end;
  i:=0;
  j:=0;
  j:=j+strtointdef(copy(StatusBar1.Panels[2].Text,4,length(StatusBar1.Panels[2].Text)-3),0);
  while not Eof(F) do
  begin
   Read(F,ch);
   i:=i+1;
   j:=j+1;
   StatusBar1.Panels[2].Text:='TX:'+inttostr(j);
   strsend:=strsend+ch;
  end;
  finally
   closefile(f);
  end;
  try
  com.WriteStr(strsend);
  except
  end;
end;

procedure Tfrmcom.btncountzeroClick(Sender: TObject);
begin
 StatusBar1.Panels[2].Text:='TX:'+inttostr(0);
 StatusBar1.Panels[1].Text:='RX:'+inttostr(0);
end;

procedure Tfrmcom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 try
 memcommand1.Lines.SaveToFile('c:\comdata\command1.txt');
 memcommand2.Lines.SaveToFile('c:\comdata\command2.txt');
 memcommand3.Lines.SaveToFile('c:\comdata\command3.txt');
 memcommand4.Lines.SaveToFile('c:\comdata\command4.txt');
 memcommand5.Lines.SaveToFile('c:\comdata\command5.txt');
 memcommand6.Lines.SaveToFile('c:\comdata\command6.txt');
 except
  MkDir('c:\comdata');
 end;

end;
procedure sendcommand(cmd:string);
var
 strsend,strtempsend:string;
 i,j,len,crc8:integer;
begin
  if frmcom.chkhex.Checked then
  begin
     strsend :=cmd;
     len :=length(strsend);
     for i:=1 to len do
     begin
       if strsend[i]<>' 'then
       strtempsend:=strtempsend+ strsend[i] ;
     end;
     strsend:=strtempsend;
     strtempsend:='';
     i:=1;
     j:=0;
     j:=j+strtointdef(copy(frmcom.StatusBar1.Panels[2].Text,4,length(frmcom.StatusBar1.Panels[2].Text)-3),0);
     len :=length(strsend);
     while i<len do
     begin
       try
        strtempsend:=strtempsend + chr(strtobcd(copy(strsend,i,2)));
        i:=i+2;
        j:=j+1;
        frmcom.StatusBar1.Panels[2].Text:='TX:'+inttostr(j);
       except
       end;
     end;
     strsend :=strtempsend;
     if frmcom.chkcrc8.Checked then
     begin
      crc8 :=GetCrc8(strsend,length(strsend));
      frmcom.edtcrc8.Text :=inttohex(crc8,2);
      //edtcrc8.Text :=  inttostr(GetCrc8(strsend,length(strsend)));
      strsend :=strsend+chr(crc8);
     end;
     try
     frmcom.com.WriteStr(strsend);
     except
     end;
  end
  else
  begin
     strsend :=cmd;
     try
     frmcom.com.WriteStr(strsend);
     except
     end;
     j:=0;
     j:=j+strtointdef(copy(frmcom.StatusBar1.Panels[2].Text,4,length(frmcom.StatusBar1.Panels[2].Text)-3),0);
     j:=j+length(strsend);
     frmcom.StatusBar1.Panels[2].Text:='TX:'+inttostr(j);
  end;


end;
procedure Tfrmcom.btncommand1Click(Sender: TObject);
begin
 sendcommand(memcommand1.Text);
end;

procedure Tfrmcom.btncommand2Click(Sender: TObject);
begin
 sendcommand(memcommand2.Text);
end;

procedure Tfrmcom.btncommand3Click(Sender: TObject);
begin
 sendcommand(memcommand3.Text);
end;

procedure Tfrmcom.btncommand4Click(Sender: TObject);
begin
 sendcommand(memcommand4.Text);
end;

procedure Tfrmcom.btncommand5Click(Sender: TObject);
begin
 sendcommand(memcommand5.Text);
end;

procedure Tfrmcom.btncommand6Click(Sender: TObject);
begin
 sendcommand(memcommand6.Text);
end;

procedure Tfrmcom.combdataChange(Sender: TObject);
begin
{ if com.Connected then
 statusbar1.Panels[0].Text:= com.Port+'打开,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits)
 else
 statusbar1.Panels[0].Text:= com.Port+'关闭,'+BaudRateToStr(com.BaudRate) +
                ',' + ParityToStr( com.Parity.Bits) +
                ',' + DataBitsToStr(com.DataBits) +
                ',' + StopBitsToStr(com.StopBits);  }
end;

procedure Tfrmcom.chkcrc8Click(Sender: TObject);
begin
 if not chkhex.Checked  then
  chkhex.Checked :=true;
end;

procedure Tfrmcom.Label14Click(Sender: TObject);
begin
 showmessage('小飞设计QQ86652764:Email:tumingfu@sina.com.cn');
end;

end.
