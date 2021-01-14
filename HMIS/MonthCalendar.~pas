unit MonthCalendar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TF_Date = class(TForm)
    MC_Date: TMonthCalendar;
    BB_Confirm: TBitBtn;
    BB_Cancel: TBitBtn;
    procedure MC_DateDblClick(Sender: TObject);
    procedure BB_ConfirmClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Date: TF_Date;

implementation

{$R *.dfm}

procedure TF_Date.MC_DateDblClick(Sender: TObject);
begin  {*****日期选择控件MonthCalendar双击事件*****}
    F_Date.Close;  //关闭日期选择窗口
    F_Date.ModalResult := mrOk; //表示用户确定选择的日期
end;

procedure TF_Date.BB_ConfirmClick(Sender: TObject);
begin  {*****确定按钮单击事件*****}
    F_Date.Close;  //关闭日期选择窗口
    F_Date.ModalResult := mrOk; //表示用户确定选择的日期
end;

procedure TF_Date.BB_CancelClick(Sender: TObject);
begin  {*****取消按钮单击事件*****}
    F_Date.Close;  //关闭日期选择窗口
    F_Date.ModalResult := mrCancel; //表示用户取消选择的日期
end;

end.
