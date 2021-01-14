unit Fbranch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, ComCtrls, ExtCtrls;

type
  Tbran = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    ListView1: TListView;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    etype:integer;          //1.建立部门  2.建立分部  3.编辑
  end;

var
  bran: Tbran;

implementation

uses fmain;
{$R *.dfm}

procedure Tbran.Button2Click(Sender: TObject);
begin
  close
end;

procedure Tbran.Button1Click(Sender: TObject);
begin
  if trim(self.Edit1.Text)='' then
    begin
      MessageBox(handle,'请输入名称！','错误',MB_ICONERROR or MB_OK);
      self.Edit1.SetFocus;
      exit;
    end;
  if self.etype=1 then     //增加部门
    begin
      main.dxDBTreeView1.Items.Add(main.dxDBTreeView1.Selected, self.Edit1.Text);
      (*main.branch.Edit;
      main.branch.FieldByName('bmemo').AsVariant:=self.Memo1.Lines.Text;
      main.branch.FieldByName('image').AsInteger:=self.ListView1.Selected.ImageIndex;
      main.branch.Post;    *)
    end;
  if self.etype=2 then
    begin
      if (main.dxDBTreeView1.Selected <> Nil) then
        begin
          main.dxDBTreeView1.Items.AddChild(main.dxDBTreeView1.Selected,self.Edit1.Text);
         (* main.branch.Edit;
          main.branch.FieldByName('bmemo').AsVariant:=self.Memo1.Lines.Text;
          main.branch.FieldByName('image').AsInteger:=self.ListView1.Selected.ImageIndex;
          main.branch.Post;     *)
        end;
    end;
  if self.etype=3 then
    begin
      main.branch.Edit;
      main.branch.FieldByName('branchname').AsString:=self.Edit1.Text;
      main.branch.FieldByName('bmemo').AsVariant:=self.Memo1.Lines.Text;
      if self.ListView1.SelCount<>0 then
        main.branch.FieldByName('image').AsInteger:=self.ListView1.Selected.ImageIndex;
      main.Branch.Post;
    end;
  main.branch.Close;
  main.branch.Open;
  self.Close;
end;

procedure Tbran.FormCreate(Sender: TObject);
var i:integer;
begin
  self.ListView1.Clear;
  for i:=0 to main.Branchimage.Count-1 do
    begin
      self.ListView1.Items.Add.ImageIndex:=i;
    end;
end;

end.
