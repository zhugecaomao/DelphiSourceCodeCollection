unit UserInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, SUIImagePanel, Grids, DBGrids, SUIDBCtrls,
  SUIButton, DB, ADODB, SUIScrollBar, SUIProgressBar, ComCtrls,
  SUIStatusBar, StdCtrls, SUIComboBox, SUIEdit;

type
  TUserInfo_frm = class(TForm)
    suiForm1: TsuiForm;
    suiPanel1: TsuiPanel;
    suiImagePanel1: TsuiImagePanel;
    suiImagePanel2: TsuiImagePanel;
    DBGrid1: TsuiDBGrid;
    btnAdd: TsuiButton;
    btnUpdate: TsuiButton;
    btnDelete: TsuiButton;
    btnClose: TsuiButton;
    QueryGrid: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    btnBrowse: TsuiButton;
    suiStatusBar1: TsuiStatusBar;
    ProgressBar1: TsuiProgressBar;
    userid: TsuiEdit;
    username: TsuiEdit;
    suiComboBox1: TsuiComboBox;
    Label1: TLabel;
    Label2: TLabel;
    suiButton1: TsuiButton;
    suiButton2: TsuiButton;
    Label3: TLabel;
    tel: TsuiEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure QueryGridAfterScroll(DataSet: TDataSet);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
        procedure initialize();
        procedure Query_ini(wheresql:string);
  public
    { Public declarations }
    TabID:STRING;
  end;

var
  UserInfo_frm: TUserInfo_frm;

implementation

uses DataModule, BasePage, BaseForm;

{$R *.dfm}

procedure TUserInfo_frm.initialize();
begin
  TabID :='UserInfo';
  Set_DBGrid(DBGrid1, TabID);
  Query_ini('');
end;


procedure TUserInfo_frm.Query_ini(wheresql:string);
var
    sqlstr:string;
begin
  wheresql:=' where 1=1 ' + wheresql;
  sqlstr:='select * from '+ tabID + wheresql;
  Get_Query(QueryGrid, sqlstr);
end;


procedure TUserInfo_frm.FormShow(Sender: TObject);
begin
  initialize();
   SetFormStyle(suiform1, UIFormStyle);
end;

procedure TUserInfo_frm.QueryGridAfterScroll(DataSet: TDataSet);
begin
  //Query_ini('');
end;

procedure TUserInfo_frm.btnAddClick(Sender: TObject);
var sqlstr:string;
begin
  {application.CreateForm(TTabInfoEdit_frm, TabInfoEdit_frm);
  TabInfoEdit_frm.TabID :=TabID;
  TabInfoEdit_frm.Action :='add';
  SetLength(TabInfoEdit_frm.KeyValue, 1);
  TabInfoEdit_frm.KeyValue[0, 0] :='UserID';
  TabInfoEdit_frm.KeyValue[0, 1] :='';
  TabInfoEdit_frm.KeyValue[0, 2] :='1';    //数据类型(0没有''是否有'号)
  TabInfoEdit_frm.ShowModal;
  Query_ini('');
  TabInfoEdit_frm.Free;  }

end;

procedure TUserInfo_frm.btnUpdateClick(Sender: TObject);
var sqlstr:string;
begin
  {application.CreateForm(TTabInfoEdit_frm, TabInfoEdit_frm);
  TabInfoEdit_frm.TabID :=TabID;
  TabInfoEdit_frm.Action :='update';
  SetLength(TabInfoEdit_frm.KeyID, 1);
  SetLength(TabInfoEdit_frm.KeyValue, 1);
  TabInfoEdit_frm.KeyValue[0, 0] :='UserID';
  TabInfoEdit_frm.KeyValue[0, 1] :=QueryGrid.fieldbyname('UserID').AsString;
  TabInfoEdit_frm.KeyValue[0, 2] :='1';    //数据类型(0没有''是否有'号)
  TabInfoEdit_frm.ShowModal;
  Query_ini('');
  TabInfoEdit_frm.Free;    }

end;

procedure TUserInfo_frm.btnDeleteClick(Sender: TObject);
var sqlstr, id:string;
    I, count:integer;
begin
     count :=0;
     ProgressBar1.Height :=20;
     ProgressBar1.Visible :=true;
     ProgressBar1.Max :=DBGrid1.SelectedRows.Count;
     for I:=0 to DBGrid1.SelectedRows.Count -1 do
     begin
        ProgressBar1.StepIt;
        try
             DBGrid1.DataSource.DataSet.GoTobookmark(pointer(DBGrid1.SelectedRows[I]));
             id:=DBGrid1.DataSource.DataSet.fieldbyname('UserID').AsString ;
             sqlstr :='delete from '+ tabID + ' where UserID=''' + ID + '''';
             if DoSql(sqlstr) >0 then 
               count :=count + 1;
        except
             continue;
        end;
     end;
     ProgressBar1.Visible :=false;
     showmessage('成功删除记录' + inttostr(count) + '条');
     Query_ini('');
end;

procedure TUserInfo_frm.btnBrowseClick(Sender: TObject);
begin
  {application.CreateForm(TTabInfoEdit_frm, TabInfoEdit_frm);
  TabInfoEdit_frm.TabID :=TabID;
  TabInfoEdit_frm.Action :='browse';
  SetLength(TabInfoEdit_frm.KeyID, 1);
  SetLength(TabInfoEdit_frm.KeyValue, 1);
  TabInfoEdit_frm.KeyValue[0, 0] :='UserID';
  TabInfoEdit_frm.KeyValue[0, 1] :=QueryGrid.fieldbyname('UserID').AsString;
  TabInfoEdit_frm.KeyValue[0, 2] :='1';    //数据类型(0没有''是否有'号)
  TabInfoEdit_frm.ShowModal;
  TabInfoEdit_frm.Free;  }

end;

procedure TUserInfo_frm.btnCloseClick(Sender: TObject);
begin
  close();
  exit;
end;

procedure TUserInfo_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Case Key of
    VK_F9  : if btnadd.Enabled then  btnadd.Click;
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;


end;

end.
