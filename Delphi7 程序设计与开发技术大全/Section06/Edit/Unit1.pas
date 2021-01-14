unit Unit1;

interface

uses
  richedit, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Fedit: TEdit;
    RichEdit1: TRichEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Redit: TEdit;
    Button3: TButton;
    CheckBox4: TCheckBox;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function Find(toFind,replacewith: string): string;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  replall: boolean;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
 RichEdit1.Perform(EM_EXLIMITTEXT, 0, 8000000);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 toFind,replacewith: string;
begin
 if Fedit.text <> '' then Find(toFind,replacewith);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 toFind,replacewith: string;
begin
 if Fedit.text <> '' then
  begin
   toFind := Fedit.text;
   replacewith := Redit.text;
   Find(toFind,replacewith)
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 toFind,replacewith: string;
begin
  if Fedit.text <> '' then
   begin
    toFind := fedit.text;
    replacewith := redit.text;
    replall := True;
    while replall = True do Find(toFind,replacewith);
   end;
end;

function TForm1.Find(toFind,replacewith: string): string;
var
 matchcase,wholeword,up,top: boolean;
 FindIn,Findin2,uptoFind,upFindin,upFindin2: string;
 Find1s,Find2s,Find3s,Find4s: string;
 Find1,Find2,Find3,Find4: integer;
 flen,start,holder,found,index,i: integer;
begin
 if CheckBox2.checked then matchcase := True;
 if CheckBox1.checked then wholeword := True;
 if CheckBox3.checked then up := True;
 if CheckBox4.checked then top := True;
 if top = True then
  begin
   RichEdit1.perform(em_setsel,0,0);
   CheckBox4.checked := False;
   top := False;
  end;

 if matchcase = True then
  begin
   ToFind := Fedit.text;
   if lowercase(RichEdit1.seltext) = lowercase(toFind) then
     if replacewith <> '' then RichEdit1.seltext := replacewith;
   Findin := RichEdit1.text;
  end
 else
  begin
   ToFind := lowercase(fedit.text);
   if replacewith <> '' then replacewith := lowercase(replacewith);
   if lowercase(RichEdit1.seltext) = lowercase(toFind) then
     if replacewith <> '' then RichEdit1.seltext := replacewith;
   Findin := lowercase(RichEdit1.text);
  end;
 flen := length(toFind);
 found := 0;
 index := -1;
 if up = True then
  begin
   start := RichEdit1.selstart;
   holder := start +1;
   for i := 0 to length(toFind)-1 do AppendStr(uptoFind, copy(toFind,length(toFind)-i,1));
   while found = 0 do
   begin
    if holder < -250 then
     begin
      showmessage('"'+toFind+'"没有找到。');
      replall := False;
      activecontrol := RichEdit1;
      exit;
     end;
    if holder < 250 then i := holder -1
     else
      begin
       i := 250;
      end;

    Findin2 := concat('  ',copy(Findin,holder-i,i),'  ');
    upFindin2 := '';
    for i := 0 to length(Findin2)-1 do AppendStr(upFindin2, copy(Findin2,length(Findin2)-i,1));
       if wholeword = True then
        begin
         Find1s := ' ' + uptoFind + ' ';
         Find2s := #13 + uptoFind + ' ';
         Find3s := #13 + uptoFind + #10;
         Find4s := ' ' + uptoFind + #10;
         Find1 := pos(Find1s, upFindin2);
         Find2 := pos(Find2s, upFindin2);
         Find3 := pos(Find3s, upFindin2);
         Find4 := pos(Find4s, upFindin2);
         if Find1 = 0 then Find1 := 300;
         if Find2 = 0 then Find2 := 300;
         if Find3 = 0 then Find3 := 300;
         if Find4 = 0 then Find4 := 300;

         if (Find1 <300) and (Find1 <Find2) and (Find1 <Find3) and (Find1 <Find4)
            then found := Find1 +1;
         if (Find2 <300) and (Find2 <Find1) and (Find2 <Find3) and (Find2 <Find4)
            then found := Find2 +1;
         if (Find3 <300) and (Find3 <Find1) and (Find3 <Find2) and (Find3 <Find4)
            then found := Find3 +1;
         if (Find4 <300) and (Find4 <Find1) and (Find4 <Find2) and (Find4 <Find3)
            then found := Find4 +1;
        end
       else found := pos(uptoFind, upFindin2);
         holder := holder - 225;
         index := index +1;
      end;
     if index > 0 then index := index *225 else index := 0;
     holder := start -index -found +3;
     ActiveControl := RichEdit1;
     RichEdit1.perform(em_setsel, holder-flen, holder);
     RichEdit1.perform(em_scrollcaret, 0,0);
   end
 else
  begin
   start := RichEdit1.selstart;
   if lowercase(RichEdit1.seltext) = lowercase(toFind) then
     RichEdit1.perform(em_setsel, start +flen, start +flen);
   start := RichEdit1.selstart;
   holder := start +1;
   while found = 0 do
   begin
    if holder > (RichEdit1.gettextlen)+223 then
     begin
      showmessage('"'+toFind+'" 没有找到。');
      replall := False;
      ActiveControl := RichEdit1;
      exit;
     end;
    Findin2 := concat('  ',copy(Findin,holder,250),'  ');
       if wholeword = True then
        begin
         Find1s := ' ' + toFind + ' ';
         Find2s := #10 + toFind + ' ';
         Find3s := #10 + toFind + #13;
         Find4s := ' ' + toFind + #13;
         Find1 := pos(Find1s, Findin2);
         Find2 := pos(Find2s, Findin2);
         Find3 := pos(Find3s, Findin2);
         Find4 := pos(Find4s, Findin2);
         if Find1 = 0 then Find1 := 300;
         if Find2 = 0 then Find2 := 300;
         if Find3 = 0 then Find3 := 300;
         if Find4 = 0 then Find4 := 300;
         if (Find1 <300) and (Find1 <Find2) and (Find1 <Find3) and (Find1 <Find4)
            then found := Find1 +1;
         if (Find2 <300) and (Find2 <Find1) and (Find2 <Find3) and (Find2 <Find4)
            then found := Find2 +1;
         if (Find3 <300) and (Find3 <Find1) and (Find3 <Find2) and (Find3 <Find4)
            then found := Find3 +1;
         if (Find4 <300) and (Find4 <Find1) and (Find4 <Find2) and (Find4 <Find3)
            then found := Find4 +1;
        end
       else found := pos(toFind, Findin2);
         holder := holder + 225;
         index := index +1;
      end;
     if index > 0 then index := index *225 else index := 0;
     holder := start +index +found-3;
     ActiveControl := RichEdit1;
     RichEdit1.perform(em_setsel, holder, holder +flen);
     RichEdit1.perform(em_scrollcaret, 0,0);
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Memo1.Lines.Add(MaskEdit1.Text);
end;

end.
