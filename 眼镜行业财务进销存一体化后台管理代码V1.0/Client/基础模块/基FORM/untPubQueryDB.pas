unit untPubQueryDB;
///////////管理 监视远程数据库的应用程序ydy 2004-4-22 create


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB;

type
  TFm_RemoteDb = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    EdtTable: TEdit;
    Label2: TLabel;
    BtnSelect: TButton;
    edtRecNo: TEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BtnDo: TButton;
    Memo1: TMemo;
    Label4: TLabel;
    btnpagedown: TBitBtn;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    procedure BtnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_RemoteDb: TFm_RemoteDb;

implementation

uses  Data, func, untdatadm;

{$R *.dfm}

procedure TFm_RemoteDb.BtnSelectClick(Sender: TObject);
var
  t_sql:string;
   quedata:olevariant;
  //2004-2-10为了优化程序性能   速度已提高到52秒
begin
    screen.Cursor := crhourglass;
   //关掉与DBGRID 的互动
   dmmain.dsquery.DisableControls;
   quedata:=null;
   if dmmain.dsquery.active then dmmain.dsquery.close;

    t_sql:='select top ' + ComboBox1.Text+MEMO1.Text;

  try
    ipubtemp.ty_query(t_sql,quedata);
    if not varisnull(quedata) then
    begin                                                     
     if dmmain.dsquery.Active then dmmain.dsquery.Close;
      dmmain.dsquery.Data:=quedata;
      dmmain.dsquery.Open;
       dmmain.dsquery.Last;
       edtRecNo.Text := '当前已下载: '+inttostr(dmmain.dsquery.recordcount)+'条';
      dmmain.dsquery.EnableControls;
    end else
    begin
       //不再有数据
        dmmain.dsquery.EnableControls;        //ydy  必须要
       screen.Cursor :=  crdefault;
      exit;
    end;
  except
  end;
  dbgrid1.Refresh;
  dmmain.dsquery.EnableControls;   //ydy add 2004-4-13
  screen.Cursor :=  crdefault;

end;

procedure TFm_RemoteDb.FormShow(Sender: TObject);
begin
 if dmmain.dsquery.active then dmmain.dsquery.close;
 dmmain.dsquery.Data:=null;
end;

procedure TFm_RemoteDb.BtnDoClick(Sender: TObject);
var
  t_sql:string;
   quedata:olevariant;
begin
  screen.Cursor := crhourglass;
  try
   t_sql := trim(memo1.Text);
   ipubtemp.scrapsate(t_sql);
  except
  end;
  screen.Cursor :=  crdefault;
end;

end.
