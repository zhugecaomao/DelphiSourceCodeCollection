{***************************************
  Copyright (C) 阳光工作室 版权所有。
  文 件 名：BaseForm.pas
  版	  本：ver 1.00.00
  创建标识：2006-12-28   林毅祥   创建
  功能说明：基础类窗体
  注意事项：
  更新记录：
****************************************}
unit BaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,DBCtrls,
  Dialogs, ExtCtrls, DBGrids, Menus, SUIThemes, SUIForm, StdCtrls, DBCtrlsEh, DBGridEh, SUIGroupBox, DBLookupEh;

type
  TBaseFrm = class(TForm)
    suiForm1: TsuiForm;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Title :string;
    { Public declarations }
  end;
  Function Get_MaxTabID(tabid:string; len:integer):string;
  Function Set_MaxTabID(tabid:string):integer;

  procedure Set_DBGrid(grid:TDBGrid; id :string);
  procedure SetFormStyle(var Sender :TSUIForm; sstyle:string);
   //获得报价编号.
  Function Get_QuotedPriceID(tabid:string):string;
  Function Get_DayMaxID(TabID:string; pre:string=''):string;
  Function Get_MaxID(tabid:string; Fldstr:string ='ID'):integer;
  procedure Set_ImeName(Pane:Tobject; ime:string='');

var
  BaseFrm: TBaseFrm;

implementation

uses DataModule, BasePage;

{$R *.dfm}

procedure TBaseFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : SELF.Close;
    //VK_RETURN  : SelectNext(TWincontrol(Sender),  False,  True);
    VK_RETURN  :
    begin
      if (activecontrol is TDBMemo) then
      else
       SelectNext(ActiveControl,True,True);  
    end;
  end;

end;
procedure SetFormStyle(var Sender :TSUIForm; sstyle:string);
begin
  if sstyle ='1' then
  begin
    Sender.UIStyle :=MacOS;
  end
  else if sstyle ='2' then
  begin
    Sender.UIStyle :=WinXP;
  end
  else if sstyle ='3' then
  begin
    Sender.UIStyle :=DeepBlue;
  end
  else if sstyle ='4' then
  begin
    Sender.UIStyle :=Protein;
  end
  else if sstyle ='5' then
  begin
    Sender.UIStyle :=BlueGlass;
  end;
end;

Function Get_MaxTabID(tabid:string; len:integer):string;
var sqlstr, str:string;
    maxid, i:integer;
