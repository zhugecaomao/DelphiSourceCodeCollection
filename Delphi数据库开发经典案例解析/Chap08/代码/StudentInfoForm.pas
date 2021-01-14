unit StudentInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TStudentInfo = class(TParent)
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure ComboBox3Select(Sender: TObject);
    procedure ComboBox4Select(Sender: TObject);
    procedure ComboBox5Select(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setlist(fieldname,tablename:string;combo:Tcombobox);//设置下拉列表框字典
  end;

var
  StudentInfo: TStudentInfo;

implementation

{$R *.dfm}
//-------------根据学生信息表中的编号，显示编号所对应的信息 -------------
procedure TStudentInfo.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  //根据数据表中的班级编号，显示班级名称
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 班级名称 from 班级信息 where 班级编号='''+dbedit5.Text+'''');
  adoquery1.Open;
  combobox1.Text:=trim(adoquery1.fieldbyname('班级名称').AsString);

  //根显示政治面貌
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 政治面貌 from 政治面貌代码表 where 政治面貌编号='''+dbedit6.Text+'''');
  adoquery1.Open;
  combobox2.Text:=trim(adoquery1.fieldbyname('政治面貌').AsString);

  //显示民族
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 民族 from 民族代码表 where 民族编号='''+dbedit7.Text+'''');
  adoquery1.Open;
  combobox3.Text:=trim(adoquery1.fieldbyname('民族').AsString);

  //显示籍贯
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 籍贯 from 籍贯代码表 where 籍贯编号='''+dbedit8.Text+'''');
  adoquery1.Open;
  combobox4.Text:=trim(adoquery1.fieldbyname('籍贯').AsString);

  //显示学籍
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 学籍名称 from 学籍代码表 where 学籍编号='''+dbedit9.Text+'''');
  adoquery1.Open;
  combobox5.Text:=trim(adoquery1.fieldbyname('学籍名称').AsString);


end;

//--------------根据输入查询字段，并设置制定下拉列表框的下拉选项-------------------
procedure TStudentInfo.setlist(fieldname,tablename: string; combo: Tcombobox);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select distinct '+fieldname+' from '+tablename);
adoquery1.Open;
combo.Items.Clear;
while not adoquery1.Eof do
 begin
  combo.Items.Add(trim(adoquery1.fieldbyname(fieldname).AsString));
  adoquery1.Next;
 end;


end;

//-----窗体显示时，设置各个下拉列表的下拉词典----------
procedure TStudentInfo.FormShow(Sender: TObject);
begin

  inherited;
  setlist('班级名称','班级信息',combobox1);
  setlist('政治面貌','政治面貌代码表',combobox2);
  setlist('民族','民族代码表',combobox3);
  setlist('籍贯','籍贯代码表',combobox4);
  setlist('学籍名称','学籍代码表',combobox5);
end;


//---------以下5个函数都是根据选择的字段名称修改数据表中的对应编号-----------
procedure TStudentInfo.ComboBox1Select(Sender: TObject);
begin
  inherited;
   //根据选择的班级名称，修改班级编号
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 班级编号 from 班级信息 where 班级名称='''+combobox1.Text+'''');
  adoquery1.Open;
  dbedit5.Text:=trim(adoquery1.fieldbyname('班级编号').AsString);
end;

procedure TStudentInfo.ComboBox2Select(Sender: TObject);
begin
  inherited;
   //根据选择的政治面貌名称，修改政治面貌名称
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 政治面貌编号 from 政治面貌代码表 where 政治面貌='''+combobox2.Text+'''');
  adoquery1.Open;
  dbedit6.Text:=trim(adoquery1.fieldbyname('政治面貌编号').AsString);
end;

procedure TStudentInfo.ComboBox3Select(Sender: TObject);
begin
  inherited;
   //根据选择的民族名称，修改民族编号
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 民族编号 from 民族代码表 where 民族='''+combobox3.Text+'''');
  adoquery1.Open;
  dbedit7.Text:=trim(adoquery1.fieldbyname('民族编号').AsString);
end;

procedure TStudentInfo.ComboBox4Select(Sender: TObject);
begin
  inherited;
   //根据选择的籍贯名称，修改籍贯编号
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 籍贯编号 from 籍贯代码表 where 籍贯='''+combobox4.Text+'''');
  adoquery1.Open;
  dbedit8.Text:=trim(adoquery1.fieldbyname('籍贯编号').AsString);
end;

procedure TStudentInfo.ComboBox5Select(Sender: TObject);
begin
  inherited;
   //根据选择的学籍名称，修改学籍编号
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 学籍编号 from 学籍代码表 where 学籍名称='''+combobox5.Text+'''');
  adoquery1.Open;
  dbedit9.Text:=trim(adoquery1.fieldbyname('学籍编号').AsString);
end;

end.
