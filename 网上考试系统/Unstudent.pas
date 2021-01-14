unit Unstudent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids, Mask,
  ComCtrls,Jpeg, ExtDlgs, DB;

type
  Tstudentfrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBImage1: TDBImage;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Addressedit: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    DataSource1: TDataSource;
    BitBtn5: TBitBtn;
    RBsome: TRadioButton;
    RBall: TRadioButton;
    datepick: TDateTimePicker;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RBallClick(Sender: TObject);
    procedure RBsomeClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  studentfrm: Tstudentfrm;

implementation

uses Undm, Unpass;

{$R *.dfm}

procedure Tstudentfrm.BitBtn4Click(Sender: TObject);
var  tj:Tjpegimage;
begin
 if openpicturedialog1.Execute then
   if lowercase(extractfileext(openpicturedialog1.FileName))='.bmp' then
    dbimage1.Picture.Bitmap.LoadFromFile(openpicturedialog1.FileName)
   else
    begin
     tj.create;
     tj.loadfromfile(openpicturedialog1.FileName);
     dbimage1.Picture.Bitmap.Assign(tj);
    end;
end;


procedure Tstudentfrm.BitBtn2Click(Sender: TObject);
begin
datamodule1.CDSStudent.Delete;

//bitbtn1.Enabled:=true;
end;

procedure Tstudentfrm.BitBtn1Click(Sender: TObject);
begin
datamodule1.CDSStudent.Insert;

//bitbtn1.Enabled:=false;
//bitbtn6.Enabled:=true;
end;

procedure Tstudentfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
datamodule1.CDSStudent.ApplyUpdates(-1);
action:=cafree;
end;

procedure Tstudentfrm.PageControl1Change(Sender: TObject);
begin
 if pagecontrol1.ActivePage=tabsheet1 then
   studentfrm.Caption:='考员信息录入'
 else
  begin
   datamodule1.CDSStudent.ApplyUpdates(-1);
   studentfrm.Caption:='准考证打印';
  end;
end;

procedure Tstudentfrm.BitBtn5Click(Sender: TObject);
begin

close;
end;

procedure Tstudentfrm.RBallClick(Sender: TObject);
begin
rball.Checked:=true;
rbsome.Checked:=false;
edit1.Enabled:=false;
edit2.Enabled:=false;
end;

procedure Tstudentfrm.RBsomeClick(Sender: TObject);
begin
rbsome.Checked:=true;
rball.Checked:=false;
edit1.Enabled:=true;
edit2.Enabled:=true;
edit1.SetFocus;
end;

procedure Tstudentfrm.BitBtn7Click(Sender: TObject);
 var len1,len2:string;
     i:integer;
begin
 if rball.Checked=true then
  begin
   datamodule1.CDSStudent.Filtered:=false;
   datamodule1.CDSStudent.First;
   for i:=1 to datamodule1.CDSStudent.RecordCount do
    begin
    datamodule1.CDSStudent.Edit;
     datamodule1.CDSStudent.Fields[7].Text:=datetostr(datepick.Date);
     datamodule1.CDSStudent.Next;
    end;
  end
 else
  begin
       len1:='';
       len2:='';
       len1:=edit1.Text;
       len2:=edit2.Text;
       datamodule1.cDSStudent.Filter:=FORMAT('准考证号>=''%s'' AND 准考证号<=''%S''',[len1,len2]);
       datamodule1.cDSStudent.Filtered:=TRUE;
       datamodule1.CDSStudent.First;
       for i:=1 to datamodule1.CDSStudent.RecordCount do
        begin
         datamodule1.CDSStudent.Edit;
         datamodule1.CDSStudent.Fields[7].Text:=datetostr(datepick.Date);
         datamodule1.CDSStudent.Next;
        end;
  end;
 passfrm.QRLabel8.Caption:=datetostr(datepick.Date);
 passfrm.QRLabel9.Caption:=addressedit.Text;
 datamodule1.CDSStudent.ApplyUpdates(0);
 passfrm.QuickRep1.Preview;

end;

procedure Tstudentfrm.BitBtn8Click(Sender: TObject);
 var len1,len2:string;
     i:integer;
begin
 if rball.Checked=true then
  begin
   datamodule1.CDSStudent.First;
   for i:=1 to datamodule1.CDSStudent.RecordCount do
    begin
    datamodule1.CDSStudent.Edit;
     datamodule1.CDSStudent.Fields[7].Text:=datetostr(datepick.Date);
     datamodule1.CDSStudent.Next;
    end;
  end
 else
  begin
       len1:='';
       len2:='';
       len1:=edit1.Text;
       len2:=edit2.Text;
       datamodule1.cDSStudent.Filter:=FORMAT('准考证号>=''%s'' AND 准考证号<=''%S''',[len1,len2]);
       datamodule1.cDSStudent.Filtered:=TRUE;
       datamodule1.CDSStudent.First;
       for i:=1 to datamodule1.CDSStudent.RecordCount do
        begin
         datamodule1.CDSStudent.Edit;
         datamodule1.CDSStudent.Fields[7].Text:=datetostr(datepick.Date);
         datamodule1.CDSStudent.Next;
        end;
  end;
 passfrm.QRLabel8.Caption:=datetostr(datepick.Date);
 passfrm.QRLabel9.Caption:=addressedit.Text;
 datamodule1.CDSStudent.ApplyUpdates(0);
passfrm.QuickRep1.Print;
end;

procedure Tstudentfrm.BitBtn6Click(Sender: TObject);
begin
if datamodule1.cDSStudent.Locate('准考证号',dbedit1.Text,[locaseinsensitive]) then
 begin
  application.MessageBox('这个准考证号已存在，请重新输入！','系统警告',mb_ok+mb_iconstop);
  datamodule1.CDSStudent.CancelUpdates;
 end
else
  begin
   datamodule1.CDSStudent.Edit;

   datamodule1.CDSStudent.Post;
  end;
   bitbtn1.Enabled:=true;
  // bitbtn6.Enabled:=false;
   dbnavigator1.Enabled:=true;
end;

procedure Tstudentfrm.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
//bitbtn1.Enabled:=true;

end;

procedure Tstudentfrm.FormShow(Sender: TObject);
begin
datamodule1.CDSStudent.Filtered:=false;
end;

procedure Tstudentfrm.FormActivate(Sender: TObject);
begin
 datamodule1.CDSStudent.Filtered:=false;
end;

end.
