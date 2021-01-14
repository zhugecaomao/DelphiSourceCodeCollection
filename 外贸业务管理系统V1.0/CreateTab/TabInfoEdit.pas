unit TabInfoEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Mask, ExtCtrls, ComCtrls,
  SUIButton, SUIImagePanel, SUIForm;

type
  TTabInfoEdit_frm = class(TForm)
    ADOQuery1: TADOQuery;
    suiForm1: TsuiForm;
    ParentPanel: TsuiPanel;
    BottomPanel: TsuiImagePanel;
    bbclear: TsuiButton;
    bbclose: TsuiButton;
    bbsave: TsuiButton;
    Query: TADOQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbsaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbcloseClick(Sender: TObject);
    procedure bbclearClick(Sender: TObject);
  private
     TabName:string;
     procedure ClearPanel(Sender: TObject);
     procedure Control_Clear(Sender:TObject);
     procedure Control_ReadOnly(Sender:TObject);
     procedure Create_frame();
     procedure Set_TableHead();
     procedure UpdateTableInfo(Sender: TObject);
     procedure Set_FrameValue();
  public
     RecID, Action, TabID:string;
     KeyID: array of array[0..2] of string;
     KeyValue: array of array[0..2] of string;
  end;

var
  TabInfoEdit_frm: TTabInfoEdit_frm;

implementation

uses DataModule, BasePage, CreateTabInfo;

{$R *.dfm}

procedure TTabInfoEdit_frm.ClearPanel(Sender: TObject);
begin
  while ParentPanel.ControlCount >0 do
  begin
     ParentPanel.Controls[ParentPanel.ControlCount-1].Free;
  end;
end;
//清空控件内容
procedure TTabInfoEdit_frm.Control_Clear(Sender:TObject);
var i:integer;
begin
   for i:=0 to TWinControl(Sender).ControlCount -1 do
   begin
     if (TWinControl(Sender).Controls[i] is TEdit) then
     begin
       (TWinControl(Sender).Controls[i] as TEdit).Clear;
     end
     else if TWinControl(Sender).Controls[i]  is TMaskEdit then
     begin
       (TWinControl(Sender).Controls[i] as TMaskEdit).Clear ;
     end
     else if TWinControl(Sender).Controls[i]  is TComboBox then
     begin
       (TWinControl(Sender).Controls[i] as TComboBox).Text :='' ;
     end
     else if TWinControl(Sender).Controls[i]  is TMemo then
     begin
       (TWinControl(Sender).Controls[i] as TMemo).Clear ;
     end
   end;
end;
//清空控件内容
procedure TTabInfoEdit_frm.Control_ReadOnly(Sender:TObject);
var i:integer;
begin
   for i:=0 to TWinControl(Sender).ControlCount -1 do
   begin
     if (TWinControl(Sender).Controls[i] is TEdit) then
     begin
       (TWinControl(Sender).Controls[i] as TEdit).ReadOnly :=true;
     end
     else if TWinControl(Sender).Controls[i]  is TMaskEdit then
     begin
       (TWinControl(Sender).Controls[i] as TMaskEdit).ReadOnly :=true ;
     end
     else if TWinControl(Sender).Controls[i]  is TComboBox then
     begin
       (TWinControl(Sender).Controls[i] as TComboBox).Enabled :=false; ;
     end
     else if TWinControl(Sender).Controls[i]  is TMemo then
     begin
       (TWinControl(Sender).Controls[i] as TMemo).ReadOnly :=true ;
     end
   end;
end;

procedure TTabInfoEdit_frm.Set_TableHead();
var sqlstr:string;
begin
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfo where TabID=''' + TabID + '''';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();
     if RecordCount >0 then
     begin
        TabName :=Fieldbyname('TabName').AsString;
        ParentPanel.Width :=Fieldbyname('PWidth').AsInteger;
        ParentPanel.Height :=Fieldbyname('PHeight').AsInteger;
        self.Caption :=TabName;
        suiForm1.Caption :=self.Caption;
        self.ClientWidth :=ParentPanel.Width + 5;
        self.ClientHeight :=ParentPanel.Height +BottomPanel.Height+ 25;

     end;
   end;
end;
procedure TTabInfoEdit_frm.Create_frame();
var sqlstr :string;
    Component:TObject;
    i, topnum,leftnum,widthnum,heightnum, Ltopnum, Lleftnum, lwidthnum,lheightnum:integer;
    FieldID, Fieldname, FieldType, DicTab, DicID, DicName:string;
    FieldLength:integer;
