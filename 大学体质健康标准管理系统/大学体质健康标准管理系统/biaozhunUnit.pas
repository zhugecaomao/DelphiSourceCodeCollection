unit biaozhunUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, Menus,
  OleServer, Word2000, BusinessSkinForm;

type
  Tbiaozhunform = class(TForm)
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    cdengji: TComboBox;
    cfenzu: TComboBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cguolv: TComboBox;
    gsgnan: TGroupBox;
    gbznan: TGroupBox;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label15: TLabel;
    ComboBox1: TComboBox;
    Label16: TLabel;
    Edit12: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    ComboBox2: TComboBox;
    Edit13: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    PopupMenu1: TPopupMenu;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure cdengjiChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdengjiKeyPress(Sender: TObject; var Key: Char);
    procedure cguolvKeyPress(Sender: TObject; var Key: Char);
    procedure cfenzuChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure cguolvChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure cfenzuKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    procedure wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);message wm_getminmaxinfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  biaozhunform: Tbiaozhunform;

implementation
uses dataunit, DB,mainunit;

{$R *.dfm}

procedure Tbiaozhunform.cdengjiChange(Sender: TObject);
begin
if cdengji.Text<>'' then
cfenzu.Enabled:=true;
cfenzu.Text:='';
n1.Enabled:=false;
n2.Enabled:=false;
n3.Enabled:=false;
n4.Enabled:=false;
BitBtn1.Enabled:=false;
BitBtn2.Enabled:=false;
bitbtn3.Enabled:=false;
bitbtn5.Enabled:=false;
gsgnan.Enabled:=false;
cguolv.Enabled:=false;
BitBtn7.Enabled:=false;
n6.Enabled:=false;

gsgnan.Caption:='身高标准体重' ;
gbznan.Enabled:=false;
gbznan.Caption:='平分标准';
BitBtn8.Click;
DBGrid1.DataSource:=DataModule1.Dnull;
end;

procedure Tbiaozhunform.FormCreate(Sender: TObject);
begin
mainform.dataref;
biaozhunform.Left:=GetSystemMetrics(SM_CXSCREEN)div 2-biaozhunform.Width div 2;
biaozhunform.Top:=GetSystemMetrics(SM_CYSCREEN)div 2-biaozhunform.Height div 2;
end;

procedure Tbiaozhunform.cdengjiKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tbiaozhunform.cguolvKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tbiaozhunform.cfenzuChange(Sender: TObject);
begin
if (cfenzu.Text='平分标准男组')or(cfenzu.Text='平分标准女组') then
  begin
  BitBtn7.Enabled:=false;
  cguolv.Enabled:=true;
  end
else
  begin
  bitbtn7.Enabled:=false;
  cguolv.Enabled:=false;
  end;
              //选择标准库并打开//
case cdengji.ItemIndex of
  0: begin
       case cfenzu.ItemIndex of
         0: begin
              DBGrid1.DataSource:=DataModule1.bzgzheigboy;
            end;
         1: begin
              DBGrid1.DataSource:=DataModule1.bzgzheiggirl;
            end;
         2: begin
              DBGrid1.DataSource:=DataModule1.bzgzoneboy;
            end;
         3: begin
              DBGrid1.DataSource:=DataModule1.bzgzonegirl;
            end;
       end;
     end;
  1: begin
       case cfenzu.ItemIndex of
         0: begin
              DBGrid1.DataSource:=DataModule1.bzgzheigboy;
            end;
         1: begin
              DBGrid1.DataSource:=DataModule1.bzgzheiggirl;
            end;
         2: begin
              DBGrid1.DataSource:=DataModule1.bzgztwoboy;
            end;
         3: begin
              DBGrid1.DataSource:=DataModule1.bzgztwogirl;
            end;
       end;
     end;
  2: begin
       case cfenzu.ItemIndex of
         0: begin
              DBGrid1.DataSource:=DataModule1.bzgzheigboy;
            end;
         1: begin
              DBGrid1.DataSource:=DataModule1.bzgzheiggirl;
            end;
         2: begin
              DBGrid1.DataSource:=DataModule1.bzgzthreeboy;
            end;
         3: begin
              DBGrid1.DataSource:=DataModule1.bzgzthreegirl;
            end;
       end;
     end;
  3: begin
       case cfenzu.ItemIndex of
         0: begin
              DBGrid1.DataSource:=DataModule1.bzdxheighboy;
            end;
         1: begin
              DBGrid1.DataSource:=DataModule1.bzdxheiggirl;
            end;
         2: begin
              DBGrid1.DataSource:=DataModule1.bzdxbothboy;
            end;
         3: begin
              DBGrid1.DataSource:=DataModule1.bzdxbothgirl;
            end;
       end;
     end;
