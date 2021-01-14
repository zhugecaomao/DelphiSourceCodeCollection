unit C_YddRz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_YddBrow, DBTables, DB, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, DBCtrls, DBNavPlus, ExtCtrls;

type
  TYddRzForm = class(TYddBrowForm)
    btnRz: TBitBtn;
    procedure btnRzClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YddRzForm: TYddRzForm;

procedure YddRz;

implementation

uses C_Define;

{$R *.dfm}

procedure YddRz;
begin
  YddRzForm := TYddRzForm.Create(Application);
  try
    with YddRzForm do
    begin
      qryMaster.Open;
      ShowModal;
    end;
  finally
    YddRzForm.qryMaster.Close;
    YddRzForm.Free;
  end;

end;

procedure TYddRzForm.btnRzClick(Sender: TObject);
begin
  inherited;
{  if Confirm('你确定将该预定单入帐吗？') then
  begin
    //---------
    //添加帐单
    //---------
    with qryDetail do
    begin
      First;
      while not Eof do
      begin
        Edit;
        qryDetailD_RZ.Value := RZ_YES;
        Post;
        Next;
      end;
    end;
    with qryMaster do
    begin
      Edit;
      qryMasterD_RZ.Value := RZ_YES;
      Post;
    end;
  end;}
end;

end.
