unit fzglx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls, Grids, DBGrids, DBCtrls;

type
  Tzglx = class(TForm)
    DataSource1: TDataSource;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    Button2: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Edit1: TEdit;
    ADOTable1: TADOTable;
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zglx: Tzglx;

implementation

uses fmain;
{$R *.dfm}

procedure Tzglx.FormDestroy(Sender: TObject);
begin
  self.ADOTable1.Close;
end;

procedure Tzglx.Button1Click(Sender: TObject);
begin
  close
end;

procedure Tzglx.FormCreate(Sender: TObject);
begin
  self.ADOTable1.Open;
end;

procedure Tzglx.Button3Click(Sender: TObject);
begin
  if trim(self.Edit1.Text)='' then
    begin
      MessageBox(handle,'请输入新类型名称！','错误',MB_ICONERROR or MB_OK);
      self.PageControl1.ActivePageIndex:=1;
      self.Edit1.SetFocus;
      exit;
    end;
  self.ADOTable1.Refresh;
  self.ADOTable1.Append;
  self.ADOTable1.FieldByName('classcodename').AsString:=self.Edit1.Text;
  self.ADOTable1.FieldByName('classcodememo').AsVariant:=self.Memo1.Lines.Text;
  self.ADOTable1.Post;
  self.ADOTable1.Refresh;
end;

procedure Tzglx.Button2Click(Sender: TObject);
begin
  if self.ADOTable1.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的职工类型吗？','提示',MB_YESNO )=IDYES then
    begin
      self.ADOTable1.Delete;
    end;
end;

end.
