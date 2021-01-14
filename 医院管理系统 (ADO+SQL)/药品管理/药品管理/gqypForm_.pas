unit gqypForm_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, GanttCh, ExtCtrls, TeeProcs, Chart, DbChart,
  Grids, DBGrids, StdCtrls, Buttons;

type
  TFormgqyp = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn_gqypprint: TBitBtn;
    BitBtn_gqypdelete: TBitBtn;
    procedure BitBtn_gqypdeleteClick(Sender: TObject);
    procedure BitBtn_gqypprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formgqyp: TFormgqyp;

implementation

uses DMypgl_, GQYPBB_;

{$R *.dfm}

procedure TFormgqyp.BitBtn_gqypdeleteClick(Sender: TObject);
begin
 //判断过期药品中有无数据
   if DMypgl.ADOQypgq.RecordCount=0 then
     begin
      showmessage('没有数据可删除');
     end
    else
      begin
      //如果要过期药品点击消息框中的确定既删除
       DMypgl.ADOQypgq.Edit;
        if messagedlg('确定要删除吗？',mtconfirmation,[mbno,mbyes],2)=mryes then
         DMypgl.ADOQypgq.Delete;
                //更新数据集
                DMypgl.ADOTypgl.Close;
                DMypgl.ADOTypgl.Open;

                DMypgl.adotgys.Close;
                DMypgl.ADOTgys.Open;

                Dmypgl.ADOQypgq.Close;
                Dmypgl.ADOQypgq.Open;

                DMypgl.ADOQyp_xg_tj.Close;
                DMypgl.ADOQyp_xg_tj.Open;

                DMYpgl.ADOQgys.Close;
                DMypgl.adoqgys.Open;

                DMypgl.ADOTyp.Close;
                DMypgl.ADOTyp.Open;

                DMypgl.ADOTgys2.Close;
                DMypgl.ADOTgys2.Open;

                DMypgl.ADOQgys_modify.Close;
                DMypgl.ADOQgys_modify.Open;

                DMypgl.ADOQqhgys.Close;
                DMypgl.adoqqhgys.Open;
      end;
end;

procedure TFormgqyp.BitBtn_gqypprintClick(Sender: TObject);
begin
  Formgqypbb.QuickRep1.Preview;
end;

end.
