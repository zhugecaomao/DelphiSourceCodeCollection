unit UMsgmanager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, Wwdbigrd, Wwdbgrid, Buttons, ExtCtrls, DB,
  DBClient;

type
  TfmMsgmanager = class(TfmBase)
    Panel3: TPanel;
    spbinserlm: TSpeedButton;
    spbeditlm: TSpeedButton;
    spbdellm: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel2: TPanel;
    Panel1: TPanel;
    wwdbgrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    dsview: TDataSource;
    dsdata: TDataSource;
    cdsmanager: TClientDataSet;
    Cdsview: TClientDataSet;
    procedure SpeedButton5Click(Sender: TObject);
    procedure spbinserlmClick(Sender: TObject);
    procedure spbeditlmClick(Sender: TObject);
    procedure spbdellmClick(Sender: TObject);
    procedure wwdbgrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
     function MsgRead():boolean;
    function MovReCord(no:string):boolean;
  end;

var
  fmMsgmanager: TfmMsgmanager;

implementation

uses func, Unitlmxx, Unitlmmxlr;

{$R *.dfm}
 ///////////////////////////////
function tfmMsgmanager.MsgRead():boolean;
var
  temp:widestring;
  datas:olevariant;
begin
  result:=false;
  cdsmanager.Close;
  cdsmanager.Data:=null;
  temp:='select * from manager';
  datas:=null;
  try
    datas:=adisp.execSql(temp);
    if not varisnull(datas) then
    begin
      cdsmanager.Data:=datas;
      cdsmanager.Open;
      datas:=null;
      result:=true;
    end;
  except
  end;
end;
function tfmmsgmanager.MovReCord(no:string):boolean;
var
  temp:widestring;
  datas:olevariant;
begin
  result:=false;
  cdsview.Close;
  cdsview.Data:=null;
  temp:='select * from lmmx where lmno='+''''+trim(no)+'''';
  datas:=null;
  try
    datas:=adisp.execSql(temp);
    if not varisnull(datas) then
    begin
      cdsview.Data:=datas;
      cdsview.Open;
      datas:=null;
      result:=true;
    end;
  except
  end;

end;
 ///////////////////////////////
procedure TfmMsgmanager.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmMsgmanager.spbinserlmClick(Sender: TObject);
begin
  inherited;
   frmlmxx:=tfrmlmxx.Create(self);
  frmlmxx.fg:=1;
  frmlmxx.ShowModal;
  frmlmxx.Free;
end;

procedure TfmMsgmanager.spbeditlmClick(Sender: TObject);
begin
  inherited;
  if cdsmanager.IsEmpty then
  begin
    application.MessageBox('没有可以修改的栏目信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  frmlmxx:=tfrmlmxx.Create(self);
  frmlmxx.fg:=2;
  frmlmxx.edtlmno.Text:=trim(cdsmanager.fieldbyname('lmno').AsString) ;
  frmlmxx.mlmname.Text:=trim(cdsmanager.fieldbyname('lmname').AsString);
  frmlmxx.ShowModal;
  frmlmxx.Free;
end;

procedure TfmMsgmanager.spbdellmClick(Sender: TObject);
var
  sql:widestring;
  no:string;
begin
  inherited;
  if not cdsmanager.IsEmpty then
  begin
    if application.MessageBox('是否删除该条栏目信息，将影响该条信息下的内容信息！',pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
    begin
      no:=cdsmanager.fieldbyname('lmno').AsString;
      sql:='delete from lmmx where lmno='+''''+trim(no)+'''';
       try    //容错处理
       adisp.updatesql(sql);//删除

      //deletefile(ExtractFilePath(application.ExeName)+'lmmx.xml');
     cdsmanager.Delete;
      except
      end;
    end;
  end else
  begin
    application.MessageBox('没有可以删除的栏目信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure TfmMsgmanager.wwdbgrid1DblClick(Sender: TObject);
begin
  inherited;
if not  MovReCord(trim(cdsmanager.fieldbyname('lmno').AsString)) then exit;
end;

procedure TfmMsgmanager.FormShow(Sender: TObject);
begin
  inherited;
  if not MsgRead then exit;
end;

procedure TfmMsgmanager.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   frmlmmxlr:=tfrmlmmxlr.Create(self);
  frmlmmxlr.fg:=1;
  frmlmmxlr.cbno.Text:=cdsmanager.FieldValues['lmno'];
  frmlmmxlr.ShowModal;
end;

procedure TfmMsgmanager.SpeedButton3Click(Sender: TObject);
var
  temp:widestring;
begin
  inherited;
  if Cdsview.IsEmpty then
  begin
    application.MessageBox('没有可以删除的栏目信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  if application.MessageBox('是否删除该条栏目内容！',pchar(application.Title),mb_iconquestion+mb_yesno)=idyes then
  begin
    temp:='delete from lmmx where id='+trim(cdsview.fieldbyname('id').AsString);
    try    //容错处理
    adisp.updatesql(temp);
    Cdsview.Delete;
    except
    end;
  end;
end;

procedure TfmMsgmanager.SpeedButton2Click(Sender: TObject);
var
  sized:real;
begin
  if Cdsview.IsEmpty then
  begin
    application.MessageBox('没有可以修改的栏目信息！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  frmlmmxlr:=tfrmlmmxlr.Create(self);
  frmlmmxlr.fg:=2;
  frmlmmxlr.cbno.Text:=trim(Cdsview.fieldbyname('lmno').AsString);
  frmlmmxlr.edtlmzt.Text:=trim(Cdsview.fieldbyname('lmzt').AsString);
  frmlmmxlr.mmemo.Text:=trim(Cdsview.fieldbyname('memo').AsString);
  frmlmmxlr.edtdir.Text:=trim(Cdsview.fieldbyname('fjname').AsString);
  sized:=tblobfield(Cdsview.fieldbyname('fj')).BlobSize / (1024*1024);
  if sized<1 then
  begin
    sized:=sized*1024;
    frmlmmxlr.lsize.Caption:=format('%4.2f',[sized])+'KB';
  end else
  begin
    frmlmmxlr.lsize.Caption:=format('%4.2f',[sized])+'MB';
  end;
  frmlmmxlr.ShowModal;
end;

end.
