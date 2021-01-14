unit UntInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ToolWin, ImgList;

type
  TFrminput = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    mmo1: TMemo;
    clbr1: TCoolBar;
    ilimage: TImageList;
    dlgFont: TFontDialog;
    tlb1: TToolBar;
    btn1: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    dlgOpen: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frminput: TFrminput;
 

implementation
    uses Untmain,Untfun ;
{$R *.dfm}

procedure TFrminput.FormCreate(Sender: TObject);
begin
  
  if FileExists(Frmmain.wordfilename) then
    mmo1.Lines.LoadFromFile(Frmmain.wordfilename);
end;

procedure TFrminput.btn6Click(Sender: TObject);
begin
  close;
end;

procedure TFrminput.btn4Click(Sender: TObject);
begin
  mmo1.Lines.SaveToFile(Frmmain.wordfilename);
  with Frmmain do
  begin
    file_tostrslist ;
    if cbb1.Items.Count>0 then
    begin
      cbb1.ItemIndex:=0;
      wordlist.Clear ;
      TxttoWords(strslist.Strings[0],wordlist);
      wordrec:=0;
    end;
  end;
  
end;

procedure TFrminput.btn1Click(Sender: TObject);
begin
 dlgOpen.Filter :='文本文件|*.txt';
  if dlgOpen.Execute then
  mmo1.Lines.LoadFromFile(dlgOpen.FileName);    
end;

procedure TFrminput.btn5Click(Sender: TObject);
begin
  dlgFont.Font.Name :='宋体';
  dlgFont.Font.Size :=10;
  if dlgFont.Execute then
  mmo1.Font:=dlgFont.Font; 
end;

end.
