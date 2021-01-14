unit ufrmBeginWorkManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBeginWorkManageBase, dxExEdtr, DB, FR_DSet, FR_DBSet,
  FR_Class, ADODB, CSADOQuery, CSScrCtrlChild, dxEdLib, dxDBELib, dxCntner,
  dxEditor, CSCustomdxDateEdit, CSdxDBDateEdit, StdCtrls, Mask, DBCtrlsEh,
  DBCtrls, CSDBNavigator, CSdxDBNavigator, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, ComCtrls, Buttons, ExtCtrls;

type
  TfrmBeginWorkManage = class(TfrmBeginWorkManageBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBeginWorkManage: TfrmBeginWorkManage;

implementation

{$R *.dfm}

end.
