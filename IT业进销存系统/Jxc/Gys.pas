unit Gys;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList, ComLbzl;

type
  TfrmGys = class(TfrmComLbzl)
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
  frmGys: TfrmGys;

implementation

uses Dm, ComEdit, GysEdit;
{$R *.DFM}

procedure TfrmGys.OpenDataSet;
var
  strWhere: string;
begin
  //同时更新 frmHelp.FormShow
  dsJbzl.Close;
  case RadioGroup1.ItemIndex of
    0:   strWhere := 'where not ZT';
    1:   strWhere := 'where ZT';
    else strWhere := '';
  end;
  dsJbzl.CommandText :=
    'select *,QMJE-YXJE as aSJJE ' +
    'from GYS ' + strWhere + ' ' +
    'order by BH';
  inherited;
end;

procedure TfrmGys.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmGysEdit.Create(self)) ;
	inherited;
end;

procedure TfrmGys.aDelExecute(Sender: TObject);
begin
  //同时更新 GysHelp
  strDetailTables := 'CGSHZB; CGDDZB; CGFKZB; CGTHZB';
  strDetailWheres := 'GYSID = [ID] and ID > 0; GYSID = [ID]';
  inherited;
end;

procedure TfrmGys.RadioGroup1Click(Sender: TObject);
begin
  OpenDataSet;
  DBGrid1.SetFocus;
end;

end.