begin
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfoField where TabID=''' + TabID + '''';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();
     for i :=0 to RecordCount -1 do
     begin
         topnum :=Fieldbyname('ptop').AsInteger;
         leftnum :=Fieldbyname('Pleft').AsInteger;
         widthnum :=Fieldbyname('Pwidth').AsInteger;
         heightnum :=Fieldbyname('Pheight').AsInteger;

         ltopnum :=Fieldbyname('ltop').AsInteger;
         lleftnum :=Fieldbyname('lleft').AsInteger;
         lwidthnum :=Fieldbyname('lwidth').AsInteger;
         lheightnum :=Fieldbyname('lheight').AsInteger;

         if  widthnum =0 then widthnum :=100;
         if  heightnum =0 then heightnum :=20;
         FieldID := Fieldbyname('FieldID').AsString;
         Fieldname := Fieldbyname('Fieldname').AsString;
         FieldType := lowercase(Fieldbyname('FieldType').AsString);
         FieldLength := Fieldbyname('FieldLength').AsInteger;
         DicTab := Fieldbyname('DicTab').AsString;
         DicID := Fieldbyname('DicFieldID').AsString;
         DicName := Fieldbyname('DicFieldName').AsString;

         if (DicTab <>'') and (DicID <>'') then
         begin
           // if pos(FieldType,'int,integer,real,numeric,float,decimal,currency,money') >0 then
            begin
               Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
               Component :=Create_ComboBox(topnum, leftnum, widthnum, heightnum, FieldID, Fieldname, ParentPanel);
               //FillItems1(TComboBox(Component), DicTab, DicID+', '+DicName, '', ' order by '+DicID);
            end;
         end
         else
         begin
           if pos(FieldType, 'int,integer,decimal,money,real,numeric') >0 then
           begin
              Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
              Component :=Create_Text(topnum, leftnum, widthnum, heightnum, FieldID, FieldID, ParentPanel);

           end
           else if pos(FieldType, 'char,varchar, string') >0 then
           begin
              Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
              Component :=Create_Text(topnum, leftnum, widthnum, heightnum, FieldID, FieldID, ParentPanel);
              TEdit(Component).MaxLength :=FieldLength

           end
           else if pos(FieldType, 'text,memo') >0 then     //备注
           begin
              Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
              Component :=Create_Memo(topnum, leftnum, widthnum, heightnum, FieldID, FieldID, ParentPanel);

           end
           else if pos(FieldType, 'date,datetime,smalldatetime') >0 then
           begin
              Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);

           end;
         end;
         Next;
     end;
   end;

end;
procedure TTabInfoEdit_frm.Set_FrameValue();
var sqlstr, wheresql:string;
    i:integer;
    FieldID, FieldType, DicTab, DicFieldID, DicFieldName, FieldValue:string;
begin
   wheresql:=' where 1=1 ';
   for i :=Low(KeyValue) to High(KeyValue) do       //Length(KeyValue) -1 do
   begin
      if KeyValue[i][2] ='1' then
         wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=''' + KeyValue[i][1] + ''''
      else
         wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=' + KeyValue[i][1] ;

   end;
   sqlstr:='select * from '+ TabID + wheresql;
   Get_Query(Query, sqlstr);
   if Query.RecordCount =0 then exit;
    
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfoField where TabID=''' + TabID + ''' and DisFlag=''1'' order by orderby';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();

     for i :=0 to RecordCount -1 do
     begin
         FieldID := Fieldbyname('FieldID').AsString;
         FieldValue := Query.fieldbyname(FieldID).AsString;

         FieldType := lowercase(Fieldbyname('FieldType').AsString);
         DicTab := Fieldbyname('DicTab').AsString;
         DicFieldID := Fieldbyname('DicFieldID').AsString;
         DicFieldName := Fieldbyname('DicFieldName').AsString;
         
         next;
         if (DicTab <>'') and (DicFieldID <>'') then   //有下拉框
         begin
            FillItems1(TComboBox(ParentPanel.FindChildControl('Txt_'+FieldID)), DicTab, DicFieldID+', '+DicFieldName, '', ' order by '+DicFieldID);
            TComboBox(ParentPanel.FindChildControl('Txt_'+FieldID)).Text :=FieldValue;
         end
         else
         begin
           try
             if pos(FieldType,'date, smalldate, datetime') >0 then
             begin
               if (FieldType ='date') or (FieldType ='smalldate') then
               begin
                  TDateTimePicker(ParentPanel.FindChildControl('Txt_'+FieldID)).Date:=strtodate(FieldValue);
               end
               else if FieldType ='datetime' then
               begin
                  TDateTimePicker(ParentPanel.FindChildControl('Txt_'+FieldID)).DateTime:=strtodate(FieldValue);
               end;
             end
             else  //pos(FieldType,'int,integer,real,numeric,float,decimal,currency,money') >0 then
             begin
              TEdit(ParentPanel.FindChildControl('Txt_'+FieldID)).Text:=FieldValue;
             end
           except
             continue;
           end;
         end;
     end;
   end;

end;

