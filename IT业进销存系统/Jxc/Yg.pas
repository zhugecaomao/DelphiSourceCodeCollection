unit Yg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComJbzl, Menus, StdCtrls, DBCtrls, ExtCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ActnList, ComLbzl;

type
  TfrmYg = class(TfrmComLbzl)
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
		procedure LoadEditForm(strState:string);override;
    procedure OpenDataSet;override;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmYg: TfrmYg;

implementation

uses Dm, ComEdit, YgEdit;
{$R *.DFM}

procedure TfrmYg.LoadEditForm(strState:string);
begin
	frmEdit := TfrmComEdit(TfrmYgEdit.Create(self)) ;
	inherited;
end;

procedure TfrmYg.OpenDataSet;
var
  strWhere: string;
begin
  dsJbzl.Close;
  case RadioGroup1.ItemIndex of
    0:   strWhere := 'where not Y.LZ';
    1:   strWhere := 'where Y.LZ';
    else strWhere := '';
  end;
  dsJbzl.CommandText := 
    'select Y.*, B.MC as aBMMC, L.MC as aYGLBMC, ' +
    'iif(YWYBZ, ''是'', ''否'') as aYWYBZ, ' +
    'switch(JSFF=1, ''月薪'', JSFF=2, ''计件'') as aJSFF, ' +
    'iif(LZ, ''是'', ''否'') as aLZ ' +
    'from YG Y, BM B, YGLB L, ' +
    'Y left join B on Y.BMID = B.ID, ' +
    'Y left join L on Y.YGLBID = L.ID ' + strWhere + ' ' +
    'order by BH';
  inherited;
end;

procedure TfrmYg.RadioGroup1Click(Sender: TObject);
begin
  OpenDataSet;
  DBGrid1.SetFocus;
end;

end.
