unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    ListBox1: TListBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
self.ListBox1.Items.LoadFromFile(form1.getdir+'gr.dat');
end;

procedure TForm4.Button2Click(Sender: TObject);
begin

if (self.ListBox1.Count<>0) and (self.ListBox1.ItemIndex<>-1) then
    if application.MessageBox('确实要删除此记录吗？','确认',MB_YESNO)=IDYES  then
         self.ListBox1.Items.Delete(self.ListBox1.ItemIndex);


end;

procedure TForm4.Button1Click(Sender: TObject);
var
  i:integer;
begin
if self.Edit1.Text='' then
 begin
   showmessage('不能为空！');
   abort;
 end;

 
 
for i:=0 to self.ListBox1.Items.Count-1 do
  if self.ListBox1.Items.Strings[i]=self.Edit1.Text then
    begin
     showmessage('此人已经存在！');
     abort;
    end;

self.ListBox1.Items.Add(self.Edit1.Text);
self.Edit1.Text:='';

end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
self.ListBox1.Items.SaveToFile('gr.dat');
end;

procedure TForm4.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=chr(39) then
   begin
    showmessage('不能输入单引号！');
    Key :=#10 ;
   end
end;

end.
