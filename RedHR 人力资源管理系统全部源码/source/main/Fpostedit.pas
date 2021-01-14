unit Fpostedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, dxtree, dxdbtree, StdCtrls, DB, ADODB;

type
  Tpostedit = class(TForm)
    GroupBox1: TGroupBox;
    dxDBTreeView1: TdxDBTreeView;
    Button1: TButton;
    Button2: TButton;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ADOTable1AfterInsert(DataSet: TDataSet);
    procedure Button4Click(Sender: TObject);
    procedure dxDBTreeView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  postedit: Tpostedit;

implementation
uses fmain, Feditpost;
{$R *.dfm}

procedure Tpostedit.Button1Click(Sender: TObject);
begin
  close
end;

procedure Tpostedit.FormShow(Sender: TObject);
begin
  self.ADOTable1.Open;
end;

procedure Tpostedit.Button2Click(Sender: TObject);
begin
  if self.ADOTable1.RecordCount=0 then exit;
  if Application.MessageBox('确认要删除所选择的职位类型吗？','提示',MB_YESNO )=IDYES then
    begin
      self.ADOTable1.Delete;
    end;
end;

procedure Tpostedit.Button3Click(Sender: TObject);
begin
  editpost:=teditpost.create(application);
  editpost.etype:=1;
  editpost.showmodal;
end;

procedure Tpostedit.ADOTable1AfterInsert(DataSet: TDataSet);
begin
  if varIsNull(ADOTable1.FindField('tid').Value) then begin
    if varIsNull(dxDBTreeView1.DBTreeNodes.MaxKeyFieldValue) then
      ADOTable1.FindField('tid').AsInteger := 0
    else ADOTable1.FindField('tid').Value := dxDBTreeView1.DBTreeNodes.MaxKeyFieldValue + 1;
  end;
end;

procedure Tpostedit.Button4Click(Sender: TObject);
begin
  editpost:=teditpost.create(application);
  editpost.etype:=2;
  editpost.showmodal;
end;

procedure Tpostedit.dxDBTreeView1DblClick(Sender: TObject);
begin
  editpost:=teditpost.create(application);
  editpost.etype:=2;
  editpost.Edit1.Text:=self.ADOTable1.fieldbyname('postname').AsString;
  editpost.Memo1.Lines.Text:=self.ADOTable1.fieldbyname('postmemo').AsVariant;
  editpost.showmodal;
end;

end.
