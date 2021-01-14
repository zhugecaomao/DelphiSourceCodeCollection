unit TableEdit;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Mask, ExtCtrls, ComCtrls,
  SUIButton, SUIImagePanel, SUIForm, DBCtrlsEh, DBCtrls, DBGridEh,
  DBLookupEh, BaseForm;
type
  TTableEdit_frm = class(TBaseFrm)
    BottomPanel: TsuiImagePanel;
    bbclose: TsuiButton;
    bbsave: TsuiButton;
    ParentPanel: TsuiPanel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbcloseClick(Sender: TObject);
    procedure bbsaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     TabName:string;
     Insertmaxflag :boolean;
     procedure Control_ReadOnly(Sender:TObject);
     procedure Create_frame();
     procedure Set_TableHead();
     function Set_FrameValue(str:string):boolean;
     procedure InsertTable();
  public
     DataSource13: TDataSource;
     Query: TADOQuery;
     RecID, Action, TabID:string;
     KeyID: array of array[0..2] of string;
     KeyValue: array of array[0..2] of string;
     
     MaxIDFlag :integer;
  end;

var
  TableEdit_frm: TTableEdit_frm;

implementation

uses DataModule, CreateTabInfo, BasePage;

{$R *.dfm}


//清空控件内容
procedure TTableEdit_frm.Control_ReadOnly(Sender:TObject);
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

procedure TTableEdit_frm.Set_TableHead();
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
procedure TTableEdit_frm.Create_frame();
var sqlstr :string;
    Component:TObject;
    i, topnum,leftnum,widthnum,heightnum, Ltopnum, Lleftnum, lwidthnum,lheightnum:integer;
    FieldID, Fieldname, FieldType, DicTab, DicID, DicName:string;
    FieldLength:integer;
    adoquery:tADOTable;
    dsource:    TDataSource;
begin
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfoField where TabID=''' + TabID + '''  and DisFlag=''1''  order by orderby';
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
               Component :=Create_DBLookupComboBox(topnum, leftnum, widthnum, heightnum, FieldID, FieldID, DataSource1, ParentPanel);
               adoquery :=Create_ADOTable('query'+ DicTab, DicTab, DataModule_frm.ADOConnection1, self);
               dsource :=Create_DataSource('query'+ DicTab, adoquery, self);
               TDBLookupComboBox(Component).ListSource :=dsource;
               TDBLookupComboBox(Component).KeyField :=DicID ;
               TDBLookupComboBox(Component).ListField :=DicID + ';' + DicName;
               //FillItems1(TComboBox(Component), DicTab, DicID+', '+DicName, '', ' order by '+DicID);
            end;
         end
         else
         begin
           if pos(FieldType, 'int,integer,decimal,money,real,numeric') >0 then
           begin
              Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
              Component :=Create_DBText(topnum, leftnum, widthnum, heightnum, FieldID, FieldID, DataSource1, ParentPanel);

           end
           else if pos(FieldType, 'char,varchar, string') >0 then
           begin
              Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
              Component :=Create_DBText(topnum, leftnum, widthnum, heightnum, FieldID, FieldID, DataSource1, ParentPanel);
              TEdit(Component).MaxLength :=FieldLength

           end
           else if pos(FieldType, 'text,memo') >0 then     //备注
           begin
              Component :=Create_Label(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
              Component :=Create_DBMemo(topnum, leftnum, widthnum, heightnum, FieldID, FieldID, DataSource1, ParentPanel);

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
function TTableEdit_frm.Set_FrameValue(str:string):boolean;
var sqlstr, wheresql:string;
    i:integer;
    FieldID, FieldType, DicTab, DicFieldID, DicFieldName, FieldValue:string;
begin
   result :=true;
   if str <>'add' then
   begin
     wheresql:=' where 1=1 ';
     for i :=Low(KeyValue) to High(KeyValue) do       //Length(KeyValue) -1 do
     begin
        if KeyValue[i][2] ='1' then
          wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=''' + KeyValue[i][1] + ''''
        else
          wheresql :=wheresql + ' and ' + KeyValue[i][0] + '=' + KeyValue[i][1] ;
     end;
   end;
   try
      sqlstr:='select * from '+ TabID + wheresql;
      Get_Query(Query, sqlstr);
      if Query.RecordCount =0 then result:=false;
   except
     result :=false;
   end;
end;

procedure TTableEdit_frm.InsertTable();
var sqlstr, maxid:string;
begin
   Query.Append;
   if Query.Active then
   begin
      maxid :=Get_MaxTabID(TabID,  MaxIDFlag);
      Query.FieldByName(KeyValue[0, 0]).AsString :=maxid;
      Insertmaxflag :=true;
   end;

end;

procedure TTableEdit_frm.FormShow(Sender: TObject);
var sqlstr:string;
    formleng, spacenum :integer;
begin
  inherited;

   Set_TableHead();
  // if  Set_FrameValue(action)=false then
   //   self.Close();

   Create_frame();
   if action='add' then
   begin
     InsertTable() ;
   end
   else if action='edit' then
   begin
     
   end
   else if action ='browse' then
   begin
     Control_ReadOnly(ParentPanel);
     bbsave.Enabled :=false;
   end;
  //定位按扭的位置.
  formleng :=self.ClientWidth;
  bbsave.Left :=(formleng div 2 - bbsave.Width) div 2;
  bbclose.Left :=formleng div 2 + bbsave.left;
  if (bbclose.Left - bbsave.Left -bbsave.Width) >64 then
  begin
     spacenum :=(bbclose.Left- bbsave.Left -bbsave.Width -64) div 2;
     bbsave.Left :=bbsave.Left +  spacenum;
     bbclose.Left :=bbclose.Left -  spacenum;
  end;

end;

procedure TTableEdit_frm.FormCreate(Sender: TObject);
begin
  inherited;
  MaxIDFlag :=3;
  self.Caption :='';
  SetLength(KeyID, 1);
  Query :=TADOQuery.Create(nil);
  DataSource1.DataSet :=Query;

  //DataSource1 :=TDataSource.Create(nil);
end;

procedure TTableEdit_frm.bbcloseClick(Sender: TObject);
begin
  inherited;
  if Query.State in[dsEdit, dsInsert] then
  begin
     Query.Close;
     Query.Open;
  end; 
  close();

end;

procedure TTableEdit_frm.bbsaveClick(Sender: TObject);
begin
  inherited;
   //UpdateTableInfo(nil);
   try
     if Query.State in[dsEdit, dsInsert] then 
       Query.Post;
     if Insertmaxflag =true then
     begin
        Set_MaxTabID(TabID);
     end;
     if action='add' then
     begin
          if application.MessageBox(pchar('操作成功, 是否继续'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
          begin
             InsertTable();
          end
          else
              bbclose.Click;
     end
     else
       bbclose.Click;
   except
       on E: Exception do showmessage(E.Message);
   end;

end;

procedure TTableEdit_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if bbclose.Enabled then  bbclose.Click;
    //VK_RETURN  : SelectNext(ActiveControl,True,True);

  end;

end;

end.
