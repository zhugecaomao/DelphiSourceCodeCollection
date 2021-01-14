unit chengjiunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, Buttons, jpeg,
  Menus, BusinessSkinForm, bsSkinCtrls;

type
  Tchengjiform = class(TForm)
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit6: TEdit;
    Panel1: TPanel;
    Bevel1: TBevel;
    BitBtn1: TbsSkinButton;
    BitBtn2: TbsSkinButton;
    BitBtn3: TbsSkinButton;
    BitBtn4: TbsSkinButton;
    BitBtn5: TbsSkinButton;
    BitBtn6: TbsSkinButton;
    BitBtn7: TbsSkinButton;
    Label14: TLabel;
    ComboBox2: TComboBox;
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chengjiform: Tchengjiform;
  dj1,dj2,dj3,dj4,dj5,dj6,dj7,dj8:string;
  cg1,cg2,cg3,cg4,cg5,cg6,cg7,cg8,cg9:integer;    //记录不同项目的成绩
  woli:string;        //握力体重指数
  feihuoliang:string;  //肺活量体重指数  

implementation
uses dataunit,mainunit, DBTables, DB, DateUtils,printunit;

{$R *.dfm}

procedure Tchengjiform.ComboBox1Enter(Sender: TObject);
begin
DataModule1.banjixinxi.Refresh;
if DataModule1.banjixinxi.RecordCount<>0 then
  begin
    ComboBox1.Items.Clear;
    DataModule1.banjixinxi.First;
    while (DataModule1.banjixinxi.Eof<>true) do
      begin
        if ComboBox2.Text<>'' then
          begin
            if DataModule1.banjixinxi.FieldValues['所属院系名称']=ComboBox2.Text then
               ComboBox1.Items.Add(DataModule1.banjixinxi.FieldValues['班级名称']);
          end
        else
        ComboBox1.Items.Add(DataModule1.banjixinxi.FieldValues['班级名称']);
        DataModule1.banjixinxi.Next;
      end;
    DataModule1.banjixinxi.First;
  end;
end;

procedure Tchengjiform.ComboBox1Change(Sender: TObject);
begin
BitBtn5.Click;
DBGrid1.DataSource:=DataModule1.Dxueshengxinxi;
DBGrid1.DataSource.DataSet.Filtered:=true;
DBGrid1.DataSource.DataSet.Filter:='所属班级名称='+QuotedStr(ComboBox1.Text);
end;

procedure Tchengjiform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
mainform.closetable;
DBGrid1.DataSource:=DataModule1.Dnull;
mainform.Show;
end;

procedure Tchengjiform.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tchengjiform.FormShow(Sender: TObject);
begin
mainform.dataref;
if ComboBox1.Text<>'' then
  begin
    DBGrid1.DataSource:=DataModule1.Dxueshengxinxi;
    DBGrid1.DataSource.DataSet.Filtered:=true;
    DBGrid1.DataSource.DataSet.Filter:='所属班级名称='+QuotedStr(ComboBox1.Text);
  end
else
  DBGrid1.DataSource:=DataModule1.Dnull;
BitBtn5.Click;
BitBtn2.Enabled:=false;
bitbtn3.Enabled:=false;
end;

procedure Tchengjiform.FormCreate(Sender: TObject);
begin
mainform.dataref;
chengjiform.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-chengjiform.Width div 2;
chengjiform.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-chengjiform.Height div 2;
end;

procedure Tchengjiform.BitBtn5Click(Sender: TObject);
begin
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
edit5.Text:='';
edit6.Text:='';
edit7.Text:='';
edit8.Text:='';
edit9.Text:='';
edit10.Text:='';
edit11.Text:='';
edit12.Text:='';
edit2.SetFocus;
dj1:='无';
dj2:='无';
dj3:='无';
dj4:='无';
dj5:='无';
dj6:='无';
dj7:='无';
dj8:='无';
woli:='';
feihuoliang:='';
end;

procedure Tchengjiform.BitBtn7Click(Sender: TObject);
begin
close;
end;

