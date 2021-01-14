unit Kh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList, ComLbzl;

type
  TfrmKh = class(TfrmComLbzl)
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    procedure OpenDataSet;override;
		procedure LoadEditForm(strState:string);override;
    procedure aDelExecute(Sender: TObject);override;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKh: TfrmKh;

implementation

uses Dm, ComEdit, KhEdit;
{$R *.DFM}

procedure TfrmKh.OpenDataSet;
var
  strWhere: string;
begin
  //同时更新 frmHelp.FormShow
  dsJbzl.Close;
  case RadioGroup1.ItemIndex of
    0:   strWhere := 'where not K.ZT';
    1:   strWhere := 'where K.ZT';
    else strWhere := '';
  end;
  dsJbzl.CommandText :=
    'select K.*,D.MC as aDQMC, K.QMJE-K.YXJE as aSJJE ' +
    'from KH K inner join DQ D on K.DQID=D.ID ' + strWhere + ' ' +
    'order by K.BH';
  inherited;
end;

procedure TfrmKh.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmKhEdit.Create(self)) ;
	inherited;
end;

procedure TfrmKh.aDelExecute(Sender: TObject);
begin
  //同时更新 KhHelp.Del  (参考GYS.DEL)
  inherited;
end;

procedure TfrmKh.RadioGroup1Click(Sender: TObject);
begin
  OpenDataSet;
  DBGrid1.SetFocus;
end;

end.
