unit Fchangepost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxdbtrel, ComCtrls, DB, ADODB;

type
  Tchangepost = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    dxLookupTreeView1: TdxLookupTreeView;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable2: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    etype:integer;//1.增加 2.编辑
  end;

var
  changepost: Tchangepost;

implementation

uses fmain;
{$R *.dfm}

procedure Tchangepost.Button1Click(Sender: TObject);
begin
  close
end;

procedure Tchangepost.FormCreate(Sender: TObject);
begin
  self.DateTimePicker1.Date:=now;
  self.ADOTable1.Open;
end;

procedure Tchangepost.FormDestroy(Sender: TObject);
begin
  self.ADOTable1.Close;
end;

procedure Tchangepost.Button2Click(Sender: TObject);
var tmpid:string;
begin
  if self.dxLookupTreeView1.Text='' then
    begin
      MessageBox(handle,'请先选择一项职位！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  if self.etype=1 then
    begin
      self.ADOTable2.Close;
      self.ADOTable2.Open;
      self.ADOTable2.Append;
      self.ADOTable2.FieldByName('staffid').AsInteger:=main.staffinfo.fieldbyname('r_staffinfo.id').AsInteger;
      self.ADOTable2.FieldByName('postdate').AsDateTime:=self.DateTimePicker1.Date;
      self.ADOTable2.FieldByName('postid').AsInteger:=self.ADOTable1.fieldbyname('id').AsInteger;
      self.ADOTable2.FieldByName('memo').AsVariant:=self.Memo1.Lines.Text;
      self.ADOTable2.Post;
    end;
  if self.etype=2 then
    begin
      tmpid:=main.stachpostedit.fieldbyname('id').AsString;
      self.ADOTable2.Close;
      self.ADOTable2.Filtered:=false;
      self.ADOTable2.Filter:=format('id'+'='+'''%s''',[tmpid]);
      self.ADOTable2.Filtered:=true;
      self.ADOTable2.Open;
      self.ADOTable2.edit;
      //self.ADOTable2.FieldByName('staffid').AsInteger:=main.staffinfo.fieldbyname('r_staffinfo.id').AsInteger;
      //self.ADOTable2.FieldByName('postdate').AsDateTime:=self.DateTimePicker1.Date;
      //self.ADOTable2.FieldByName('postid').AsInteger:=self.ADOTable1.fieldbyname('id').AsInteger;
      self.ADOTable2.FieldByName('memo').AsVariant:=self.Memo1.Lines.Text;
      self.ADOTable2.Post;
    end;
  main.stachpostedit.Close;
  main.stachpostedit.Open;
  close;
end;

end.
