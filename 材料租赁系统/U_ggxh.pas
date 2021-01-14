unit U_ggxh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGridEh,ADODB, DB,
  ExtCtrls, DBSumLst;

type
  TfrmGgxh = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    edtTotal: TEdit;
    DBNavigator1: TDBNavigator;
    DBSumList1: TDBSumList;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure DBSumList1SumListChanged(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGgxh: TfrmGgxh;

implementation
     uses main,u_dm,u_public;
{$R *.dfm}

procedure TfrmGgxh.btnCancelClick(Sender: TObject);
begin
//dm.ADO_GGXHB.CancelUpdates;
DBSumList1.Activate(FALSE);
DBSumList1.Free ;
close;
end;

procedure TfrmGgxh.btnOkClick(Sender: TObject);
begin
//CurrentParam.sl:=strtofloat(dbedit4.Text);
//dm.ADO_GGXHB.FieldByName('total').AsFloat :=strtofloat(dbedit4.Text);
if dm.ADO_GGXHB.State = dsBrowse then
 dm.ADO_GGXHB.Edit ;
 dm.ADO_GGXHB.Post ;
close;
end;

procedure TfrmGgxh.DBSumList1SumListChanged(Sender: TObject);
begin
//edtTotal.Text := FloatToStr(DBSumList1.SumCollection.Items[0].SumValue);
CurrentParam.sl :=DBSumList1.SumCollection.Items[0].SumValue;
end;

procedure TfrmGgxh.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
if button=nbpost then
 begin
  dm.ADO_GGXHB.FieldByName('sfno').AsString :=CurrentParam.tmpCode;
  dm.ADO_GGXHB.FieldByName('fields').AsString :=CurrentParam.ggxh;
  dm.ADO_GGXHB.FieldByName('spbh').AsString :=CurrentParam.tmpName;
 end;
end;

procedure TfrmGgxh.FormCreate(Sender: TObject);
begin
DBSumList1.Activate(TRUE);
end;

end.
