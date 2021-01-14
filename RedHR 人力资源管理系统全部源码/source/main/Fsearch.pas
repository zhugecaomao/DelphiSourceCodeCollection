unit Fsearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  Tsearch = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  search: Tsearch;

implementation

uses fmain;
{$R *.dfm}

procedure Tsearch.Button2Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tsearch.FormShow(Sender: TObject);
begin
  self.Edit1.SetFocus;
end;

procedure Tsearch.Button1Click(Sender: TObject);
begin
  if trim(self.Edit1.Text)='' then
    begin
      MessageBox(handle,'请输入查询内容！','错误',MB_ICONERROR or MB_OK);
      self.Edit1.SetFocus;
      exit;    
    end;
  main.staffinfo.Close;
  main.staffinfo.Filtered:=false;
  main.staffinfo.SQL.Clear;
  main.staffinfo.SQL.Add('select * from r_staffinfo,r_staffclasscode,r_staffbranch where r_staffinfo.delrecy='''+'0'+'''');
  main.staffinfo.SQL.Add(' and r_staffinfo.classcodeID=r_staffclasscode.id and r_staffinfo.branchid=r_staffbranch.id');
  main.staffinfo.SQL.Add(' and ( r_staffinfo.name like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.staffid like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.ifmarriage like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.idnum like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.sex like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.Nationality like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.Nativeplace like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.Residence like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.knowledge like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.School like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.forlang like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.Address like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.Telephone like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.Email like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.imemo like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.ename like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.intime like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffinfo.birthday like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffclasscode.classcodename like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffclasscode.classcodememo like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffbranch.branchname like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(' or r_staffbranch.bmemo like '''+'%'+self.edit1.Text+'%'+'''');
  main.staffinfo.SQL.Add(')');
  main.staffinfo.Open;
  if main.staffinfo.RecordCount=0 then
    begin
      MessageBox(handle,'您输入的内容没能查询到结果！','提示',MB_ICONINFORMATION or MB_OK);
      self.Edit1.SetFocus;
      exit;
    end;
  self.close;
end;

end.
