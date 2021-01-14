unit luru;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, StdCtrls, Buttons, ExtCtrls, ADODB, ComCtrls;
type
   Tlurufrm = class(TForm)
    Panel1: TPanel;
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
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    xmedit: TEdit;
    csd1edit: TComboBox;
    csd2edit: TComboBox;
    csd3edit: TComboBox;
    csyzedit: TComboBox;
    tzedit: TComboBox;
    scedit: TComboBox;
    mqxmedit: TEdit;
    mqgjedit: TEdit;
    mqmzedit: TEdit;
    fqmzedit: TEdit;
    fqxmedit: TEdit;
    fqgjedit: TEdit;
    jtzzedit: TEdit;
    GroupBox2: TGroupBox;
    nvbtn: TRadioButton;
    nabtn: TRadioButton;
    csnedit: TComboBox;
    csyedit: TComboBox;
    csredit: TComboBox;
    cssedit: TComboBox;
    csfedit: TComboBox;
    csd4edit: TEdit;
    jsjgmcedit: TEdit;
    Btn1: TBitBtn;
    Btn2: TBitBtn;
    Btn3: TBitBtn;
    jkzkedit: TComboBox;
    csdfledit: TComboBox;
    Btn4: TBitBtn;
    ADOQuery1: TADOQuery;
    cszbhedit: TEdit;
    qfrqedit: TDateTimePicker;
    mqnledit: TEdit;
    fqnledit: TEdit;
    mqsfzedit: TEdit;
    fqsfzedit: TEdit;
    procedure Btn1Click(Sender: TObject);
    Procedure errordisp(errormsg : String);
    procedure Btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn3Click(Sender: TObject);
    procedure clearDate;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  lurufrm: Tlurufrm;
   csbh_id: Integer;
implementation
uses shuju;
{$R *.dfm}
procedure Tlurufrm.Btn1Click(Sender: TObject);
begin
     close;
end;
procedure Tlurufrm.Btn2Click(Sender: TObject);
var
   Q: TadoQuery;
begin
  try
    Q := TadoQuery.Create(nil);
    Q.Connection :=frmdate.ADODataSet2.Connection;
    Q.Sql.Clear;
    Q.Sql.Add('select csbh_id from bh_count ');
    Q.Open;
    if not (Q.RecordCount > 0) then
      begin
        Q.Sql.clear;
        Q.Sql.Add('insert into bh_count (csbh_id) values(0)');
        Q.ExecSQL;
        csbh_id := 1;
      end
    else
      begin
        csbh_id := Q.FieldbyName('csbh_id').AsInteger;
        inc(csbh_id);
       end;
      cszbhedit.Text := format('%0.6d', [csbh_id]);
      btn2.Enabled :=false;
      btn3.Enabled :=true;
      btn4.Enabled :=false;
      frmdate.ADODataSet1.Append;
      frmdate.ADODataSet2.Edit;
finally
    Q.free;
  end;
end;
Procedure tlurufrm.errordisp(errormsg : String);
Begin
   application.messagebox(pchar(errormsg), '出生医学证明系统管理', mb_iconwarning);
End;
procedure Tlurufrm.FormCreate(Sender: TObject);
begin
      jkzkedit.ItemIndex :=0;
      csdfledit.ItemIndex :=0;
      qfrqedit.Date:=date;
      btn2.Enabled :=true;
      btn3.Enabled :=false;
      btn4.Enabled :=false;
