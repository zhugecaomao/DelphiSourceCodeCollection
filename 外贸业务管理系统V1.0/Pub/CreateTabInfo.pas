unit CreateTabInfo;

interface
Uses
  IniFiles, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ComCtrls, Db, ADODB, DBTables, Grids, ExtCtrls, Mask, Spin, DBGrids,
  CheckLst, ShellAPI, Menus, MyPanel, MyLabel;

function Create_MyPanel(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TMyPanel;
function Create_MyLabel(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TMyLabel;
function Create_Label(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TLabel;
function Create_Text(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TEdit;
function Create_Memo(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TMemo;
function Create_ComboBox(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TComboBox;
function Create_DateTimePicker(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Datetype:string; Parentobect:TWinControl):TDateTimePicker;

function Create_DBText(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBEdit;
function Create_DBMemo(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBMemo;
function Create_DBComboBox(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBComboBox;
function Create_DBLookupComboBox(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBLookupComboBox;
function Create_DataSource(id:string;query: TADOTable;Parentobect:TWinControl):TDataSource;
function Create_ADOTable(id:string; Tab : string;connect:  TADOConnection;Parentobect:TWinControl):TADOTable;
procedure ManipulateControl(Control: TControl; Shift: TShiftState; X, Y, Precision: integer);

implementation
  uses DataModule;

function Create_MyPanel(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TMyPanel;
var QRLabel:TMyPanel;
begin
    QRLabel :=TMyPanel.Create(nil);
    QRLabel.Name :='MyPanel_' + ID;
    //QRLabel.AutoSize:=true;
    QRLabel.Caption :=id ;//+ '('+text+')';
    QRLabel.Top :=topnum;
    QRLabel.Left:=leftnum;
    QRLabel.Width:=widthnum;
    QRLabel.height:=heightnum;
    QRLabel.Hint :=ID;
    QRLabel.Alignment:=taLeftJustify;
    //QRLabel.BorderStyle :=bsSingle;
    QRLabel.Parent :=(Parentobect as TPanel);
    Result := QRLabel;
end;
function Create_MyLabel(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TMyLabel;
var QRLabel:TMyLabel;
begin
    QRLabel :=TMyLabel.Create(nil);
    QRLabel.Name :='MyLabel_' + ID;
    QRLabel.Caption :=text;
    QRLabel.Top :=topnum;
    QRLabel.Left:=leftnum;
    QRLabel.Width:=widthnum;
    QRLabel.height:=heightnum;
    QRLabel.Hint :=ID;
    QRLabel.AutoSize:=true;
    QRLabel.Alignment:=taRightJustify;
    //QRLabel.BorderStyle :=bsSingle;
    QRLabel.Parent :=(Parentobect as TPanel);
    Result := QRLabel;
end;

function Create_Label(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TLabel;
var QRLabel:TLabel;
begin
    QRLabel :=TLabel.Create(nil);
    QRLabel.Name :='Lbl_' + ID;
    QRLabel.Parent :=Parentobect;
    QRLabel.AutoSize:=true;
    QRLabel.Caption :=text;
    QRLabel.Top :=topnum;
    QRLabel.Left:=leftnum;
    QRLabel.Width:=widthnum;
    QRLabel.height:=heightnum;
    //QRLabel.Color :=clBackground;
    QRLabel.Alignment :=taRightJustify;
    //QRLabel.WordWrap :=true;
    QRLabel.Transparent :=true;
    Result := QRLabel;
end;

function Create_Text(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TEdit;
var Textbox:TEdit;
begin
    Textbox :=TEdit.Create(nil);
    Textbox.Name :='Txt_' +ID; // 'Txt_' +
    Textbox.Text :=text;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;
    Textbox.Parent :=Parentobect;
    Result := Textbox;
end;
function Create_Memo(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TMemo;
var Textbox:TMemo;
begin
    Textbox :=TMemo.Create(nil);
    Textbox.Name :='Txt_' +ID; // 'Txt_' +
    Textbox.Text :=text;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;
    Textbox.Parent :=Parentobect;
    Result := Textbox;
end;

function Create_ComboBox(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TComboBox;
var Textbox:TComboBox;
begin
    Textbox :=TComboBox.Create(nil);
    Textbox.Name :='Txt_' + ID;
    Textbox.Text :=text;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;

    Textbox.Parent :=Parentobect;
    Result := Textbox;
end;

function Create_Masktxt(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Parentobect:TWinControl):TMaskEdit;
var Textbox:TMaskEdit;
begin
    Textbox :=TMaskEdit.Create(nil);
    Textbox.Name :='Txt_' + ID;
    Textbox.Text :=text;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;
    Textbox.Parent :=Parentobect;
    Result := Textbox;
end;
function Create_DateTimePicker(topnum, leftnum, widthnum, heightnum:integer; id, text:string; Datetype:string; Parentobect:TWinControl):TDateTimePicker;
var Textbox:TDateTimePicker;
begin
    Textbox :=TDateTimePicker.Create(nil);
    Textbox.Name :='Txt_' + ID;
    try
      Textbox.DateTime :=strtodatetime(text);
    except
    end;
    if Datetype='1' then
       Textbox.Format :='yyyy-DD-mm HH-dd-ss'
    else
       Textbox.Format :='yyyy-DD-mm';
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;
    Textbox.Parent :=Parentobect;
    Result := Textbox;
end;


//=================数据库控件===============

function Create_DBText(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBEdit;
var Textbox:TDBEdit;
begin
    Textbox :=TDBEdit.Create(nil);
    Textbox.Parent :=Parentobect;
    Textbox.Name :='Txt_' +ID; // 'Txt_' +
    Textbox.DataSource :=DS;
    Textbox.DataField :=df;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;
    Result := Textbox;
end;

function Create_DBMemo(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBMemo;
var Textbox:TDBMemo;
begin
    Textbox :=TDBMemo.Create(nil);
    Textbox.Parent :=Parentobect;
    Textbox.Name :='Txt_' +ID; // 'Txt_' +
    Textbox.DataSource :=DS;
    Textbox.DataField :=df;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;
    Result := Textbox;
end;

function Create_DBComboBox(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBComboBox;
var Textbox:TDBComboBox;
begin
    Textbox :=TDBComboBox.Create(nil);
    Textbox.Parent :=Parentobect;
    Textbox.Name :='Txt_' + ID;
    Textbox.DataSource :=DS;
    Textbox.DataField :=df;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;

    Result := Textbox;
end;

function Create_DBLookupComboBox(topnum, leftnum, widthnum, heightnum:integer; id, df:string; ds:TDataSource; Parentobect:TWinControl):TDBLookupComboBox;
var Textbox:TDBLookupComboBox;
begin
    Textbox :=TDBLookupComboBox.Create(nil);
    Textbox.Parent :=Parentobect;
    Textbox.Name :='Txt_' + ID;
    Textbox.DataSource :=DS;
    Textbox.DataField :=df;
    Textbox.Top :=topnum;
    Textbox.Left:=leftnum;
    Textbox.Width:=widthnum;
    Textbox.Height:=heightnum;

    Result := Textbox;
end;
function Create_DataSource(id:string;query: TADOTable;Parentobect:TWinControl):TDataSource;
var DS:TDataSource;
begin
    DS :=TDataSource.Create(nil);
    //DS.P :=Parentobect;
    DS.Name :='DS_' + ID;
    DS.DataSet :=query;
    Result := DS;
end;
function Create_ADOTable(id:string;Tab : string;connect:  TADOConnection;Parentobect:TWinControl):TADOTable;
var DS:TADOTable;
begin
    DS :=TADOTable.Create(nil);
    //DS.Parent :=Parentobect;
    DS.Name :='TABLE_' + ID;
    DS.Connection :=connect;
    ds.TableName :=Tab;
    DS.Active :=true;
    Result := DS;
end;

//==============================================================================
//任意摆布一个控件（拖动、放大、缩小）******************************************
//==============================================================================
procedure ManipulateControl(Control: TControl; Shift: TShiftState; X, Y, Precision: integer);
var SC_MANIPULATE: Word;
begin
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的最左侧**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       if (X<=Precision) and (Y>Precision) and (Y<Control.Height-Precision)
  then begin
         SC_MANIPULATE  := $F001;
         Control.Cursor := crSizeWE;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的最右侧**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X>=Control.Width-Precision) and (Y>Precision) and (Y<Control.Height-Precision)
  then begin
         SC_MANIPULATE  := $F002;
         Control.Cursor := crSizeWE;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的最上侧**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X>Precision) and (X<Control.Width-Precision) and (Y<=Precision)
  then begin
         SC_MANIPULATE  := $F003;
         Control.Cursor := crSizeNS;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的左上角**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X<=Precision) and (Y<=Precision)
  then begin
         SC_MANIPULATE  := $F004;
         Control.Cursor := crSizeNWSE;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的右上角**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X>=Control.Width-Precision) and (Y<=Precision)
  then begin
         SC_MANIPULATE  := $F005;
         Control.Cursor := crSizeNESW    ;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的最下侧**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X>Precision) and (X<Control.Width-Precision) and (Y>=Control.Height-Precision)
  then begin
         SC_MANIPULATE  := $F006;
         Control.Cursor := crSizeNS;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的左下角**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X<=Precision) and (Y>=Control.Height-Precision)
  then begin
         SC_MANIPULATE  := $F007;
         Control.Cursor := crSizeNESW;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的右下角**********************************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X>=Control.Width-Precision) and (Y>=Control.Height-Precision)
  then begin
         SC_MANIPULATE  := $F008;
         Control.Cursor := crSizeNWSE;
       end
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //光标在控件的客户区（移动整个控件）******************************************
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  else if (X>5) and (Y>5) and (X<Control.Width-5) and (Y<Control.Height-5)
  then begin
         SC_MANIPULATE  := $F009;
         Control.Cursor := crSizeAll;
       end
  else begin
         SC_MANIPULATE := $F000;
         Control.Cursor := crDefault;
       end;
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if Shift=[ssLeft] then
  begin
    ReleaseCapture;
    Control.Perform(WM_SYSCOMMAND, SC_MANIPULATE, 0);
  end;  
end;

end.
 