end;

case cfenzu.ItemIndex of
  0,1:begin
        gbznan.Enabled:=false;
        ComboBox1.Enabled:=false;
        edit12.Enabled:=false;
        edit13.Enabled:=false;
        ComboBox2.Enabled:=false;
        gsgnan.Enabled:=true;
        gsgnan.Caption:='身高标准体重......编辑中......';
        gbznan.Caption:='平分标准';
        BitBtn1.Enabled:=true;
      end;
  2,3:begin
        gsgnan.Enabled:=false;
        gbznan.Enabled:=true;
        ComboBox1.Enabled:=true;
        edit12.Enabled:=true;
        edit13.Enabled:=true;
        ComboBox2.Enabled:=true;
        gsgnan.Caption:='身高标准体重';
        gbznan.Caption:='平分标准......编辑中......';
        BitBtn1.Enabled:=false;
        Application.MessageBox('选择项目可添加数据！','提示');
      end;
end;
if cfenzu.Text<>'' then
  begin
    BitBtn2.Enabled:=true;
    BitBtn3.Enabled:=true;
    BitBtn5.Enabled:=true;
    n1.Enabled:=true;
    n2.Enabled:=true;
    n3.Enabled:=true;
    n4.Enabled:=true;
    n6.Enabled:=true;
    DBGrid1.DataSource.DataSet.Filtered:=false;
  end;
cguolv.Text:='';
BitBtn8.Click;
end;

procedure Tbiaozhunform.FormShow(Sender: TObject);
begin
mainform.dataref;
cdengji.Text:='';
cfenzu.Text:='';
cguolv.Text:='';
cfenzu.Enabled:=false;
cguolv.Enabled:=false;
BitBtn1.Enabled:=false;
bitbtn2.Enabled:=false;
BitBtn3.Enabled:=false;
BitBtn5.Enabled:=false;
DBGrid1.DataSource:=DataModule1.Dnull;
end;

procedure Tbiaozhunform.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  begin
    key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  begin
    key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  begin
    key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  begin
    key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  begin
    key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
  begin
    key:=#0;
  end;
