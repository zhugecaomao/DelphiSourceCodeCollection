unit FlatEnrol;

interface

{$I FlatStyle.inc}

uses Classes;

procedure Register;

implementation

uses
  FlatBtns, FlatCtrls, FlatBars, FlatTabs, FlatBoxs, FlatWnd,
  FlatSound, FlatPanel, FlatGrids, FlatView, FlatCtrdb, FlatCode,
  FlatExcel;

procedure Register;
begin
  RegisterComponents ('FlatStyle Vcl', [TFlatButton, TFlatSpeedButton, TFlatRadioButton, TFlatCheckBox]);
  RegisterComponents ('FlatStyle Vcl', [TFlatEdit, TFlatIPEdit, TFlatMaskEdit, TFlatInteger, TFlatFloat]);
  RegisterComponents ('FlatStyle Vcl', [TFlatMemo, TFlatTreeView, TFlatListView, TFlatListBox, TFlatListBoxExt]);
  RegisterComponents ('FlatStyle Vcl', [TFlatCheckListBox, TFlatCheckListExt, TFlatComboBox, TFlatColorBox]);
  RegisterComponents ('FlatStyle Vcl', [TFlatBarcode, TFlatGroupBox, TFlatRadioGroup, TFlatPanel]);
  RegisterComponents ('FlatStyle Vcl', [TFlatLBPanel, TFlatGauge, TFlatImage, TFlatTab]);
  RegisterComponents ('FlatStyle Vcl', [TFlatDrawGrid, TFlatStringGrid, TFlatSplitter]);
  RegisterComponents ('FlatStyle Vcl', [TFlatScrollBar, TFlatTitleBar, TFlatProgressBar]);
  RegisterComponents ('FlatStyle Sys', [TFlatAnimWnd, TFlatSound, TFlatAnimation]);
  RegisterComponents ('FlatStyle Sys', [TFlatWater, TFlatHint, TFlatExcel]);
  RegisterComponents ('FlatStyle DB',  [TFlatDBEdit, TFlatDBMemo, TFlatDBListBox, TFlatDBMaskEdit]);
  RegisterComponents ('FlatStyle DB',  [TFlatDBFloat,TFlatDBInteger, TFlatDBComboBox, TFlatDBGrid]);
end;




end.
