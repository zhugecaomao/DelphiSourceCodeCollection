unit TabInfoStyle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, MyPanel, MyLabel, ComCtrls;

type
  TTabInfoStyle_frm = class(TForm)
    ADOQuery1: TADOQuery;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btninistyle: TBitBtn;
    btnsavestyle: TBitBtn;
    btnexpstyle: TBitBtn;
    btnclosestyle: TBitBtn;
    ScrollBox1: TScrollBox;
    ParentPanel: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btninistyleClick(Sender: TObject);
    procedure btnsavestyleClick(Sender: TObject);
    procedure ParentPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnexpstyleClick(Sender: TObject);
    procedure btnclosestyleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
     UpdateFlag, CtrlDownFlag:boolean;
       mouseDownOldX, mouseDownOldY :integer;
        procedure ClearPanel(Sender: TObject);
        procedure CreatePanel(Sender: TObject);
        procedure Set_ControlEvent(Component:TObject);
        procedure TControlOnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
        procedure TLabelOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure TLabelOnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
        procedure TLabelOnMouseUp(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        procedure TControlOnClick(Sender: TObject);
        procedure IniPanel(Sender: TObject);
        procedure ReadPanel(Sender: TObject);
  public
     TabID, TabName:string;

  end;

var
  TabInfoStyle_frm: TTabInfoStyle_frm;

implementation

uses DataModule, CreateTabInfo, BasePage;

{$R *.dfm}

procedure TTabInfoStyle_frm.ClearPanel(Sender: TObject);
begin
  while ParentPanel.ControlCount >0 do
  begin
     ParentPanel.Controls[ParentPanel.ControlCount-1].Free;
  end;
end;

//导出模板
procedure TTabInfoStyle_frm.CreatePanel(Sender: TObject);
var sqlstr :string;
    control:TWinControl;
    Component:TObject;
    i, topnum,leftnum,widthnum,heightnum, Ltopnum, Lleftnum, lwidthnum,lheightnum, addtopnum, addleftnum:integer;
    FieldID, Fieldname, FieldType:string;
begin
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfo where TabID=''' + TabID + ''' ';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();
     if RecordCount >0 then
     begin
        TabName :=Fieldbyname('TabName').AsString;
        ParentPanel.Width :=Fieldbyname('PWidth').AsInteger;
        ParentPanel.Height :=Fieldbyname('PHeight').AsInteger;
     end;
     
     sqlstr :='select * from TabInfoField where TabID=''' + TabID + ''' order by Orderby';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();
     //ParentPanel :=Panel1;
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
         if  lwidthnum =0 then lwidthnum :=100;
         if  lheightnum =0 then lheightnum :=20;
         
         FieldID := Fieldbyname('FieldID').AsString;
         Fieldname := Fieldbyname('Fieldname').AsString;
         FieldType := lowercase(Fieldbyname('FieldType').AsString);

         Component :=Create_MyLabel(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
         Set_ControlEvent(Component);

         Component :=Create_MyPanel(topnum, leftnum, widthnum, heightnum, FieldID, Fieldname, ParentPanel);
         Set_ControlEvent(Component);
         next;
     end;
   end;

end;

//初始化模板
procedure TTabInfoStyle_frm.IniPanel(Sender: TObject);
var sqlstr :string;
    control:TWinControl;
    Component:TObject;
    i, colnum, topnum,leftnum, widthnum,heightnum, Ltopnum, Lleftnum, lwidthnum,lheightnum,addtopnum, addleftnum:integer;
    FieldID, Fieldname, FieldType:string;
    collleft,colPleft, colLWidth, colPWidth:integer;
begin
   collleft :=10;       colPleft :=95;
   widthnum :=100;      lwidthnum :=80;
   colLWidth :=lwidthnum + widthnum +30;
   colPWidth :=lwidthnum + widthnum +30;
   heightnum :=22;      lheightnum :=22;
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfoField where TabID=''' + TabID + ''' order by Orderby';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();
     colnum:=0;
     topnum:=-10;         ltopnum:=0;
     leftnum:=colPleft;        lleftnum:=collleft;
     for i :=0 to RecordCount -1 do
     begin
         inc(colnum);
         if colnum <2 then
            topnum :=topnum + heightnum +10;
         //leftnum :=leftnum + lleftnum + lwidthnum + 50;
         ltopnum :=topnum;

         FieldID := Fieldbyname('FieldID').AsString;
         Fieldname := Fieldbyname('Fieldname').AsString;
         FieldType := lowercase(Fieldbyname('FieldType').AsString);

         Component :=Create_MyLabel(ltopnum, lleftnum, lwidthnum, lheightnum, FieldID, Fieldname, ParentPanel);
         Set_ControlEvent(Component);
         
         Component :=Create_MyPanel(topnum, leftnum, widthnum, heightnum, FieldID, Fieldname, ParentPanel);
         Set_ControlEvent(Component);
         leftnum :=leftnum + colPWidth;
         lleftnum :=lleftnum + colLWidth;

         if colnum >=2 then
         begin
           leftnum:=colPleft;        lleftnum:=collleft;
           colnum :=0;
         end;
         
         next;
     end;
   ParentPanel.Width :=colPWidth + widthnum + 120;
   ParentPanel.Height  :=topnum +40;

   end;

end;

//保存模板设置
procedure TTabInfoStyle_frm.ReadPanel(Sender: TObject);
var sqlstr :string;
    i, recordnum, topnum,leftnum,widthnum,heightnum, Orderby:integer;
    FieldID, Fieldname, FieldType:string;
begin
   with ParentPanel do
   begin
     sqlstr :='Update TabInfo set PWidth =' + inttostr(Width)+ ', PHeight =' +inttostr(Height)+ ' where TabID=''' + TabID + '''';
     DoSql(sqlstr);
     Orderby :=0;
     for i :=0 to ControlCount -1 do
     begin
         FieldID :=Controls[i].Hint;
         topnum :=      Controls[i].Top;
         leftnum:=      Controls[i].Left;
         widthnum:=     Controls[i].Width;
         heightnum:=    Controls[i].Height;
         if  Controls[i] is TMyPanel then
         begin
            inc(Orderby);
            sqlstr:='Update TabInfoField set PTop='+inttostr(topnum)+', PLeft='+inttostr(leftnum)+
                ', PWidth='+inttostr(widthnum) +', PHeight='+inttostr(heightnum) +', Orderby='+inttostr(Orderby)+' where TabID=''' + TabID + ''' and FieldID=''' + FieldID + '''';
         end
         else if Controls[i] is TMyLabel then
                sqlstr:='Update TabInfoField set LTop='+inttostr(topnum)+', LLeft='+inttostr(leftnum)+
                ', LWidth='+inttostr(widthnum) +', LHeight='+inttostr(heightnum) +' where TabID=''' + TabID + ''' and FieldID=''' + FieldID + '''';
         if DoSql(sqlstr) >0 then
           inc(recordnum);
     end;
     showmessage('成功记录数' + inttostr(recordnum) +'条');
   end;
end;

procedure TTabInfoStyle_frm.Set_ControlEvent(Component:TObject);
begin
   if (Component.ClassName ='TMyPanel') then
   begin
     with  (Component as TMyPanel) do
     begin
       //PopupMenu :=Create_ControlPopMenu(0);
       OnClick :=TControlOnClick;
       //OnDblClick :=TControlOnDblClick;
       //OnMouseDown :=TControlOnMouseDown;
       OnMouseMove :=TControlOnMouseMove;
       //OnMouseUp :=TControlOnMouseUp;
     end;
   end
   else if (Component.ClassName ='TMyLabel') then
   begin
     with  (Component as TMyLabel) do
     begin
       OnClick :=TControlOnClick;
       OnMouseDown :=TLabelOnMouseDown;
       OnMouseMove :=TLabelOnMouseMove;
       OnMouseUp :=TLabelOnMouseUp;
     end;
   end
end;
procedure TTabInfoStyle_frm.TLabelOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mouseDownOldX :=X;
  mouseDownOldY :=Y;
  CtrlDownFlag:=true;
end;
procedure TTabInfoStyle_frm.TControlOnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ManipulateControl((Sender  as  TControl),  Shift,  X,  Y,  2);
end;
procedure TTabInfoStyle_frm.TLabelOnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
    if (Sender is TMyLabel) then
    begin
      (sender as Tcontrol).Cursor := crSizeAll;
      if (CtrlDownFlag =true) and (Shift=[ssLeft]) then
      begin
        (sender as Tcontrol).Left :=(sender as Tcontrol).Left + X - mouseDownOldX;
        (sender as Tcontrol).Top   :=(sender as Tcontrol).Top + Y - mouseDownOldY;
      end;
    end;
end;
procedure TTabInfoStyle_frm.TLabelOnMouseUp(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  CtrlDownFlag :=false;
end;

procedure TTabInfoStyle_frm.TControlOnClick(Sender: TObject);
var i:integer;
begin
  //TControlSelect(sender);
  for i:=0 to ParentPanel.ControlCount - 1 do
  begin
     if (ParentPanel.Controls[i].ClassName ='TMyPanel') then
       (ParentPanel.Controls[i] as TMyPanel).IsFocused:=false;
     if (ParentPanel.Controls[i].ClassName ='TMyLabel') then
       (ParentPanel.Controls[i] as TMyLabel).IsFocused:=false;
  end;
  if (Sender.ClassName ='TMyPanel') then
  begin
       (Sender as TMyPanel).IsFocused:=true;
        StatusBar1.Panels[1].Text :='[Top,Left,Height,Width]=[' + Inttostr(TMyPanel(Sender).Top) + ',' + Inttostr(TMyPanel(Sender).Left) + ',' + Inttostr(TMyPanel(Sender).Width) + ',' + Inttostr(TMyPanel(Sender).Height) + ']';
  end
  else if (Sender.ClassName ='TMyLabel') then
  begin
       (Sender as TMyLabel).IsFocused:=true;
        StatusBar1.Panels[1].Text :='[Top,Left,Height,Width]=[' + Inttostr(TMyLabel(Sender).Top) + ',' + Inttostr(TMyLabel(Sender).Left) + ',' + Inttostr(TMyLabel(Sender).Width) + ',' + Inttostr(TMyLabel(Sender).Height) + ']';
  end;
end;


procedure TTabInfoStyle_frm.FormShow(Sender: TObject);
begin
   btnexpstyle.Click;
   StatusBar1.Panels[0].Text :=TabID + '(' +TabName + ')';
end;

procedure TTabInfoStyle_frm.btninistyleClick(Sender: TObject);
begin
  ClearPanel(nil);
  IniPanel(nil);
end;

procedure TTabInfoStyle_frm.btnsavestyleClick(Sender: TObject);
begin
  ReadPanel(nil);
end;

procedure TTabInfoStyle_frm.ParentPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ManipulateControl((Sender  as  TWinControl),  Shift,  X,  Y,  5);

end;

procedure TTabInfoStyle_frm.Edit1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ManipulateControl((Sender  as  TControl),  Shift,  X,  Y,  5);


end;

procedure TTabInfoStyle_frm.btnexpstyleClick(Sender: TObject);
begin
   ClearPanel(nil);
   CreatePanel(nil);
end;

procedure TTabInfoStyle_frm.btnclosestyleClick(Sender: TObject);
begin
  close();
end;

procedure TTabInfoStyle_frm.FormCreate(Sender: TObject);
begin
  self.Caption:='表的模板设置';
  
end;

procedure TTabInfoStyle_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_F8  : if btnexpstyle.Enabled then  btnexpstyle.Click;
    VK_F9  : if btnsavestyle.Enabled then  btnsavestyle.Click;
    VK_F4 : if btninistyle.Enabled then  btninistyle.Click;
    VK_ESCAPE : if btnclosestyle.Enabled then  btnclosestyle.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

end.
