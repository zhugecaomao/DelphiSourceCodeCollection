unit Assistant;       //辅助资料管理窗体单元

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TF_Assis = class(TForm)
    DBGrid: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ButtonState(iState : integer);  //用户自定义工具条按钮状态设置过程
    { Public declarations }
  end;

var
  F_Assis: TF_Assis;

implementation

uses DataModule,DB;

{$R *.dfm}
procedure TF_Assis.ButtonState(iState : integer);
begin
  if iState = 0 then
  begin
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := true;
  end
  else
  begin
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := false;
    BitBtn4.Enabled := false;
  end;
end;

procedure TF_Assis.BitBtn1Click(Sender: TObject);
begin  {*****增加按钮单击事件*****}
    DM.AT_Assis.Append;    //进入追加记录状态
    ButtonState(0);
end;

procedure TF_Assis.BitBtn2Click(Sender: TObject);
begin  {*****删除按钮单击事件*****}
    if Application.MessageBox('真要删除选择的记录','确认对话框',mrOk) = mrOk then
      DM.AT_Assis.Delete;   //删除一条记录
end;

procedure TF_Assis.BitBtn3Click(Sender: TObject);
begin  {*****保存按钮单击事件*****}
    if (DM.DS_Assis.State = dsEdit) or (DM.DS_Assis.State = dsInsert) then
      DM.AT_Assis.Post;      //递交操作的数据集
    ButtonState(1);
end;

procedure TF_Assis.BitBtn4Click(Sender: TObject);
begin  {*****取消按钮单击事件*****}
    DM.AT_Assis.Cancel;      //取消回复到前一次递交的数据集
    ButtonState(1);    
end;

procedure TF_Assis.BitBtn5Click(Sender: TObject);
begin  {*****退出按钮单击事件*****}
    if DBGrid.DataSource.State in [dsInsert, dsEdit] then  //如果辅助资料数据表处于插入或者修改数据集状态时
      DBGrid.DataSource.DataSet.Cancel;  //取消数据集的操作 
    Close;                  //退出                   
end;

end.