procedure Tchengjiform.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tchengjiform.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if Pos('.',edit2.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tchengjiform.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if Pos('.',edit3.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tchengjiform.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if Pos('.',edit4.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tchengjiform.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if Pos('.',edit5.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tchengjiform.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if Pos('.',edit6.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tchengjiform.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if pos('.',edit7.Text)<>0 then
  if key='.' then
    key:=#0;
end;

procedure Tchengjiform.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if pos('.',edit8.Text)<>0 then
  if key='.' then
    key:=#0;
end;

procedure Tchengjiform.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
  key:=#0;
if Pos('.',edit9.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tchengjiform.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  key:=#0;
end;

procedure Tchengjiform.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  key:=#0;
end;

procedure Tchengjiform.DBGrid1CellClick(Column: TColumn);
begin
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
edit5.Text:='';
edit6.Text:='';
edit7.Text:='';
edit8.Text:='';
edit9.Text:='';
edit10.Text:='';
edit11.Text:='';
edit12.Text:='';
if (ComboBox1.Text<>'')and(DBGrid1.DataSource.DataSet.RecordCount<>0)and(DBGrid1.DataSource.DataSet.eof<>true) then
  begin
  if (DataModule1.stugread.RecordCount<>0)and(DBGrid1.DataSource.DataSet.eof<>true) then
    begin
      with DataModule1.stugread do
        begin
          if Locate('学生编号',DBGrid1.DataSource.DataSet.FieldValues['学生编号'],[])=false then
            begin
              edit1.Text:=DBGrid1.DataSource.DataSet.FieldValues['学生编号'];
            end
          else
            begin
               edit1.Text:=FieldValues['学生编号'];
               if FieldValues['身高']<>'无'  then
               edit2.Text:=FieldValues['身高']
               else edit2.Text:='';
               if FieldValues['体重']<>'无' then
               edit3.Text:=FieldValues['体重']
               else edit3.Text:='';
               if FieldValues['50米跑']<>'无' then
               Edit4.Text:=FieldValues['50米跑']
               else Edit4.Text:='';
               if FieldValues['800米跑']<>'无' then
               edit5.Text:=FieldValues['800米跑']
               else edit5.Text:='';
               if FieldValues['1000米跑']<>'无' then
               edit6.Text:=FieldValues['1000米跑']
               else edit6.Text:='';
               if FieldValues['握力体重']<>'无'then
               edit7.Text:=FieldValues['握力体重']
               else edit7.Text:='';
               if FieldValues['肺活量体重']<>'无'then
               edit8.Text:=FieldValues['肺活量体重']
               else  edit8.Text:='';
               if FieldValues['坐立体前屈']<>'无'then
               edit9.Text:=FieldValues['坐立体前屈']
               else edit9.Text:='';
               if  FieldValues['立定跳远']<>'无'then
               edit10.Text:=FieldValues['立定跳远']
               else edit10.Text:='';
               if FieldValues['仰卧起坐']<>'无'then
               edit11.Text:=FieldValues['仰卧起坐']
               else edit11.Text:='';
               edit12.Text:=FieldValues['总成绩'];
            end;
        end;
    end
  else
    edit1.Text:=DBGrid1.DataSource.DataSet.FieldValues['学生编号'];
  end;  
end;

procedure Tchengjiform.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tchengjiform.BitBtn1Click(Sender: TObject);
var
  stuclass:string;    //保存学生所在班级名称
  sex:string;         //保存学生性别
  year:integer;        //记录以入学的时间
  grade:string;       //保存学制类型
  vheight:string;     //保存超出的身高
begin
  cg1:=0;
  cg2:=0;
  cg3:=0;
  cg4:=0;
  cg5:=0;
  cg6:=0;
  cg7:=0;
  cg8:=0;
  cg9:=0;
  dj1:='无';
  dj2:='无';
  dj3:='无';
  dj4:='无';
  dj5:='无';
  dj6:='无';
  dj7:='无';
  dj8:='无';
  year:=0;
  woli:='';
  feihuoliang:='';
  if edit1.Text<>'' then
    begin
      with DBGrid1.DataSource.DataSet do
        begin
          sex:=FieldValues['学生性别'];
          stuclass:=FieldValues['所属班级名称'];
          if DataModule1.banjixinxi.Locate('班级名称',stuclass,[])=true then
            begin
              if DataModule1.banjixinxi.FieldByName('入学年限').AsString='一年' then
                year:=1
              else if DataModule1.banjixinxi.FieldByName('入学年限').AsString='二年' then
                year:=2
              else if DataModule1.banjixinxi.FieldByName('入学年限').AsString='三年' then
                year:=3
              else if DataModule1.banjixinxi.FieldByName('入学年限').AsString='四年' then
                year:=4
              else if DataModule1.banjixinxi.FieldByName('入学年限').AsString='五年' then
                year:=5;
              grade:=DataModule1.banjixinxi.FieldValues['学制类型'];
            end
          else
            abort;
        end;
      if (grade='大专')or(grade='大学')or(grade='三年制高职')or((year>3)and(grade='五年制高职')) then
        begin
          if sex='男' then
            begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg1:=FieldValues['成绩'];
                               dj1:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then                     
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zdxbothstandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取大学男生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zdxstandhboy do
                    begin
                      if DataModule1.zdxstandhboy.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段']))then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;  
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
////////////////////////////////////////////////////////////////////////////////
//////////////                  男生组结束                   ///////////////////
////////////////////////////////////////////////////////////////////////////////
            end
          else if sex='女' then
            begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg1:=FieldValues['成绩'];
                               dj1:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then                  
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then                     
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then                     
                begin
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zdxbothstandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zdxbothstandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取大学女生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zdxstandhgirl do
                    begin
                      if DataModule1.zdxstandhgirl.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段'])) then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
////////////////////////////////////////////////////////////////////////////////
            end;
////////////////////////////////////////////////////////////////////////////////
////////////                 大学级结束                     ////////////////////
////////////////////////////////////////////////////////////////////////////////
        end
      else if ((year<4)and(grade='中专'))or((year<4)and(grade='高中'))or((year<4)and(grade='五年制高职')) then
        begin
          if year=1 then
            begin
////////////////////////////////////////////////////////////////////////////////
////////////            取高一级男生成绩汇总                       /////////////
////////////////////////////////////////////////////////////////////////////////
              if sex='男' then
                begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                                 cg1:=FieldValues['成绩'];
                                 dj1:=FieldValues['等级'];
                                 Last;
                               end;
                               if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then                  
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then                     
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zgzonestandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取高一男生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zgzstandhboy do
                    begin
                      if DataModule1.zgzstandhboy.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段'])) then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1']))then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                                  
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;  
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
                end
////////////////////////////////////////////////////////////////////////////////
////////////            取高一级女生成绩汇总                       /////////////
////////////////////////////////////////////////////////////////////////////////
              else if sex='女' then
                begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg1:=FieldValues['成绩'];
                               dj1:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then                  
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then                     
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then                     
                begin
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zgzonestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzonestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取高一女生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zgzstandhgirl do
                    begin
                      if DataModule1.zgzstandhgirl.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段']))then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
                end;
////////////////////////////////////////////////////////////////////////////////
///////////////////          高一组结束                     ////////////////////
////////////////////////////////////////////////////////////////////////////////
            end
          else if year=2 then
            begin
////////////////////////////////////////////////////////////////////////////////
////////////            取高二级男生成绩汇总                       /////////////
////////////////////////////////////////////////////////////////////////////////
              if sex='男' then
                begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then
                begin
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg1:=FieldValues['成绩'];
                               dj1:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then
                begin
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then
                begin
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then
                begin
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zgztwostandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取高二男生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zgzstandhboy do
                    begin
                      if DataModule1.zgzstandhboy.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段']))then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
                end
////////////////////////////////////////////////////////////////////////////////
////////////            取高二级女生成绩汇总                       /////////////
////////////////////////////////////////////////////////////////////////////////
              else if sex='女' then
                begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then
                begin
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg1:=FieldValues['成绩'];
                               dj1:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then
                begin
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then
                begin
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then
                begin
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zgztwostandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgztwostandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取高二女生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zgzstandhgirl do
                    begin
                      if DataModule1.zgzstandhgirl.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段']))then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
                end;
            end
          else if year=3 then
            begin
////////////////////////////////////////////////////////////////////////////////
////////////            取高三级男生成绩汇总                       /////////////
////////////////////////////////////////////////////////////////////////////////
              if sex='男' then
                begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then
                begin
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg1:=FieldValues['成绩'];
                               dj1:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then
                begin
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then
                begin
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then
                begin
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zgzthreestandboy do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandboy.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取高三男生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zgzstandhboy do
                    begin
                      if DataModule1.zgzstandhboy.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段']))then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
                end
////////////////////////////////////////////////////////////////////////////////
////////////            取高三级女生成绩汇总                       /////////////
////////////////////////////////////////////////////////////////////////////////
              else if sex='女' then
                begin
            /////////////////////////////////////////////////
                   ///      取50米跑分值     ///
                   /////////////////////////////
              if edit4.Text<>'' then
                begin
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('50米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg1:=FieldValues['成绩'];
                           dj1:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit4.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg1:=FieldValues['成绩'];
                               dj1:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit4.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit4.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg1:=FieldValues['成绩'];
                          dj1:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg1:=0;
                    end;
                end
              else
                cg1:=0;
            /////////////////////////////////////////////////
                   ///     取800米跑分值    ///
                   /////////////////////////////
              if edit5.Text<>'' then
                begin
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('800米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg2:=FieldValues['成绩'];
                           dj2:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit5.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg2:=FieldValues['成绩'];
                               dj2:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit5.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit5.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg2:=FieldValues['成绩'];
                          dj2:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg2:=0;
                    end;
                end
              else
                cg2:=0;
            /////////////////////////////////////////////////
                   ///     取1000米跑分值    ///
                   /////////////////////////////
              if edit6.Text<>'' then
                begin
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('1000米跑');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                         begin
                           cg3:=FieldValues['成绩'];
                           dj3:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToFloat(edit6.Text)<StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                               begin
                               cg3:=FieldValues['成绩'];
                               dj3:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToFloat(edit6.Text)>StrToFloat(FieldValues['上限值']))or(StrToFloat(edit6.Text)=StrToFloat(FieldValues['上限值'])) then
                          begin
                          cg3:=FieldValues['成绩'];
                          dj3:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg3:=0;
                    end;
                end
              else
                cg3:=0;
            /////////////////////////////////////////////////
                   ///      取握力体重指数   ///
                   /////////////////////////////
              if edit7.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      woli:=FloatToStr(StrToFloat(edit7.Text)/StrToFloat(edit3.Text)*100);
                      if pos('.',woli)<>0 then
                        delete(woli,pos('.',woli),length(woli)+1-pos('.',woli));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('握力体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg4:=FieldValues['成绩'];
                           dj4:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(woli)<StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg4:=FieldValues['成绩'];
                               dj4:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(woli)>StrToint(FieldValues['上限值']))or(StrToint(woli)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg4:=FieldValues['成绩'];
                          dj4:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg4:=0;
                    end;
                end
              else
                cg4:=0;
            /////////////////////////////////////////////////
                   ///     取肺活量体重指数  ///
                   /////////////////////////////
              if edit8.Text<>'' then
                begin
                  if (edit3.Text<>'')and(StrToFloat(edit3.Text)<>0) then
                    begin
                      feihuoliang:=FloatToStr(StrToFloat(edit8.Text)/StrToFloat(edit3.Text));
                      if pos('.',feihuoliang)<>0 then
                        delete(feihuoliang,pos('.',feihuoliang),length(feihuoliang)+1-pos('.',feihuoliang));  //取整数值
                    end
                  else
                    begin
                      Application.MessageBox('没有体重信息！请输入体重！','提示');
                      abort;
                    end;
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('肺活量体重指数');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg5:=FieldValues['成绩'];
                           dj5:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(feihuoliang)<StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg5:=FieldValues['成绩'];
                               dj5:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(feihuoliang)>StrToint(FieldValues['上限值']))or(StrToint(feihuoliang)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg5:=FieldValues['成绩'];
                          dj5:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg5:=0;
                    end;
                end
              else
                cg5:=0;
            /////////////////////////////////////////////////
                   ///     取坐立体前屈成绩   ///
                   /////////////////////////////
              if edit9.Text<>'' then
                begin
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('坐立体前屈');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                         begin
                           cg6:=FieldValues['成绩'];
                           dj6:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrTofloat(edit9.Text)<StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                               begin
                               cg6:=FieldValues['成绩'];
                               dj6:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrTofloat(edit9.Text)>StrTofloat(FieldValues['上限值']))or(StrTofloat(edit9.Text)=StrTofloat(FieldValues['上限值'])) then
                          begin
                          cg6:=FieldValues['成绩'];
                          dj6:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg6:=0;
                    end;
                end
              else
                cg6:=0;
            /////////////////////////////////////////////////
                   ///     取立定跳远成绩    ///
                   /////////////////////////////
              if edit10.Text<>'' then
                begin
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg7:=FieldValues['成绩'];
                           dj7:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit10.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg7:=FieldValues['成绩'];
                               dj7:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit10.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit10.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg7:=FieldValues['成绩'];
                          dj7:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg7:=0;
                    end;
                end
              else
                cg7:=0;
            /////////////////////////////////////////////////
                   ///     取仰卧起坐成绩    ///
                   /////////////////////////////
              if edit11.Text<>'' then
                begin
                  with DataModule1.zgzthreestandgirl do
                    begin
                      Filter:='项目='+QuotedStr('立定跳远');
                      Filtered:=true;
                      First;
                    if DataModule1.zgzthreestandgirl.RecordCount<>0 then
                      begin
                       if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                         begin
                           cg8:=FieldValues['成绩'];
                           dj8:=FieldValues['等级'];
                         end
                       else
                         while Eof<>true do
                           begin
                             if (StrToint(edit11.Text)<StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                               begin
                               cg8:=FieldValues['成绩'];
                               dj8:=FieldValues['等级'];
                               Last;
                               end;
                             if Eof<>true then
                               Next;
                           end;
                      if Eof=true then
                        if (StrToint(edit11.Text)>StrToint(FieldValues['上限值']))or(StrToint(edit11.Text)=StrToint(FieldValues['上限值'])) then
                          begin
                          cg8:=FieldValues['成绩'];
                          dj8:=FieldValues['等级'];
                          end;
                      end
                    else
                      cg8:=0;
                    end;
                end
              else
                cg8:=0;
////////////////////////////////////////////////////////////////////////////////
        ///              取高三女生身高标准体重成绩                     ///
        ///////////////////////////////////////////////////////////////////
              if (edit2.Text<>'')and(edit3.Text<>'') then
                begin
                  with  DataModule1.zgzstandhgirl do
                    begin
                      if DataModule1.zgzstandhgirl.RecordCount<>0 then
                        begin
                          First;
                          if (StrToFloat(edit2.Text)<strtofloat(FieldValues['身高段']))then
                            begin
                              if application.MessageBox('身高低于最低值！'+#13+'按照体育标准增加体重！'+#13+'是否继续执行','警告',MB_YESNO)=6 then
                                vheight:=FloatToStr((StrToFloat(FieldValues['身高段'])-StrToFloat(edit2.Text)) * 0.5+StrToFloat(edit3.Text))
                              else vheight:=edit3.Text;
                                  if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                     cg9:=strtoint(FieldValues['体重段1分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                     cg9:=strtoint(FieldValues['体重段2分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                     cg9:=strtoint(FieldValues['体重段3分值'])
                                  else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                     cg9:=strtoint(FieldValues['体重段4分值'])
                                  else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                     cg9:=strtoint(FieldValues['体重段5分值']);
                            end
                          else
                            while eof<>true do
                              begin
                                if (StrToFloat(edit2.Text)<StrToFloat(FieldValues['身高段']))or(StrToFloat(edit2.Text)=strtofloat(FieldValues['身高段'])) then
                                  begin
                                    if (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段2']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段3']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(edit3.Text)<strtofloat(FieldValues['体重段4']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(edit3.Text)>strtofloat(FieldValues['体重段5']))or(StrToFloat(edit3.Text)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                                    Last;
                                  end;
                                if Eof<>true then
                                  Next;
                              end;
                            if eof=True then
                            if (StrToFloat(edit2.Text)>StrToFloat(FieldValues['身高段'])) then
                              begin
                                if application.MessageBox('身高超过最高值，按照标准计重！'+#13+'是否继续执行该操作！','警告',MB_YESNO)=6 then
                                  vheight:=FloatToStr(strtofloat(edit3.Text)-(StrToFloat(edit2.Text)-StrToFloat(FieldValues['身高段']))*0.9)
                                else vheight:=edit3.Text;
                                    if (StrToFloat(vheight)<strtofloat(FieldValues['体重段1'])) then
                                       cg9:=strtoint(FieldValues['体重段1分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段2']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段2'])) then
                                       cg9:=strtoint(FieldValues['体重段2分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段3']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段3'])) then
                                       cg9:=strtoint(FieldValues['体重段3分值'])
                                    else if  (StrToFloat(vheight)<strtofloat(FieldValues['体重段4']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段4'])) then
                                       cg9:=strtoint(FieldValues['体重段4分值'])
                                    else if  (StrToFloat(vheight)>strtofloat(FieldValues['体重段5']))or(StrToFloat(vheight)=strtofloat(FieldValues['体重段5'])) then
                                       cg9:=strtoint(FieldValues['体重段5分值']);
                              end;
                        end
                      else
                        cg9:=0;
                    end;
                end
              else
                cg9:=0;
                end;
            end;
        end
      else
        Application.MessageBox('请检查基本信息设置是否正确！','提示');
    end;
if edit1.Text<>'' then
  begin
    edit12.Text:=IntToStr(cg1+cg2+cg3+cg4+cg5+cg6+cg7+cg8+cg9);
    BitBtn2.Enabled:=true;
    BitBtn3.Enabled:=true;
  end
else
  Application.MessageBox('找不到相关信息！','提示');
end;

procedure Tchengjiform.Edit2Exit(Sender: TObject);
begin
if pos('.',edit2.Text)<>0 then
 if copy(edit2.Text,pos('.',edit2.Text)+1,1)='' then
   begin
     edit2.Text:=edit2.Text+'0';
   end;
if pos('.',edit2.Text)=1 then
  edit2.Text:='0'+edit2.Text;
if edit2.Text<>'' then
if StrToFloat(edit2.Text)>250 then
  if Application.MessageBox('请检查你输入的数据是否过大！'+#13+'是否继续执行！','警告',MB_YESNO)=7 then
    begin
      edit2.SetFocus;
      edit2.SelectAll;
    end;
end;

procedure Tchengjiform.Edit3Exit(Sender: TObject);
begin
if pos('.',edit3.Text)<>0 then
 if copy(edit3.Text,pos('.',edit3.Text)+1,1)='' then
   begin
     edit3.Text:=edit3.Text+'0';
   end;
if pos('.',edit3.Text)=1 then
  edit3.Text:='0'+edit3.Text;
if edit3.Text<>'' then
if StrTofloat(edit3.Text)>150 then
  if Application.MessageBox('请检查你输入的数据是否过大！'+#13+'是否继续执行！','警告',MB_YESNO)=7 then
    begin
      edit3.SetFocus;
      edit3.SelectAll;
    end;
end;

procedure Tchengjiform.Edit7Exit(Sender: TObject);
begin
if pos('.',edit7.Text)<>0 then
 if copy(edit7.Text,pos('.',edit7.Text)+1,1)='' then
   begin
     edit7.Text:=edit7.Text+'0';
   end;
if pos('.',edit7.Text)=1 then
  edit7.Text:='0'+edit7.Text;
if edit7.Text<>'' then
if StrTofloat(edit7.Text)>100 then
  if Application.MessageBox('请检查你输入的数据是否过大！'+#13+'是否继续执行！','警告',MB_YESNO)=7 then
    begin
      edit7.SetFocus;
      edit7.SelectAll;
    end;
end;

procedure Tchengjiform.Edit8Exit(Sender: TObject);
begin
if pos('.',edit8.Text)<>0 then
 if copy(edit8.Text,pos('.',edit8.Text)+1,1)='' then
   begin
     edit8.Text:=edit8.Text+'0';
   end;
if pos('.',edit8.Text)=1 then
  edit8.Text:='0'+edit8.Text;
if edit8.Text<>'' then
if StrTofloat(edit8.Text)>9999 then
  if Application.MessageBox('请检查你输入的数据是否过大！'+#13+'是否继续执行！','警告',MB_YESNO)=7 then
    begin
      edit8.SetFocus;
      edit8.SelectAll;
    end;
end;

procedure Tchengjiform.Edit10Exit(Sender: TObject);
begin
if edit10.Text<>'' then
if StrToInt(edit10.Text)>350 then
  if Application.MessageBox('请检查你输入的数据是否过大！'+#13+'是否继续执行！','警告',MB_YESNO)=7 then
    begin
      edit10.SetFocus;
      edit10.SelectAll;
    end;
end;

procedure Tchengjiform.Edit11Exit(Sender: TObject);
begin
if edit11.Text<>'' then
if StrToInt(edit11.Text)>100 then
  if Application.MessageBox('请检查你输入的数据是否过大！'+#13+'是否继续执行！','警告',MB_YESNO)=7 then
    begin
      edit11.SetFocus;
      edit11.SelectAll;
    end;
end;

procedure Tchengjiform.Edit4Exit(Sender: TObject);
begin
if pos('.',edit4.Text)<>0 then
 if copy(edit4.Text,pos('.',edit4.Text)+1,1)='' then
   begin
     edit4.Text:=edit4.Text+'0';
   end;
if pos('.',edit4.Text)=1 then
  edit4.Text:='0'+edit4.Text;
end;

procedure Tchengjiform.Edit5Exit(Sender: TObject);
begin
if (DBGrid1.DataSource<>DataModule1.Dnull)and(DBGrid1.DataSource.DataSet.RecordCount<>0 )and(edit5.Text<>'') then
  begin
    if DBGrid1.DataSource.DataSet.FieldValues['学生性别']='男' then
      begin
        if Application.MessageBox('应该在1000米项中输入 是否继续！','提示',MB_YESNO)=7 then
          begin
            edit5.Clear;
            edit6.SetFocus;
          end;
      end;
  end;
if pos('.',edit5.Text)<>0 then
 if copy(edit5.Text,pos('.',edit4.Text)+1,1)='' then
   begin
     edit5.Text:=edit5.Text+'0';
   end;
if pos('.',edit5.Text)=1 then
  edit5.Text:='0'+edit5.Text;
end;

procedure Tchengjiform.Edit6Exit(Sender: TObject);
begin
if (DBGrid1.DataSource<>DataModule1.Dnull)and(DBGrid1.DataSource.DataSet.RecordCount<>0 )and(edit6.Text<>'') then
  begin
    if DBGrid1.DataSource.DataSet.FieldValues['学生性别']='女' then
      begin
        if Application.MessageBox('应该在800米项中输入 是否继续！','提示',MB_YESNO)=7 then
          begin
            edit6.Clear;
            edit5.SetFocus;
          end;
      end;
  end;
if pos('.',edit6.Text)<>0 then
 if copy(edit6.Text,pos('.',edit4.Text)+1,1)='' then
   begin
     edit6.Text:=edit6.Text+'0';
   end;
if pos('.',edit6.Text)=1 then
  edit6.Text:='0'+edit6.Text;
end;

procedure Tchengjiform.Edit9Exit(Sender: TObject);
begin
if pos('.',edit9.Text)<>0 then
 if copy(edit9.Text,pos('.',edit9.Text)+1,1)='' then
   begin
     edit9.Text:=edit9.Text+'0';
   end;
if pos('.',edit9.Text)=1 then
  edit9.Text:='0'+edit9.Text;
end;

procedure Tchengjiform.BitBtn4Click(Sender: TObject);
begin
if (edit1.Text<>'')and(DataModule1.dstugread.DataSet.RecordCount<>0)then
  begin
    if DataModule1.Ddengji.DataSet.Locate('学生编号',edit1.Text,[])=true then
      begin
        DataModule1.Ddengji.DataSet.Delete;                                      //等级信息删除
      end;
    if DataModule1.Dstugreadinfo.DataSet.Locate('学生编号',edit1.Text,[])=true then
      begin
        DataModule1.Dstugreadinfo.DataSet.Delete;                                //成绩信息删除
      end;
    if  DataModule1.dstugread.DataSet.Locate('学生编号',edit1.Text,[])=true then
      begin
         DataModule1.dstugread.DataSet.Delete;                                   //原始信息删除
         BitBtn5.Click;
         Application.MessageBox('该学生成绩以被清除！','提示');
      end;
      Refresh;
  end
else
  Application.MessageBox('没有此学生成绩记录！','提示');
end;

procedure Tchengjiform.BitBtn2Click(Sender: TObject);
begin
if (edit1.Text<>'')and(edit12.Text<>'')and(DataModule1.dstugread.DataSet.Locate('学生编号',edit1.Text,[]))=false then
  begin
    with DataModule1.dstugread.DataSet do     //原始录入数据提交
      begin
        Append;
        FieldByName('学生编号').AsString:=edit1.Text;
        if edit2.Text<>''then
        FieldByName('身高').AsString:=edit2.Text
        else FieldByName('身高').AsString:='无';
        if edit3.Text<>'' then
        FieldByName('体重').AsString:=edit3.Text
        else FieldByName('体重').AsString:='无';
        if edit4.Text<>'' then
        FieldByName('50米跑').AsString:=edit4.Text
        else  FieldByName('50米跑').AsString:='无';
        if edit5.Text<>'' then
        FieldByName('800米跑').AsString:=edit5.Text
        else FieldByName('800米跑').AsString:='无';
        if edit6.Text<>'' then
        FieldByName('1000米跑').AsString:=edit6.Text
        else FieldByName('1000米跑').AsString:='无';
        if edit7.Text<>'' then
          begin
            FieldByName('握力体重').AsString:=edit7.Text;
            FieldByName('握力体重指数').AsString:=woli;
          end
        else begin
             FieldByName('握力体重').AsString:='无';
             FieldByName('握力体重指数').AsString:='无';
        end;
        if edit8.Text<>''then
        begin
        FieldByName('肺活量体重').AsString:=edit8.Text;
        FieldByName('肺活量体重指数').AsString:=feihuoliang;
        end
        else  begin
          FieldByName('肺活量体重').AsString:='无';
          FieldByName('肺活量体重指数').AsString:='无';
        end;
        if edit9.Text<>'' then
        FieldByName('坐立体前屈').AsString:=edit9.Text
        else  FieldByName('坐立体前屈').AsString:='无';
        if edit10.Text<>'' then
        FieldByName('立定跳远').AsString:=edit10.Text
        else FieldByName('立定跳远').AsString:='无';
        if edit11.Text<>'' then
        FieldByName('仰卧起坐').AsString:=edit11.Text
        else FieldByName('仰卧起坐').AsString:='无';
        FieldByName('总成绩').AsString:=edit12.Text;
        case  StrToInt(edit12.Text) of
          0..59:  FieldByName('等级评定').AsString:='不及格';
          60..75: FieldByName('等级评定').AsString:='及格';
          76..85: FieldByName('等级评定').AsString:='良';
          86..100:FieldByName('等级评定').AsString:='优';
        end;
        Post;
      end;
      With DataModule1.Ddengji.DataSet do                 //生成等级信息提交
        begin
          Append;
          FieldByName('学生编号').AsString:=edit1.Text;
          FieldByName('50米跑等级').AsString:=dj1;
          FieldByName('800米跑等级').AsString:=dj2;
          FieldByName('1000米跑等级').AsString:=dj3;
          FieldByName('握力体重指数等级').AsString:=dj4;
          FieldByName('肺活量体重指数等级').AsString:=dj5;
          FieldByName('坐立体前屈等级').AsString:=dj6;
          FieldByName('立定跳远等级').AsString:=dj7;
          FieldByName('仰卧起坐等级').AsString:=dj8;
          Post;
        end;
      With DataModule1.Dstugreadinfo.DataSet do                    //运算成绩提交
        begin
          Append;
          FieldByName('学生编号').AsString:=edit1.Text;
          FieldByName('50米跑成绩').AsString:=inttostr(cg1);
          FieldByName('800米跑成绩').AsString:=inttostr(cg2);
          FieldByName('1000米跑成绩').AsString:=inttostr(cg3);
          FieldByName('握力体重指数成绩').AsString:=inttostr(cg4);
          FieldByName('肺活量体重指数成绩').AsString:=inttostr(cg5);
          FieldByName('坐立体前屈成绩').AsString:=inttostr(cg6);
          FieldByName('立定跳远成绩').AsString:=inttostr(cg7);
          FieldByName('仰卧起坐成绩').AsString:=inttostr(cg8);
          FieldByName('身高体重成绩').AsString:=inttostr(cg9);
          Post;
        end;
      Application.MessageBox('数据以全部提交成功！','提示');
    end
    else
      Application.MessageBox('请先对数据进行汇总操作！'+#13+'判断是否有该学生编号存在！'+#13+'或则已经存在该学生成绩','提示');
    BitBtn2.Enabled:=false;
    BitBtn3.Enabled:=false;
    BitBtn5.Click;
end;

procedure Tchengjiform.BitBtn3Click(Sender: TObject);
begin
if DataModule1.dstugread.DataSet.RecordCount<>0 then
  begin
    if (edit1.Text<>'')and(edit12.Text<>'') then
      begin
        with DataModule1.dstugread.DataSet do
          begin
           if Locate('学生编号',edit1.Text,[])=true then
             begin
             Edit;
             FieldByName('学生编号').AsString:=edit1.Text;
             if edit2.Text<>''then
             FieldByName('身高').AsString:=edit2.Text
             else FieldByName('身高').AsString:='无';
             if edit3.Text<>'' then
             FieldByName('体重').AsString:=edit3.Text
             else FieldByName('体重').AsString:='无';
             if edit4.Text<>'' then
             FieldByName('50米跑').AsString:=edit4.Text
             else  FieldByName('50米跑').AsString:='无';
             if edit5.Text<>'' then
             FieldByName('800米跑').AsString:=edit5.Text
             else FieldByName('800米跑').AsString:='无';
             if edit6.Text<>'' then
             FieldByName('1000米跑').AsString:=edit6.Text
             else FieldByName('1000米跑').AsString:='无';
             if edit7.Text<>'' then
             begin
             FieldByName('握力体重').AsString:=edit7.Text;
             FieldByName('握力体重指数').AsString:=woli;
             end
             else  begin
                   FieldByName('握力体重').AsString:='无';
                   FieldByName('握力体重指数').AsString:='无';
             end;
             if edit8.Text<>''then
             begin
             FieldByName('肺活量体重').AsString:=edit8.Text;
             FieldByName('肺活量体重指数').AsString:=feihuoliang;
             end
             else  begin
                   FieldByName('肺活量体重').AsString:='无';
                   FieldByName('肺活量体重指数').AsString:='无';
             end;
             if edit9.Text<>'' then
             FieldByName('坐立体前屈').AsString:=edit9.Text
             else  FieldByName('坐立体前屈').AsString:='无';
             if edit10.Text<>'' then
             FieldByName('立定跳远').AsString:=edit10.Text
             else FieldByName('立定跳远').AsString:='无';
             if edit11.Text<>'' then
             FieldByName('仰卧起坐').AsString:=edit11.Text
             else FieldByName('仰卧起坐').AsString:='无';
             FieldByName('总成绩').AsString:=edit12.Text;
             case  StrToInt(edit12.Text) of
               0..59:  FieldByName('等级评定').AsString:='不及格';
               60..75: FieldByName('等级评定').AsString:='及格';
               76..90: FieldByName('等级评定').AsString:='良';
               91..100:FieldByName('等级评定').AsString:='优';
             end;
             Post;
           end
        else
          begin
            Application.MessageBox('没有找到该学生的成绩信息！','提示');
            abort;    //中断本次操作
          end;
        end;
      with  DataModule1.Ddengji.DataSet do
          begin
            if Locate('学生编号',edit1.Text,[])=true then
              begin
                Edit;
                FieldByName('学生编号').AsString:=edit1.Text;
                FieldByName('50米跑等级').AsString:=dj1;
                FieldByName('800米跑等级').AsString:=dj2;
                FieldByName('1000米跑等级').AsString:=dj3;
                FieldByName('握力体重指数等级').AsString:=dj4;
                FieldByName('肺活量体重指数等级').AsString:=dj5;
                FieldByName('坐立体前屈等级').AsString:=dj6;
                FieldByName('立定跳远等级').AsString:=dj7;
                FieldByName('仰卧起坐等级').AsString:=dj8;
                Post;
              end;
          end;
      with DataModule1.Dstugreadinfo.DataSet do
        begin
          if Locate('学生编号',edit1.Text,[])=true then
            begin
              Edit;
              FieldByName('学生编号').AsString:=edit1.Text;
              FieldByName('50米跑成绩').AsString:=inttostr(cg1);
              FieldByName('800米跑成绩').AsString:=inttostr(cg2);
              FieldByName('1000米跑成绩').AsString:=inttostr(cg3);
              FieldByName('握力体重指数成绩').AsString:=inttostr(cg4);
              FieldByName('肺活量体重指数成绩').AsString:=inttostr(cg5);
              FieldByName('坐立体前屈成绩').AsString:=inttostr(cg6);
              FieldByName('立定跳远成绩').AsString:=inttostr(cg7);
              FieldByName('仰卧起坐成绩').AsString:=inttostr(cg8);
              FieldByName('身高体重成绩').AsString:=inttostr(cg9);
              Post;
            end;
        end;
      Application.MessageBox('完成对数据的修改！','提示');
      BitBtn3.Enabled:=false;
      BitBtn2.Enabled:=false;
  end
    else
      Application.MessageBox('学生编号为空！','提示');
  end
else
  Application.MessageBox('学生成绩信息为空！请添加学生成绩信息！','提示');
end;



procedure Tchengjiform.BitBtn6Click(Sender: TObject);
begin
  chengjiform.Hide;
  printform.ShowModal;
  chengjiform.Close;
end;

procedure Tchengjiform.ComboBox2Enter(Sender: TObject);
begin
if DataModule1.xibie.RecordCount<>0 then
  ComboBox2.Clear;
  DataModule1.xibie.First;
  while DataModule1.xibie.Eof<>true do
    begin
      ComboBox2.Items.Add(DataModule1.xibie.FieldValues['院系名称']);
      DataModule1.xibie.Next;
    end;
  DataModule1.xibie.First;
end;

procedure Tchengjiform.ComboBox2Change(Sender: TObject);
begin
BitBtn5.Click;
ComboBox1.Text:='';
DBGrid1.DataSource:=DataModule1.Dnull;
end;


procedure tchengjiform.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
    with msg.minmaxinfo^ do

    begin
      ptMinTrackSize:=point(812,483);//  限定大小
      ptMaxTrackSize:=point(812,483); // 限定大小
    end;
end;



end.
