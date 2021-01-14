unit BuildSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ADODB, ComCtrls;

type
  TBuildSQL_frm = class(TForm)
    gboxsql: TGroupBox;
    MemoSQL: TMemo;
    ADOCommand1: TADOCommand;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    btnexp: TBitBtn;
    btnRun: TBitBtn;
    btnClose: TBitBtn;
    StatusBar1: TStatusBar;
    btnonerun: TBitBtn;
    procedure btnRunClick(Sender: TObject);
    procedure btnexpClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnonerunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuildSQL_frm: TBuildSQL_frm;

implementation

{$R *.dfm}

procedure TBuildSQL_frm.btnRunClick(Sender: TObject);
var sqlstr, tempsql:string;
    i, tnum, fnum:integer;
begin
     StatusBar1.Panels[0].Text :='';
     StatusBar1.Panels[1].Text :='';
     sqlstr :='';
     //memo1.Lines.Add(inttostr(memosql.Lines.Count));
     tnum :=0;
     fnum :=0;

     for i:=0 to memosql.Lines.Count -1 do
     begin
        tempsql :=LowerCase(trim(memosql.Lines[i]));

        if (tempsql<>'go') then
        begin
           sqlstr :=sqlstr + memosql.Lines[i];
        end
        else
        begin
           if sqlstr ='' then continue;
           ADOCommand1.CommandText :=sqlstr;
           sqlstr :='';
           try
               ADOCommand1.Execute;
               inc(tnum);
           except
                on E: Exception do
                begin
                   inc(fnum);
                   StatusBar1.Panels[1].Text :='失败执行数'+ inttostr(fnum) + ',失败执行'+ E.Message;
                end;
           end;
        end;
     end;
     if sqlstr<>'' then
     begin
         ADOCommand1.CommandText :=sqlstr;
         sqlstr :='';
         try
            ADOCommand1.Execute;
            inc(tnum);
            StatusBar1.Panels[0].Text :='成功执行' + inttostr(tnum);
         except
            on E: Exception do
            begin
                   inc(fnum);
                   StatusBar1.Panels[1].Text :='失败执行数'+ inttostr(fnum) + ', 失败原因'+ E.Message;
            end;
         end;
     end;
     //StatusBar1.Panels[0].Text :='成功执行数' + inttostr(tnum);
    // StatusBar1.Panels[1].Text :='失败执行数'+ inttostr(fnum);
end;

procedure TBuildSQL_frm.btnexpClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    MemoSQL.Lines.SaveToFile(SaveDialog1.FileName);
  end;

end;

procedure TBuildSQL_frm.btnCloseClick(Sender: TObject);
begin
  CLOSE();
end;

procedure TBuildSQL_frm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    //VK_F9  : if btnTabInfoFieldadd.Enabled then  btnTabInfoFieldadd.Click;
    //VK_F4 : if btnTabInfoFieldedit.Enabled then  btnTabInfoFieldedit.Click;
    VK_ESCAPE : if btnClose.Enabled then  btnClose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TBuildSQL_frm.btnonerunClick(Sender: TObject);
var sqlstr, tempsql, falsestr:string;
    i, tnum, fnum:integer;
begin
     StatusBar1.Panels[0].Text :='';
     StatusBar1.Panels[1].Text :='';
     falsestr :='';
     tnum :=0;
     fnum :=0;
     for i:=0 to memosql.Lines.Count -1 do
     begin
         sqlstr :=trim(memosql.Lines[i]);
         if sqlstr ='' then continue;
         ADOCommand1.CommandText :=memosql.Lines[i];
         //showmessage(memosql.Lines[i]);
         sqlstr :='';
         try
            ADOCommand1.Execute;
            inc(tnum);
            StatusBar1.Panels[0].Text :='成功执行' + inttostr(tnum);
         except
            on E: Exception do
            begin
                   inc(fnum);
                   falsestr :=falsestr + inttostr(i) + ',';
                   StatusBar1.Panels[1].Text :='失败执行数'+ inttostr(fnum) +',出错行第'+falsestr+ '行,失败原因:'+ E.Message;
                   //exit;
            end;
         end;
     end;
     //StatusBar1.Panels[0].Text :='成功执行数' + inttostr(tnum);
     //StatusBar1.Panels[1].Text :='失败执行数'+ inttostr(fnum);

end;

procedure TBuildSQL_frm.FormCreate(Sender: TObject);
begin
  MemoSQL.ImeName :='';
end;

end.