end;
procedure Tlurufrm.Btn3Click(Sender: TObject);
begin
   if  (xmEdit.Text = '') then
    begin
      Errordisp('姓名没有输入');
      xmedit.SetFocus;
      Exit;
    end;
    if (not nabtn.Checked) and (not nvbtn.Checked) then
    begin
      errordisp('请选择性别');
      exit;
    end;
   if (csnedit.Text ='') or (csyedit.Text ='') or (csredit.Text='')
     or (cssedit.Text='') or (csfedit.Text='') then
     begin
      errordisp('请选择出生日期和时间');
      exit;
    end;
   if (csd1edit.Text ='') or (csd2edit.Text ='') or (csd3edit.Text='')   then
     begin
      errordisp('请选择出生地区');
      exit;
    end;
   if (csyzedit.Text ='') then
    begin
       errordisp('请选择出生孕周');
       exit;
    end;
    if (tzedit.Text ='') or (scedit.Text ='')   then
     begin
       errordisp('请选择体重身长');
       exit;
    end;
    if (mqxmedit.Text ='') or (mqnledit.Text ='' ) or (mqgjedit.text='') or (mqmzedit.Text ='') or (mqsfzedit.Text='') then
     begin
      errordisp('请输入出生婴儿母亲参数');
      exit;
    end;
      if length(mqsfzedit.Text)<>18 then
         begin
         errordisp('母亲身份证数位不对(18位)');
         exit;
        end;
     if length(mqnledit.Text)<>2 then
         begin
         errordisp('母亲年龄太离谱');
         exit;
        end;
       if length(fqnledit.Text)<>2 then
         begin
         errordisp('父亲年龄太离谱');
         exit;
        end;
     if (fqxmedit.Text ='') or (fqnledit.Text ='' ) or (fqgjedit.text='') or (fqmzedit.Text ='') or (fqsfzedit.Text='') then
      begin
         errordisp('请输入出生婴儿父亲参数');
         exit;
    end;
     if length(fqsfzedit.Text)<>18 then
         begin
           errordisp('父亲身份证数位不对(18位)');
           exit;
        end;
      if (jsjgmcedit.Text ='')  then
      begin
         errordisp('请输入接生机构名称');
         exit;
      end;
     if (cszbhedit.Text ='') then
       begin
         errordisp('出生证没有编号');
         exit;
       end;
     if (datetostr(qfrqedit.Date) ='') then
      begin
         errordisp('请选择签发日期');
         exit;
       end;
      if (jtzzedit.Text='') then
        begin
         errordisp('请输入家庭住址');
         exit;
       end;
     frmdate.ADODataSet1.FieldByName('csbh_id').AsInteger :=csbh_id;
     frmdate.ADODataSet1.FieldByName('csbh').AsString := cszbhedit.Text;
     frmdate.ADODataSet1.FieldByName('xm').AsString:=xmedit.Text;
     frmdate.ADODataSet1.FieldByName('xb').AsBoolean:=false;
     frmdate.ADODataSet1.FieldByName('csn').AsInteger :=strtoint(csnedit.Text);
     frmdate.ADODataSet1.FieldByName('csy').AsInteger :=strtoint(csyedit.Text);
     frmdate.ADODataSet1.FieldByName('csr').AsInteger :=strtoint(csredit.Text);
     frmdate.ADODataSet1.FieldByName('css').AsInteger :=strtoint(cssedit.Text);
     frmdate.ADODataSet1.FieldByName('csf').AsInteger :=strtoint(csfedit.Text);
     frmdate.ADODataSet1.FieldByName('csd1').AsString :=csd1edit.Text;
     frmdate.ADODataSet1.FieldByName('csd2').AsString:=csd2edit.Text;
     frmdate.ADODataSet1.FieldByName('csd3').AsString :=csd3edit.Text;
     frmdate.ADODataSet1.FieldByName('csd4').AsString:=csd4edit.Text;
     frmdate.ADODataSet1.FieldByName('csyz').AsInteger :=strtoint(csyzedit.Text);
     frmdate.ADODataSet1.FieldByName('jkzk').AsInteger :=jkzkedit.ItemIndex;
     frmdate.ADODataSet1.FieldByName('tz').AsInteger :=strtoint(tzedit.Text );
     frmdate.ADODataSet1.FieldByName('sc').AsInteger :=strtoint(scedit.Text);
     frmdate.ADODataSet1.FieldByName('mqxm').AsString:=mqxmedit.Text;
     frmdate.ADODataSet1.FieldByName('fqxm').AsString:=fqxmedit.Text;
     frmdate.ADODataSet1.FieldByName('mqnl').AsInteger :=strtoint(mqnledit.Text);
     frmdate.ADODataSet1.FieldByName('fqnl').AsInteger :=strtoint(fqnledit.Text);
     frmdate.ADODataSet1.FieldByName('mqsfz').AsString :=mqsfzedit.Text;
     frmdate.ADODataSet1.FieldByName('fqsfz').AsString :=fqsfzedit.Text;
     frmdate.ADODataSet1.FieldByName('mqgj').AsString :=mqgjedit.Text;
     frmdate.ADODataSet1.FieldByName('fqgj').AsString :=fqgjedit.Text;
     frmdate.ADODataSet1.FieldByName('fqmz').AsString :=fqmzedit.Text;
     frmdate.ADODataSet1.FieldByName('mqmz').AsString :=mqmzedit.Text;
      frmdate.ADODataSet1.FieldByName('csdfl').AsInteger :=csdfledit.ItemIndex;
      frmdate.ADODataSet1.FieldByName('jsjgmc').AsString:=jsjgmcedit.Text;
      frmdate.ADODataSet1.FieldByName('jtzz').AsString:=jtzzedit.Text;
      frmdate.ADODataSet1.FieldByName('qfrq').AsDateTime:=qfrqedit.Date;
      frmdate.ADODataSet2.FieldByName('csbh_id').AsInteger :=csbh_id;
      frmdate.ADODataSet1.Post;
      frmdate.ADODataSet2.Post;
      errordisp('信息保存完成');
      clearDate;
      btn2.Enabled :=true;
      btn3.Enabled :=false;
      btn4.Enabled :=true;
end;
procedure Tlurufrm.clearDate;
begin
   xmedit.Text :='';
   nabtn.Checked :=false;
   nvbtn.Checked :=false;
   csyedit.Text :='';
   csredit.Text :='';
   cssedit.Text :='';
   csfedit.Text :='';
   csd1edit.Text :='';
   csd2edit.Text :='';
   csd3edit.Text :='';
   csd4edit.Text :='';
   csyzedit.Text :='';
   tzedit.Text :='';
   scedit.Text :='';
   mqxmedit.Text :='';
   mqnledit.Text :='';
   mqgjedit.Text :='';
   mqmzedit.Text :='';
   mqsfzedit.Text :='';

   fqxmedit.Text :='';
   fqnledit.Text :='';
   fqgjedit.Text :='';
   fqmzedit.Text :='';
   fqsfzedit.Text :='';

   jsjgmcedit.Text :='';
   jtzzedit.Text :='';
   mqgjedit.Text :='中国';
   fqgjedit.Text :='中国';
end;
end.
