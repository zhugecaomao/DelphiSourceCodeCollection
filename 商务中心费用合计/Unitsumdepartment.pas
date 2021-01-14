unit Unitsumdepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ComCtrls, dxTL, dxDBCtrl, dxDBGrid, dxCntner, DB,
  ImgList, StdCtrls, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ToolWin, DBGrids;

type
  TF_sumdepartment = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    DataSource1: TDataSource;
    dbgrd1: TDBGrid;
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_sumdepartment: TF_sumdepartment;

implementation
uses UDM,Unitpageforpreson,Unitmakecharter;


{$R *.dfm}

procedure TF_sumdepartment.ToolButton4Click(Sender: TObject);
begin
  close;
end;

procedure TF_sumdepartment.ToolButton3Click(Sender: TObject);
begin
  if DM.qrypsw.RecordCount>0 then
  begin
  if dm.qrypsw.FieldByName('czydm').AsString<>'0001' then
  begin
  with dm.qrytemp do
  begin
    close;
    sql.Clear;
    sql.Add('delete from psw_ta');
    sql.Add('where czydm=:czydm');
    parameters.ParamByName('czydm').Value:=dm.qrypsw.fieldbyname('czydm').AsString;
    try
      execsql;
      except
      messagebox(handle,'删除数据失败!','系统提示',mb_iconinformation+mb_ok);
      exit;
    end;
  end;
  end
  else
  begin
   ShowMessage('贺师师不能被删除的，切忌！');
   Exit;
  end;
  end
  else
  begin
   ShowMessage('删除数据为空，不能进行删除！');
   Exit;
  end;
 dm.qrypsw.Close;
 dm.qrypsw.Open;
end;

procedure TF_sumdepartment.ToolButton1Click(Sender: TObject);
begin
  dm.qrypsw.Append;
  F_pageforpreson:=TF_pageforpreson.Create(self);
  F_pageforpreson.ShowModal;
  freeandnil(F_pageforpreson);
end;

procedure TF_sumdepartment.ToolButton2Click(Sender: TObject);
begin
  if dm.qrypsw.RecordCount>0 then
  begin
  F_makecharter:=TF_makecharter.Create(SELF);
  with F_makecharter do
  begin
   dbedt1.Text:=dm.qrypsw.FieldByName('czydm').AsString;
   dbedt2.Text:=dm.qrypsw.FieldByName('czyxm').AsString;
   dbedt3.Text:=dm.qrypsw.FieldByName('czykl').AsString;
  end;
  F_makecharter.ShowModal;
  freeandnil(F_makecharter);
  end
  else
  showmessage('数据信息不存在，无法修改!');
  exit;
end;

procedure TF_sumdepartment.FormShow(Sender: TObject);
begin
 with dm.qrypsw do
 begin
   Close;
   sql.Clear;
   sql.Add('select * from psw_ta');
   sql.Add('order by czydm');
   Prepared;
   Open;
 end;
end;

end.