if Pos('.',edit6.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
  begin
    key:=#0;
  end;
if Pos('.',edit5.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
  begin
    key:=#0;
  end;
if Pos('.',edit4.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
  begin
    key:=#0;
  end;
if Pos('.',edit3.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
  begin
    key:=#0;
  end;
if Pos('.',edit2.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
  begin
    key:=#0;
  end;
if Pos('.',edit1.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
  begin
    key:=#0;
  end;
if Pos('.',edit12.Text)<>0 then
  begin
    if key='.' then
      key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
  begin
    key:=#0;
  end;
end;

procedure Tbiaozhunform.Edit1Exit(Sender: TObject);
begin
if pos('.',edit1.Text)<>0 then
 if copy(edit1.Text,pos('.',edit1.Text)+1,1)='' then
   begin
     edit1.Text:=edit1.Text+'0';
   end;
if pos('.',edit1.Text)=1 then
  edit1.Text:='0'+edit1.Text;
if (edit1.Text<>'')and(StrToFloat(edit1.Text)>299) then
  if  Application.MessageBox('输入范围过大！'+#13+'是否继续输入！','警告',MB_YESNO)=7 then
    begin
      edit1.SetFocus;
      edit1.SelectAll;
    end;
end;

procedure Tbiaozhunform.Edit2Exit(Sender: TObject);
begin
if pos('.',edit2.Text)<>0 then
 if copy(edit2.Text,pos('.',edit2.Text)+1,1)='' then
   begin
     edit2.Text:=edit2.Text+'0';
   end;
if pos('.',edit2.Text)=1 then
  edit2.Text:='0'+edit2.Text;
if (edit2.Text<>'')and(StrToFloat(edit2.Text)>150) then
  if  Application.MessageBox('输入范围过大！'+#13+'是否继续输入！','警告',MB_YESNO)=7 then
    begin
      edit2.SetFocus;
      edit2.SelectAll;
    end;
end;

procedure Tbiaozhunform.Edit3Exit(Sender: TObject);
begin
if pos('.',edit3.Text)<>0 then
 if copy(edit3.Text,pos('.',edit3.Text)+1,1)='' then
   begin
     edit3.Text:=edit3.Text+'0';
   end;
if pos('.',edit3.Text)=1 then
  edit3.Text:='0'+edit3.Text;
if (edit3.Text<>'')and(StrToFloat(edit3.Text)>150) then
  if  Application.MessageBox('输入范围过大！'+#13+'是否继续输入！','警告',MB_YESNO)=7 then
    begin
      edit3.SetFocus;
      edit3.SelectAll;
    end;
end;

procedure Tbiaozhunform.Edit4Exit(Sender: TObject);
begin
if pos('.',edit4.Text)<>0 then
 if copy(edit4.Text,pos('.',edit4.Text)+1,1)='' then
   begin
     edit4.Text:=edit4.Text+'0';
   end;
if pos('.',edit4.Text)=1 then
  edit4.Text:='0'+edit4.Text;
if (edit4.Text<>'')and(StrToFloat(edit4.Text)>150) then
  if  Application.MessageBox('输入范围过大！'+#13+'是否继续输入！','警告',MB_YESNO)=7 then
    begin
      edit4.SetFocus;
      edit4.SelectAll;
    end;
end;

procedure Tbiaozhunform.Edit5Exit(Sender: TObject);
begin
if pos('.',edit5.Text)<>0 then
 if copy(edit5.Text,pos('.',edit5.Text)+1,1)='' then
   begin
     edit5.Text:=edit5.Text+'0';
   end;
if pos('.',edit5.Text)=1 then
  edit5.Text:='0'+edit5.Text;
if (edit5.Text<>'')and(StrToFloat(edit5.Text)>150) then
  if  Application.MessageBox('输入范围过大！'+#13+'是否继续输入！','警告',MB_YESNO)=7 then
    begin
      edit5.SetFocus;
      edit5.SelectAll;
    end;
end;

procedure Tbiaozhunform.Edit6Exit(Sender: TObject);
begin
if pos('.',edit6.Text)<>0 then
 if copy(edit6.Text,pos('.',edit6.Text)+1,1)='' then
   begin
     edit6.Text:=edit6.Text+'0';
   end;
if pos('.',edit6.Text)=1 then
  edit6.Text:='0'+edit6.Text;
if (edit6.Text<>'')and(StrToFloat(edit6.Text)>150) then
  if  Application.MessageBox('输入范围过大！'+#13+'是否继续输入！','警告',MB_YESNO)=7 then
    begin
      edit6.SetFocus;
      edit6.SelectAll;
    end;
end;

procedure Tbiaozhunform.Edit13Exit(Sender: TObject);
begin
if (edit13.Text<>'')and(StrToFloat(edit13.Text)>100) then
  begin
    Application.MessageBox('输入范围过大！','警告');
    edit13.SetFocus;
    edit13.SelectAll;
  end;
end;

procedure Tbiaozhunform.BitBtn1Click(Sender: TObject);
var
  ro1,ro2:Double;
begin
if gsgnan.Enabled=true then   /////////身高标准体重数据添加
  begin
    if (edit1.Text<>'')and(edit2.Text<>'')and(edit3.Text<>'')and(edit4.Text<>'')and(edit5.Text<>'')and(edit11.Text<>'')
       and(edit5.Text<>'')and(edit6.Text<>'')and(edit7.Text<>'')and(edit8.Text<>'')and(edit9.Text<>'')and(edit10.Text<>'') then
      begin
        with DBGrid1.DataSource.DataSet do
          begin
            if Locate('身高段',edit1.Text,[])=false then
              begin
              ///////////////////////////////////////////////////////////////输入限制
            if DBGrid1.DataSource.DataSet.RecordCount<>0 then
              begin
                  if pos('.',edit1.Text)<>0 then
                    ro1:=StrToFloat(edit1.Text)
                  else
                    ro1:=StrToInt(edit1.Text);
                 DBGrid1.DataSource.DataSet.Last;
                  if pos('.',string(FieldValues['身高段']))<>0 then
                    ro2:=StrToFloat(FieldValues['身高段'])
                  else
                    ro2:=StrToInt(FieldValues['身高段']);
                  if ro1<ro2 then
                    begin
                      Application.MessageBox('身高段值必须大于上一列数值！','提示');
                      abort;
                    end;
                end;
              ////////////////////////////////////////////////////////////////
                Append;
                FieldByName('身高段').AsString:=edit1.Text;
                FieldByName('体重段1').AsString:=edit2.Text;
                FieldByName('体重段2').AsString:=edit3.Text;
                FieldByName('体重段3').AsString:=edit4.Text;
                FieldByName('体重段4').AsString:=edit5.Text;
                FieldByName('体重段5').AsString:=edit6.Text;
                FieldByName('体重段1分值').AsString:=edit7.Text;
                FieldByName('体重段2分值').AsString:=edit8.Text;
                FieldByName('体重段3分值').AsString:=edit9.Text;
                FieldByName('体重段4分值').AsString:=edit10.Text;
                FieldByName('体重段5分值').AsString:=edit11.Text;
                Post;
              end
            else
              Application.MessageBox('存在相同的数据！','提示');
          end;
      end
    else
      Application.MessageBox('请将数据输入完整！','提示');
  end
else if gbznan.Enabled=true then      /////////平分标准数据添加
  begin
    if (ComboBox1.Text<>'')and(edit12.Text<>'')and(edit13.Text<>'')and(ComboBox2.Text<>'') then
      begin
      with DBGrid1.DataSource.DataSet do
        begin
          if Locate('上限值',edit12.Text,[])=false then
            begin
            ////////////////////////////////////////////////////////////// 输入限制
            if DBGrid1.DataSource.DataSet.RecordCount<>0 then
              begin
                  if pos('.',edit12.Text)<>0 then
                    ro1:=StrToFloat(edit12.Text)
                  else
                    ro1:=StrToInt(edit12.Text);
                 DBGrid1.DataSource.DataSet.Last;
                  if pos('.',string(FieldValues['上限值']))<>0 then
                    ro2:=StrToFloat(FieldValues['上限值'])
                  else
                    ro2:=StrToInt(FieldValues['上限值']);
                  if ro1<ro2 then
                    begin
                      Application.MessageBox('上限值必须大于上一列数值！','提示');
                      abort;
                    end;
                end;
              /////////////////////////////////////////////////////////////
            Append;
            FieldByName('项目').AsString:=ComboBox1.Text;
            FieldByName('上限值').AsString:=edit12.Text;
            FieldByName('成绩').AsString:=edit13.Text;
            FieldByName('等级').AsString:=ComboBox2.Text;
            Post;
            end
          else
            Application.MessageBox('有相同的数据存在！'+#13+'请检查输入是否正确！','警告');
        end;
      end
    else
      Application.MessageBox('请将数据输入完整！','提示');
  end;
end;

procedure Tbiaozhunform.Edit11Exit(Sender: TObject);
begin
if (edit11.Text<>'')and(StrToFloat(edit11.Text)>100) then
  begin
    Application.MessageBox('输入范围过大！','警告');
    edit11.SetFocus;
    edit11.SelectAll;
  end;
end;

procedure Tbiaozhunform.Edit10Exit(Sender: TObject);
begin
if (edit10.Text<>'')and(StrToFloat(edit10.Text)>100) then
  begin
    Application.MessageBox('输入范围过大！','警告');
    edit10.SetFocus;
    edit10.SelectAll;
  end;
end;

procedure Tbiaozhunform.Edit9Exit(Sender: TObject);
begin
if (edit9.Text<>'')and(StrToFloat(edit9.Text)>100) then
  begin
    Application.MessageBox('输入范围过大！','警告');
    edit9.SetFocus;
    edit9.SelectAll;
  end;
end;

procedure Tbiaozhunform.Edit8Exit(Sender: TObject);
begin
if (edit8.Text<>'')and(StrToFloat(edit8.Text)>100) then
  begin
    Application.MessageBox('输入范围过大！','警告');
    edit8.SetFocus;
    edit8.SelectAll;
  end;
end;

procedure Tbiaozhunform.Edit7Exit(Sender: TObject);
begin
if (edit7.Text<>'')and(StrToFloat(edit7.Text)>100) then
  begin
    Application.MessageBox('输入范围过大！','警告');
    edit7.SetFocus;
    edit7.SelectAll;
  end;
end;

procedure Tbiaozhunform.BitBtn7Click(Sender: TObject);
begin
DBGrid1.DataSource.DataSet.Filtered:=false;
cguolv.Text:='';
BitBtn1.Enabled:=false;
bitbtn7.Enabled:=false;
n6.Enabled:=true;
end;

procedure Tbiaozhunform.cguolvChange(Sender: TObject);
begin
if cguolv.Text<>'' then
begin
  DBGrid1.DataSource.DataSet.Filter:='项目='+QuotedStr(cguolv.Text);
  DBGrid1.DataSource.DataSet.Filtered:=true;
  ComboBox1.Text:=cguolv.Text;
end;
BitBtn1.Enabled:=true;
bitbtn7.Enabled:=true;
n6.Enabled:=false;
end;

procedure Tbiaozhunform.BitBtn2Click(Sender: TObject);
begin
if Application.MessageBox('请确保删除的数据没有作用！'+#13+'是否删除此数据!','提示',MB_YESNO)=6 then
  begin
    if DBGrid1.DataSource.DataSet.RecordCount<>0 then
      begin
        DBGrid1.DataSource.DataSet.Delete;
      end
    else
      Application.MessageBox('没有任何数据存在！','提示');
  end;
end;

procedure Tbiaozhunform.BitBtn6Click(Sender: TObject);
begin
Close;
end;

procedure Tbiaozhunform.BitBtn5Click(Sender: TObject);
begin
if Application.MessageBox('是否确信清空的数据对以后没有影响！','警告',MB_YESNO)=6 then
  begin
    DBGrid1.DataSource.DataSet.First;
    while DBGrid1.DataSource.DataSet.RecordCount<>0 do
      begin
        DBGrid1.DataSource.DataSet.Delete;
      end;
    BitBtn8.Click;
  end;
end;



procedure Tbiaozhunform.BitBtn3Click(Sender: TObject);
var
  tag:integer;
  xiougai1,xiougai2:Double;
begin
tag:=DBGrid1.DataSource.DataSet.RecNo;
if Application.MessageBox('请确保你所修改数据的正确性！'+#13+'是否确认修改！','提示',MB_YESNO)=6 then
  begin
    if gsgnan.Enabled=true then
      begin
        if (edit1.Text<>'')and(edit2.Text<>'')and(edit2.Text<>'')and(edit2.Text<>'')and(edit2.Text<>'')and(edit2.Text<>'')
           and(edit2.Text<>'')and(edit2.Text<>'')and(edit2.Text<>'')and(edit2.Text<>'')and(edit2.Text<>'') then
          begin
            DBGrid1.DataSource.DataSet.Locate('身高段',edit1.Text,[]);
            if DBGrid1.DataSource.DataSet.RecNo=tag then
              begin
                with DBGrid1.DataSource.DataSet do
                  begin
                  //////////////////////////////////////////////////////修改限制
            if DBGrid1.DataSource.DataSet.RecordCount<>0 then
              begin
                  if pos('.',edit1.Text)<>0 then
                    xiougai1:=StrToFloat(edit1.Text)
                  else
                    xiougai1:=StrToInt(edit1.Text);
                  if RecNo<>1 then
                    begin
                      FindPrior;
                      if pos('.',string(FieldValues['身高段']))<>0 then
                        xiougai2:=StrToFloat(FieldValues['身高段'])
                      else
                        xiougai2:=StrToInt(FieldValues['身高段']);
                        Next;
                      if xiougai1<xiougai2 then
                        begin
                          Application.MessageBox('身高段值必须大于上一列数值！','提示');
                          abort;
                        end;
                    end
                  else
                    begin
                      if pos('.',string(FieldValues['身高段']))<>0 then
                        xiougai2:=StrToFloat(FieldValues['身高段'])
                      else
                        xiougai2:=StrToInt(FieldValues['身高段']);
                      if xiougai1>xiougai2 then
                        begin
                          Application.MessageBox('身高段值必须小于下一列数值！','提示');
                          abort;
                        end;
                    end;
                end;
                  //////////////////////////////////////////////////////
                    Edit;
                    FieldByName('身高段').AsString:=edit1.Text;
                    FieldByName('体重段1').AsString:=edit2.Text;
                    FieldByName('体重段2').AsString:=edit3.Text;
                    FieldByName('体重段3').AsString:=edit4.Text;
                    FieldByName('体重段4').AsString:=edit5.Text;
                    FieldByName('体重段5').AsString:=edit6.Text;
                    FieldByName('体重段1分值').AsString:=edit7.Text;
                    FieldByName('体重段2分值').AsString:=edit8.Text;
                    FieldByName('体重段3分值').AsString:=edit9.Text;
                    FieldByName('体重段4分值').AsString:=edit10.Text;
                    FieldByName('体重段5分值').AsString:=edit11.Text;
                    Post;
                    Refresh;
                  end;
              end
              else
                begin
                  Application.MessageBox('存在相同的数据！','提示');
                  DBGrid1.DataSource.DataSet.RecNo:=tag;
                end;
          end
        else
          Application.MessageBox('所需数据没有填写完整！','提示');
      end
    else if gbznan.Enabled=true then
      begin
        if (ComboBox1.Text<>'')and(edit12.Text<>'')and(edit13.Text<>'')and(ComboBox2.Text<>'') then
          begin
            With DBGrid1.DataSource.DataSet do
              begin
              /////////////////////////////////////////////////////////修改限制
            if DBGrid1.DataSource.DataSet.RecordCount<>0 then
              begin
                  if pos('.',edit12.Text)<>0 then
                    xiougai1:=StrToFloat(edit12.Text)
                  else
                    xiougai1:=StrToInt(edit12.Text);
                    FindPrior;
                  if pos('.',string(FieldValues['上限值']))<>0 then
                    xiougai2:=StrToFloat(FieldValues['上限值'])
                  else
                    xiougai2:=StrToInt(FieldValues['上限值']);
                    Next;
                  if xiougai1<xiougai2 then
                    begin
                      Application.MessageBox('身高段值必须大于上一列数值！','提示');
                      abort;
                    end;
                end;

              /////////////////////////////////////////////////////////
                Edit;
                FieldByName('项目').AsString:=ComboBox1.Text;
                FieldByName('上限值').AsString:=edit12.Text;
                FieldByName('成绩').AsString:=edit13.Text;
                FieldByName('等级').AsString:=ComboBox2.Text;
                Post;
                Refresh;
              end;
          end
        else
          Application.MessageBox('请将数据填写完整！','提示');
      end;
  end;
end;

procedure Tbiaozhunform.DBGrid1CellClick(Column: TColumn);
begin
if gsgnan.Enabled=true then
  begin
    if (DBGrid1.DataSource.DataSet.RecordCount<>0)and(DBGrid1.DataSource.DataSet.eof<>true) then
    with DBGrid1.DataSource.DataSet do
      begin
        edit1.Text:=FieldValues['身高段'];
        edit2.Text:=FieldValues['体重段1'];
        edit3.Text:=FieldValues['体重段2'];
        edit4.Text:=FieldValues['体重段3'];
        edit5.Text:=FieldValues['体重段4'];
        edit6.Text:=FieldValues['体重段5'];
        edit7.Text:=FieldValues['体重段1分值'];
        edit8.Text:=FieldValues['体重段2分值'];
        edit9.Text:=FieldValues['体重段3分值'];
        edit10.Text:=FieldValues['体重段4分值'];
        edit11.Text:=FieldValues['体重段5分值'];
      end;
  end
else if gbznan.Enabled=true then
  begin
    if (DBGrid1.DataSource.DataSet.RecordCount<>0)and(DBGrid1.DataSource.DataSet.eof<>true) then
    with DBGrid1.DataSource.DataSet do
      begin
        ComboBox1.Text:=FieldValues['项目'];
        edit12.Text:=FieldValues['上限值'];
        edit13.Text:=FieldValues['成绩'];
        ComboBox2.Text:=FieldValues['等级'];
      end;
  end;
end;

procedure Tbiaozhunform.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tbiaozhunform.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure Tbiaozhunform.BitBtn8Click(Sender: TObject);
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
edit13.Text:='';
ComboBox1.Text:='';
ComboBox2.Text:='';
if gsgnan.Enabled=true then
  begin
    edit1.SetFocus;
    edit1.SelectAll;
  end;
if gbznan.Enabled=true then
  begin
    edit12.SetFocus;
    edit12.SelectAll;
  end;

end;

procedure Tbiaozhunform.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
mainform.closetable;
mainform.Show;
end;


procedure Tbiaozhunform.Edit12Exit(Sender: TObject);
begin
if pos('.',edit12.Text)<>0 then
 if copy(edit12.Text,pos('.',edit12.Text)+1,1)='' then
   begin
     edit12.Text:=edit12.Text+'0';
   end;
if pos('.',edit12.Text)=1 then
  edit12.Text:='0'+edit12.Text;
end;

procedure Tbiaozhunform.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.Edit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=Vk_return) then
  begin
    if BitBtn1.Enabled=true then
      BitBtn1.Click;
  end;
end;

procedure Tbiaozhunform.ComboBox1Change(Sender: TObject);
begin
if BitBtn1.Enabled=true then
  begin
    cguolv.Text:=ComboBox1.Text;
    DBGrid1.DataSource.DataSet.Filter:='项目='+QuotedStr(cguolv.Text);
    DBGrid1.DataSource.DataSet.Filtered:=true;
  end;
edit12.Text:='';
edit13.Text:='';
ComboBox2.Text:='';
end;

procedure Tbiaozhunform.cfenzuKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;


procedure tbiaozhunform.wmgetminmaxinfo(var msg :TWMGetMinMaxInfo);
begin
    with msg.minmaxinfo^ do

    begin
      ptMinTrackSize:=point(827,491);//  限定大小
      ptMaxTrackSize:=point(827,491); // 限定大小
    end;
end;


procedure Tbiaozhunform.N1Click(Sender: TObject);
begin
if bitbtn1.Enabled=true then
BitBtn1.Click;
end;

procedure Tbiaozhunform.N2Click(Sender: TObject);
begin
if bitbtn2.Enabled=true then
bitbtn2.Click;
end;

procedure Tbiaozhunform.N3Click(Sender: TObject);
begin
if bitbtn3.Enabled=true then
bitbtn3.Click;
end;

procedure Tbiaozhunform.N4Click(Sender: TObject);
begin
if bitbtn5.Enabled=true then
bitbtn5.Click;
end;

procedure Tbiaozhunform.N6Click(Sender: TObject);
var
  intag1,intag2:Double;
begin
if BitBtn3.Enabled=true then
  begin
//////////////////////////////////////// 数据插入
if gsgnan.Enabled=true then   /////////身高标准体重数据插入
  begin
    if (edit1.Text<>'')and(edit2.Text<>'')and(edit3.Text<>'')and(edit4.Text<>'')and(edit5.Text<>'')and(edit11.Text<>'')
       and(edit5.Text<>'')and(edit6.Text<>'')and(edit7.Text<>'')and(edit8.Text<>'')and(edit9.Text<>'')and(edit10.Text<>'') then
      begin
        with DBGrid1.DataSource.DataSet do
          begin
            if Locate('身高段',edit1.Text,[])=false then
              begin
              ///////////////////////////////////////////////////////////////输入限制
            if DBGrid1.DataSource.DataSet.RecordCount<>0 then
              begin
                    if pos('.',edit1.Text)<>0 then
                      intag1:=StrToFloat(edit1.Text)
                    else
                      intag1:=StrToInt(edit1.Text);
                    if RecNo<>1 then
                      begin
                        FindPrior;
                        if pos('.',string(FieldValues['身高段']))<>0 then
                          intag2:=StrToFloat(FieldValues['身高段'])
                        else
                          intag2:=StrToInt(FieldValues['身高段']);
                          Next;
                        if intag1<intag2 then
                          begin
                            Application.MessageBox('身高段值必须大于上一列数值！','提示');
                            abort;
                          end;
                      end
                    else
                      begin
                        if pos('.',string(FieldValues['身高段']))<>0 then
                          intag2:=StrToFloat(FieldValues['身高段'])
                        else
                          intag2:=StrToInt(FieldValues['身高段']);
                       if intag1>intag2 then
                         begin
                           Application.MessageBox('身高段值必须小于下一列数值！','提示');
                           abort;
                         end;
                      end;

                end;
              ////////////////////////////////////////////////////////////////
                Insert;
                FieldByName('身高段').AsString:=edit1.Text;
                FieldByName('体重段1').AsString:=edit2.Text;
                FieldByName('体重段2').AsString:=edit3.Text;
                FieldByName('体重段3').AsString:=edit4.Text;
                FieldByName('体重段4').AsString:=edit5.Text;
                FieldByName('体重段5').AsString:=edit6.Text;
                FieldByName('体重段1分值').AsString:=edit7.Text;
                FieldByName('体重段2分值').AsString:=edit8.Text;
                FieldByName('体重段3分值').AsString:=edit9.Text;
                FieldByName('体重段4分值').AsString:=edit10.Text;
                FieldByName('体重段5分值').AsString:=edit11.Text;
                Post;
              end
            else
              Application.MessageBox('存在相同的数据！','提示');
          end;
      end
    else
      Application.MessageBox('请将数据输入完整！','提示');
  end
else if gbznan.Enabled=true then      /////////平分标准数据插入
  begin
    if (ComboBox1.Text<>'')and(edit12.Text<>'')and(edit13.Text<>'')and(ComboBox2.Text<>'') then
      begin
      with DBGrid1.DataSource.DataSet do
        begin
          if Locate('上限值',edit12.Text,[])=false then
            begin
            ////////////////////////////////////////////////////////////// 输入限制
            if DBGrid1.DataSource.DataSet.RecordCount<>0 then
              begin
                  if pos('.',edit12.Text)<>0 then
                    intag1:=StrToFloat(edit12.Text)
                  else
                    intag1:=StrToInt(edit12.Text);
                  if RecNo<>1 then
                    begin
                      FindPrior;
                      if ComboBox1.Text=FieldValues['项目'] then
                        begin
                          if pos('.',string(FieldValues['上限值']))<>0 then
                            intag2:=StrToFloat(FieldValues['上限值'])
                          else
                           intag2:=StrToInt(FieldValues['上限值']);
                           Next;
                        if intag1<intag2 then
                          begin
                            Application.MessageBox('上限值必须大于上一列数值！','提示');
                            abort;
                          end;
                        end
                      else
                        begin
                          next;
                          if pos('.',string(FieldValues['上限值']))<>0 then
                            intag2:=StrToFloat(FieldValues['上限值'])
                          else
                           intag2:=StrToInt(FieldValues['上限值']);
                        if intag1>intag2 then
                          begin
                            Application.MessageBox('上限值必须小于下一列数值！','提示');
                            abort;
                          end;
                        end;
                    end
                  else
                    begin
                      if pos('.',string(FieldValues['上限值']))<>0 then
                        intag2:=StrToFloat(FieldValues['上限值'])
                      else
                        intag2:=StrToInt(FieldValues['上限值']);
                    if intag1>intag2 then
                      begin
                        Application.MessageBox('上限值必须小于下一列数值！','提示');
                        abort;
                      end;
                    end;
              end;
              /////////////////////////////////////////////////////////////
            Insert;
            FieldByName('项目').AsString:=ComboBox1.Text;
            FieldByName('上限值').AsString:=edit12.Text;
            FieldByName('成绩').AsString:=edit13.Text;
            FieldByName('等级').AsString:=ComboBox2.Text;
            Post;
            end
          else
            Application.MessageBox('有相同的数据存在！'+#13+'请检查输入是否正确！','警告');
        end;
      end
    else
      Application.MessageBox('请将数据输入完整！','提示');
////////////////////////////////////////
  end;
end;
end;

end.
