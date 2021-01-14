unit UpdateTeachingUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls;

type
  TUpdateTeachingForm = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateTeachingForm: TUpdateTeachingForm;

implementation

uses UpDateDataModuleUnit;

{$R *.dfm}
procedure TUpdateTeachingForm.Button1Click(Sender: TObject);
begin
  With UpDateDataModule.TeachingTable   do
 begin
  if((DBLookupComboBox2.Text='')and(DBLookupComboBox3.Text=''))
  then  begin
    ShowMessage('请选折要添加的学生编号和课程号');
    exit;
 end;
   IndexFieldNames:='SNo';
   IndexFieldNames:='CNo';
   if (FindKey([DBLookupComboBox2.Text])and FindKey([DBLookupComboBOx3.Text]))
  then  begin
     Edit;
     FieldByName('Grade').AsString:=ComboBox1.Text;
     Post;
     ShowMessage('更新成功!');
  end  else  ShowMessage('无此记录!');
end;
end;

procedure TUpdateTeachingForm.BitBtn1Click(Sender: TObject);
begin
 With  UpDateDataModule.TeachingTable  do
 begin
  IndexFieldNames:='TNo';
  IndexFieldNames:='SNo';
  IndexFieldNames:='CNo';
  if (FindKey([DBLookupComboBox1.Text])and FindKey([DBLookupComboBox2.Text])and
        FindKey([DBLookupComboBox3.Text]))
  then  begin
    ShowMessage('该学生的记录已经存在! ');
    exit;
  end;
  if((DBLookupComboBox1.Text<>'')and(DBLookupCOmboBox3.Text<>''))  then
  begin
    Insert;
    FieldByName('TNo').AsString:=DBLookupComboBox1.Text;
    FieldByName('SNo').AsString:=DBLookupComboBox2.Text;
    FieldByName('CNo').AsString:=DBLookupComboBox3.Text;
    FieldByName('Grade').AsVariant:=ComboBox1.Text;
    Post;
    ShowMessage('添加成功! ');
    end  else  ShowMessage('教师和学生的编号不能为空! ');
  end;

end;

procedure TUpdateTeachingForm.BitBtn2Click(Sender: TObject);
var
 finded:boolean;
begin
 With UpDateDataModule.TeachingTable  do
 begin
   finded:=false;
   First;
   repeat
    if((FieldByName('TNo').AsString=DBLookupComboBox1.Text)
       and (FieldByName('SNo').AsString=DBLookupComboBox2.Text)
       and (FieldByName('CNo').AsString=DBLookupComboBox3.Text))
       then begin
         ShowMessage('删除成功! ');
         Delete;
    //  finded:=true;
          exit
        end
       else  Next;
      until((finded)or(Eof));
      if not finded then
        ShowMessage('无此记录! ');
  end;
end;

procedure TUpdateTeachingForm.Button2Click(Sender: TObject);
begin
 close;
end;

end.
