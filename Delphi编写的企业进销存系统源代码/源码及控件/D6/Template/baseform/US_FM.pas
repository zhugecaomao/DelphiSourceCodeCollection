unit US_FM;

{ Standard Form :
  (1). Form Font 设为 宋体 9 号字
  (2). FormCreate - 初始化 Form 的位置及大小
  (3). FormClose - Action:=caFree;
 // (4). FormKeyDown - 控制 Tab 键经过 TDBGrid 或 TtsDBGrid 时, 不在内部循环
                     将 [F4] 设为 'TComboEdit', 'TRxDBComboEdit' 点击按钮的热键
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,TSDBGrid,dbgrids,
  StdCtrls, Db, ExtCtrls, DBCtrls, Grids, DBTables,comctrls, RXDBCtrl,
  Mask, ToolEdit, RxLookup;

type
  TS_Form = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  S_Form: TS_Form;

implementation

{$R *.DFM}

procedure TS_Form.FormCreate(Sender: TObject);
begin
  Top:=0; Left:=0; Width:=880; Height:=600;
end;

procedure TS_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TS_Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    vk_return :
      if not ((ActiveControl is ttsdbgrid) or (ActiveControl is tDBGrid)) then
      begin
        SelectNext(ActiveControl,True,True);
        key := 0;
      end;
    vk_F12 :
      if ((ActiveControl is TtsDBGrid) or (ActiveControl is TDBGrid)) then
      begin
        SelectNext(ActiveControl, not (ssShift in Shift) ,True);
        key := 0;
      end;
    vk_F4 :
      if (ActiveControl.ClassName='TComboEdit') then
        (ActiveControl as TComboEdit).Button.Click
      else
        if (ActiveControl.ClassName='TRxDBComboEdit') then
          (ActiveControl as TRxDBComboEdit).Button.Click;
  end;
end;

end.

