unit Unmanerge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, DB, Mask,
  ExtCtrls;

type
  TOperatorfrm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    TabSheet2: TTabSheet;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn5: TBitBtn;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DataSource2: TDataSource;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Operatorfrm: TOperatorfrm;

implementation

uses Undm;

{$R *.dfm}

procedure TOperatorfrm.FormShow(Sender: TObject);
begin
if datamodule1.cDSManerge.Fields[2].Value=2 then
   tabsheet2.Enabled:=false;
end;

procedure TOperatorfrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
datamodule1.CDSManerge.ApplyUpdates(-1);
action:=cafree;
end;

procedure TOperatorfrm.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure TOperatorfrm.BitBtn3Click(Sender: TObject);
begin
datamodule1.cDSManerge.Insert;

dbedit1.Enabled:=true;
dbedit2.Enabled:=true;
dbedit3.Enabled:=true;
dbedit1.SetFocus;
end;

procedure TOperatorfrm.BitBtn4Click(Sender: TObject);
begin
datamodule1.cDSManerge.Delete;
dbedit1.Enabled:=false;
dbedit2.Enabled:=false;
dbedit3.Enabled:=false;
end;

procedure TOperatorfrm.BitBtn1Click(Sender: TObject);
begin
 if (edit1.Text='')or(edit2.Text='')or(edit3.Text='')or (edit4.Text='') then
  begin
  showmessage('请完整输入你的信息，编辑框中的内容不能为空！');
  exit;
  end
 else
  if not datamodule1.cDSManerge.Locate('姓名',edit1.Text,[]) then
   //begin
   showmessage('数据库中没有这个用户名，请重新输入')
  else
    if edit2.Text=datamodule1.cDSManerge.Fields[1].Value then
      if edit3.Text=edit4.Text then
       begin
        datamodule1.cDSManerge.Edit;
        datamodule1.cDSManerge.Fields[1].Value:=edit3.Text;
        datamodule1.cDSManerge.Post;
        showmessage('你已经正确修改你的口令，请记住你的新口令！');
        edit1.Text:='';
        edit2.Text:='';
        edit3.Text:='';
        edit4.Text:='';
       end
      else
       begin
        showmessage('你输入的口令和确认口令不相同，请重新输入！');
        edit3.Text:='';
        edit4.Text:='';
       end
    else
      showmessage('你输入的口令不正确，请重新输入！');


end;

procedure TOperatorfrm.BitBtn2Click(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
end;

procedure TOperatorfrm.BitBtn6Click(Sender: TObject);
begin
datamodule1.cDSManerge.Edit;
dbedit1.Enabled:=true;
dbedit2.Enabled:=true;
dbedit3.Enabled:=true;
end;

procedure TOperatorfrm.BitBtn7Click(Sender: TObject);
begin
datamodule1.cDSManerge.Post;
dbedit1.Enabled:=false;
dbedit2.Enabled:=false;
dbedit3.Enabled:=false;
end;

end.