procedure TTabInfoEdit_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_F9  : if bbsave.Enabled then  bbsave.Click;
    VK_F4 : if bbclear.Enabled then  bbclear.Click;
    VK_ESCAPE : if bbclose.Enabled then  bbclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);

  end;

end;

procedure TTabInfoEdit_frm.bbsaveClick(Sender: TObject);
begin
   UpdateTableInfo(nil);
end;
//保存表
procedure TTabInfoEdit_frm.UpdateTableInfo(Sender: TObject);
var sqlstr, sqlfield, sqlfieldvalue, updatesqlstr, wheresql:string;
    i, keynum:integer;   //topnum,leftnum,widthnum,heightnum, Ltopnum, Lleftnum, lwidthnum,lheightnum, 
    FieldID, Fieldname, FieldType, DicTab, DicFieldID, DicFieldName, FieldValue, keyFieldtype:string;
    newFlag :boolean;
begin
   keynum :=0;
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfoField where TabID=''' + TabID + ''' and DisFlag=''1'' order by orderby';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();
     for i :=0 to RecordCount -1 do
     begin
         {topnum :=Fieldbyname('ptop').AsInteger;
         leftnum :=Fieldbyname('Pleft').AsInteger;
         widthnum :=Fieldbyname('Pwidth').AsInteger;
         heightnum :=Fieldbyname('Pheight').AsInteger;

         ltopnum :=Fieldbyname('ltop').AsInteger;
         lleftnum :=Fieldbyname('lleft').AsInteger;
         lwidthnum :=Fieldbyname('lwidth').AsInteger;
         lheightnum :=Fieldbyname('lheight').AsInteger;   }

         FieldID := Fieldbyname('FieldID').AsString;
         Fieldname := Fieldbyname('Fieldname').AsString;
         FieldType := lowercase(Fieldbyname('FieldType').AsString);
         DicTab := Fieldbyname('DicTab').AsString;
         DicFieldID := Fieldbyname('DicFieldID').AsString;

         if (DicTab <>'') and (DicFieldID <>'') then
         begin
            //if pos(FieldType,'varchar,char,string,text,memo') >0 then
            
            FieldValue :=Get_DM(TComboBox(ParentPanel.FindChildControl('Txt_'+FieldID)).Text);
            if pos(FieldType,'int,integer,real,numeric,float,decimal,currency,money') >0 then
            begin
              sqlfield:=sqlfield + FieldID;
              sqlfieldvalue:=sqlfieldvalue + FieldValue;
              updatesqlstr :=updatesqlstr + FieldID+ '='+ FieldValue;
              keyFieldtype:='0'; //没有引号
            end
            else
            begin
              sqlfield:=sqlfield + FieldID;
              sqlfieldvalue:=sqlfieldvalue + ''''+ FieldValue + '''';
              updatesqlstr :=updatesqlstr + FieldID+ '='''+ FieldValue + '''';
              keyFieldtype:='1'; //没有引号
            end;
            if (Fieldbyname('PrimaryKey').AsString ='1') then
            begin
               inc(keynum);
               SetLength(KeyID, keynum);
               KeyID[keynum -1, 0] :=FieldID;
               KeyID[keynum -1, 1] :=FieldValue;
               KeyID[keynum -1, 2] :=keyFieldtype;
            end;
         end
         else
         begin
            if pos(FieldType,'int,integer,real,numeric,float,decimal,currency,money') >0 then
            begin
              FieldValue :=TEdit(ParentPanel.FindChildControl('Txt_'+FieldID)).Text;
              sqlfield:=sqlfield + FieldID;
              sqlfieldvalue:=sqlfieldvalue + FieldValue;
              updatesqlstr :=updatesqlstr + FieldID+ '='+ FieldValue;
              keyFieldtype:='0'; //没有引号
            end
            else if pos(FieldType,'date, smalldate, datetime') >0 then
            begin
              sqlfield:=sqlfield + FieldID;
              if (FieldType ='date') or (FieldType ='smalldate') then
              begin
                 FieldValue :=Datetimetostr(TDateTimePicker(ParentPanel.FindChildControl('Txt_'+FieldID)).Date);
                 sqlfieldvalue:=sqlfieldvalue + ''''+ FieldValue + '''';
                 updatesqlstr :=updatesqlstr + FieldID+ '='''+ FieldValue + '''';
              end
              else if FieldType ='datetime' then
              begin
                 FieldValue :=Datetimetostr(TDateTimePicker(ParentPanel.FindChildControl('Txt_'+FieldID)).DateTime);
                 sqlfieldvalue:=sqlfieldvalue + ''''+ FieldValue + '''';
                 updatesqlstr :=updatesqlstr + FieldID+ '='''+ FieldValue + '''';
              end;
              keyFieldtype:='1'; //没有引号
            end
            else if pos(FieldType,'text,memo') >0 then
            begin
               FieldValue :=TEdit(ParentPanel.FindChildControl('Txt_'+FieldID)).Text;
               sqlfield:=sqlfield + FieldID;
               sqlfieldvalue:=sqlfieldvalue + ''''+ FieldValue + '''';
               updatesqlstr :=updatesqlstr + FieldID+ '='''+ FieldValue + '''';
               keyFieldtype:='1'; //没有引号
            end
            else
            begin
               FieldValue :=TEdit(ParentPanel.FindChildControl('Txt_'+FieldID)).Text;
               sqlfield:=sqlfield + FieldID;
               sqlfieldvalue:=sqlfieldvalue + ''''+ FieldValue + '''';
               updatesqlstr :=updatesqlstr + FieldID+ '='''+ FieldValue + '''';
               keyFieldtype:='1'; //没有引号
            end;

            if (Fieldbyname('PrimaryKey').AsString ='1') then
            begin
               inc(keynum);
               SetLength(KeyID, keynum);
               KeyID[keynum -1, 0] :=FieldID;
               KeyID[keynum -1, 1] :=FieldValue;
               KeyID[keynum -1, 2] :=keyFieldtype;    //数据类型(是否有'号)
            end;
         end;
         if i < RecordCount -1 then
         begin
              sqlfield:=sqlfield + ',';
              sqlfieldvalue:=sqlfieldvalue + ',';
              updatesqlstr:=updatesqlstr + ',';
         end;
         next;
     end;
     if Action ='add' then 
     begin
        wheresql:=' where 1=1 ';
        for i :=Low(KeyID) to High(KeyID) do       //Length(KeyValue) -1 do
        begin
           if KeyID[i][2] ='1' then
              wheresql :=wheresql + ' and ' + KeyID[i][0] + '=''' + KeyID[i][1] + ''''
           else
              wheresql :=wheresql + ' and ' + KeyID[i][0] + '=' + KeyID[i][1] ;

        end;
        sqlstr :='select * from '+TabID +  wheresql;
        if (DoSql_Select(sqlstr) >0) then 
        begin
          showmessage('此记录已存在');
          exit;
        end;
        sqlstr :='Insert into '+ TabID + '(' + sqlfield + ') values(' + sqlfieldvalue + ')';
        if (DoSql(sqlstr) >0) then
        begin
          if application.MessageBox(pchar('操作成功, 是否继续'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
          begin

          end
          else
             self.close();
         end;
     end
     else
     begin
        for i:=Low(KeyID) to High(KeyID) -1 do
        begin
           if (KeyValue[i][0]=KeyID[i][0]) and (KeyValue[i][1]<> KeyID[i][1]) then
           begin
              newFlag :=true;
              break;
           end;
        end;
        if newFlag then
        begin
           wheresql:=' where 1=1 ';

           for i :=Low(KeyValue) to High(KeyValue) -1 do       //Length(KeyValue) -1 do
           begin
              if KeyValue[i][2] ='1' then
                wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=''' + KeyValue[i][1] + ''''
              else
                wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=' + KeyValue[i][1] ;
           end;
           sqlstr :='select * from ' +TabID +  wheresql;
           if (DoSql_Select(sqlstr) >0) then 
           begin
             showmessage('此记录已存在');
             exit;
           end;
        end;
        
        wheresql:='  where 1=1 ';
        for i :=Low(KeyValue) to High(KeyValue) do       //Length(KeyValue) -1 do
        begin
            if KeyValue[i][2] ='1' then
                wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=''' + KeyValue[i][1] + ''''
            else
                wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=' + KeyValue[i][1] ;
        end;
        sqlstr :='Update '+ TabID + ' set ' +updatesqlstr + wheresql;
        showmessage(sqlstr);
        if (DoSql(sqlstr) >0) then
        begin
          self.close();
        end
        else
          showmessage('操作不成功');
     end;

   end;
end;

procedure TTabInfoEdit_frm.FormShow(Sender: TObject);
var sqlstr:string;
begin
  Set_TableHead();
  ClearPanel(nil);
  Create_frame();
  if action='add' then 
    Control_Clear(ParentPanel)
  else
    Set_FrameValue();
  if action ='browse' then
  begin
    Control_ReadOnly(ParentPanel);
    bbsave.Enabled :=false;
    bbclear.Enabled :=false;
  end;
end;

procedure TTabInfoEdit_frm.FormCreate(Sender: TObject);
begin
  self.Caption :='';
    SetLength(TabInfoEdit_frm.KeyID, 1);

end;

procedure TTabInfoEdit_frm.bbcloseClick(Sender: TObject);
begin
  close();
end;

procedure TTabInfoEdit_frm.bbclearClick(Sender: TObject);
begin
  Control_Clear(ParentPanel);
end;

end.