begin
   try
     sqlstr :='select MaxRecID from TabInfo where TabID=''' + TabID + '''';
     str :=inttostr(GetMaxValue(sqlstr) +1);
     result :=trim(str);
     for i:=1 to len - Length(str) do
     begin
        result :='0' + result;
     end;
   except
   end;
end;

Function Set_MaxTabID(tabid:string):integer;
var sqlstr:string;
begin
   try
     sqlstr :='update TabInfo set MaxRecID=MaxRecID +1 where TabID=''' + TabID + '''';
     result :=dosql(sqlstr);
   except
   end;
end;

procedure Set_DBGrid(grid:TDBGrid; id :string);
var i:integer;
    sqlstr:string;
    column:TColumn;
begin
  sqlstr:='select * from TabInfoField where TabID=''' + id + ''' and ListFlag=''1'' order by Orderby';
  with DataModule_frm.PubQuery do
  begin
    Get_Query(DataModule_frm.PubQuery, sqlstr);
    for i:=0 to RecordCount -1 do
    begin
       column :=grid.Columns.Add;
       column.FieldName :=Fieldbyname('FieldID').AsString;
       column.Title.Caption :=Fieldbyname('FieldName').AsString;
       column.Title.Alignment :=taCenter;
       if Fieldbyname('FieldLength').AsInteger >200 then
       begin
          column.Width :=120;
       end
       else if Fieldbyname('FieldLength').AsInteger >100 then
       begin
          column.Width :=100;
       end
       else if Fieldbyname('FieldLength').AsInteger >=50 then
       begin
          column.Width :=80;
       end
       else
          column.Width :=60;
       next;
    end;

  end;
end;
//获得报价编号.
Function Get_QuotedPriceID(TabID:string):string;
var sqlstr, str, maxstr, datestr:string;
    maxid, i:integer;
begin
   try
     with DataModule_frm do
     begin
       datestr:=formatdatetime('yyyyMMdd', date);
       sqlstr :='select date()';
       Get_Query(PubQuery, sqlstr);
       datestr :=formatdatetime('yyyyMMdd', PubQuery.Fields[0].AsDateTime);
       
       //sqlstr :='select * from QuotedPrice where CreateDate=''' + formatdatetime('yyyy-MM-dd', date) + '''';
       sqlstr :='select * from QuotedPrice where datediff(''d'', CreateDate, date())=0';
       Get_Query(PubQuery, sqlstr);
       if PubQuery.RecordCount =0 then
       begin
          maxstr :='01';
          sqlstr :='update TabInfo set MaxRecID=1 where TabID=''' + TabID + '''';
          dosql(sqlstr);
       end
       else
       begin
          maxstr :=Get_MaxTabID(TabID, 2);
          Set_MaxTabID(TabID);
       end;
       result :='Q'+datestr + maxstr;
     end;
   except
     result :='Q'+datestr+'01'; 
   end;
end;

//获得编号.
Function Get_DayMaxID(TabID:string; pre:string=''):string;
var sqlstr, str, maxstr, datestr:string;
    maxid, i:integer;
begin
   try
     with DataModule_frm do
     begin
       datestr:=formatdatetime('yyyyMMdd', date);
       sqlstr :='select date()';
       Get_Query(PubQuery, sqlstr);
       datestr :=formatdatetime('yyyyMMdd', PubQuery.Fields[0].AsDateTime);

       //sqlstr :='select * from QuotedPrice where CreateDate=''' + formatdatetime('yyyy-MM-dd', date) + '''';
       sqlstr :='select * from QuotedPrice where datediff(''d'', CreateDate, date())=0';
       Get_Query(PubQuery, sqlstr);
       if PubQuery.RecordCount =0 then
       begin
          maxstr :='01';
          sqlstr :='update TabInfo set MaxRecID=1 where TabID=''' + TabID + '''';
          dosql(sqlstr);
       end
       else
       begin
          maxstr :=Get_MaxTabID(TabID, 2);
          Set_MaxTabID(TabID);
       end;
       result :=pre+datestr + maxstr;
     end;
   except
     result :=pre+datestr+'01';
   end;
end;

Function Get_MaxID(tabid:string; Fldstr:string ='ID'):integer;
var sqlstr:string;
begin
  try
    with DataModule_frm do
    begin
      sqlstr:='select Max('+Fldstr+') from ' + tabid;
      Get_Query(PubQuery, sqlstr);
      if PubQuery.RecordCount >0 then
      begin
        result :=PubQuery.fields[0].AsInteger + 1;
      end
      else
        result :=1;
    end;
  except
     result :=1;
  end;
end;

// 设置输入框输入法
procedure Set_ImeName(Pane:Tobject; ime:string='');
var i, j:integer;
begin
   try
     if Pane <> nil then
     begin
       for i:=0 to TWinControl(Pane).ControlCount -1 do
       begin
          //writelog(TWinControl(Pane).Controls[i].ClassName);
          if (TWinControl(Pane).Controls[i] is TDBEditEh) then
          begin
             TDBEditEh(TWinControl(Pane).Controls[i]).ImeName :=ime;
          end
          else if (TWinControl(Pane).Controls[i] is TDBComboBoxEh) then
          begin
             TDBComboBoxEh(TWinControl(Pane).Controls[i]).ImeName :=ime;
          end
          else if (TWinControl(Pane).Controls[i] is TDBGridEh) then
          begin
             TDBGridEh(TWinControl(Pane).Controls[i]).ImeName :=ime;
          end
          else if (TWinControl(Pane).Controls[i] is TDBLookupComboboxEh) then
          begin
             TDBLookupComboboxEh(TWinControl(Pane).Controls[i]).ImeName :=ime;
          end
          else if (TWinControl(Pane).Controls[i] is TsuiGroupBox) then
          begin
            for j:=0 to TWinControl(TWinControl(Pane).Controls[i]).ControlCount -1 do
            begin
              if (TWinControl(TWinControl(Pane).Controls[i]).Controls[j] is TDBEditEh) then
              begin
                TDBEditEh(TWinControl(TWinControl(Pane).Controls[i]).Controls[j]).ImeName :=ime;
              end
              else if (TWinControl(TWinControl(Pane).Controls[i]).Controls[j] is TDBComboBoxEh) then
              begin
                TDBComboBoxEh(TWinControl(TWinControl(Pane).Controls[i]).Controls[j]).ImeName :=ime;
              end
              else if (TWinControl(TWinControl(Pane).Controls[i]).Controls[j] is TDBGridEh) then
              begin
                TDBGridEh(TWinControl(TWinControl(Pane).Controls[i]).Controls[j]).ImeName :=ime;
              end
            end;
          end;
       end;
     end;
   except
   end;
end;

end.
