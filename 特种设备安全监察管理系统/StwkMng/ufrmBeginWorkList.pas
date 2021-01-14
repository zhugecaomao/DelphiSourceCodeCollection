unit ufrmBeginWorkList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBeginWorkListBase, dxExEdtr, CSScrCtrlChild, CSBarMDIChild,
  CSGrdColCtrl, CSdxGrdColCtrl, CSADOFilter, CSADOdxGrdFilter, CSDBBase,
  CSDBFind, CSDBdxGrdFind, DB, ADODB, CSADOQuery, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, dxEditor, dxEdLib, StdCtrls, Buttons, ExtCtrls, CSRowCountPanel,
  CSdxDateEdit, CSCustomdxDateEdit, dxDBTLCl, dxGrClms;

type
  TfrmBeginWorkList = class(TfrmBeginWorkListBase)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    function prof_CreateManage: TForm; override;
  public
    { Public declarations }
  end;

var
  frmBeginWorkList: TfrmBeginWorkList;

implementation

uses
  DateUtils, CSVCLUtils, CSScrCtrlMaster, udmData, CommonLib,
  ufrmBeginWorkManage;

{$R *.dfm}

{ TfrmBeginWorkList }

procedure TfrmBeginWorkList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  
  frmBeginWorkList := nil;
end;

function TfrmBeginWorkList.prof_CreateManage: TForm;
begin
  Result := TfrmBeginWorkManage.Create(nil);
end;

end.
