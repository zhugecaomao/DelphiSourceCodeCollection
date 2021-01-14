unit info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, ExtCtrls, StdCtrls,mmsystem, Menus, Buttons,
  DBCtrls, Mask, ComCtrls;

type
  Tinfo_form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  info_form: Tinfo_form;

implementation
  uses main;
{$R *.dfm}

function PlayWav(const FileName: string): Boolean;
begin
Result := PlaySound(PChar(FileName), 0, SND_ASYNC);
end;

procedure Tinfo_form.FormCreate(Sender: TObject);
begin
with ADOQuery1 do
begin
  close;
  sql.Clear;
  sql.Add('select * from info where date>=:a');
  Parameters[0].Value:=strtodate(formatDateTime('yyyy-mm-dd',date()));
  prepared;
  open;
end;

with ADOQuery2 do
begin
  close;
  sql.Clear;
  sql.Add('select * from info where date<:a');
  Parameters[0].Value:=strtodate(formatDateTime('yyyy-mm-dd',date()));
  prepared;
  open;
end;
DateTimePicker1.Date:=date();
end;

procedure Tinfo_form.N2Click(Sender: TObject);
begin
if not ADOQuery1.Eof then
ADOQuery1.Delete;
 end;


procedure Tinfo_form.N3Click(Sender: TObject);
begin
if not ADOQuery2.Eof then
ADOQuery2.Delete;
end;

procedure Tinfo_form.N1Click(Sender: TObject);
begin
if not ADOQuery1.Eof then
begin
 DateTimePicker1.Date:=ADOQuery1.FieldValues['date'];
 memo1.Text:=ADOQuery1.FieldValues['content'];
 BitBtn1.Caption:= '提交';
end;
end;

procedure Tinfo_form.BitBtn1Click(Sender: TObject);
begin
if  BitBtn1.Caption='添加' then
begin
  if trim(memo1.Text)='' then
   begin
     playwav('sound\error.wav');
     messagebox(handle,'请把提醒的内容填好！','错误',MB_OK+MB_ICONERROR);
     exit;
   end
   else
   begin
     ADOQuery1.Append;
     ADOQuery1.Edit;
     ADOQuery1.FieldValues['date']:=strtodate(formatDateTime('yyyy-mm-dd',DateTimePicker1.Date));
     ADOQuery1.FieldValues['content']:=trim(memo1.Text);
     ADOQuery1.Post;
     ADOQuery1.Close;
     ADOQuery1.Active:=true;
     ADOQuery2.Close;
     ADOQuery2.Active:=true;
     memo1.Text:='';
   end;
end
else
begin
  if trim(memo1.Text)='' then
   begin
     playwav('sound\error.wav');
     messagebox(handle,'请把提醒的内容填好！','错误',MB_OK+MB_ICONERROR);
     exit;
   end
   else
   begin
     ADOQuery1.Edit;
     ADOQuery1.FieldValues['date']:=strtodate(formatDateTime('yyyy-mm-dd',DateTimePicker1.Date));
     ADOQuery1.FieldValues['content']:=trim(memo1.Text);
     ADOQuery1.Post;
     BitBtn1.Caption:='添加';
     ADOQuery1.Close;
     ADOQuery1.Active:=true;
     ADOQuery2.Close;
     ADOQuery2.Active:=true;
     memo1.Text:='';
   end;

end;
end;

end.
