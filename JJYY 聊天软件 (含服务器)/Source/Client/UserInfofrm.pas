unit UserInfofrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RzForms, RzPanel, RzBckgnd, RzCmboBx, StdCtrls, RzEdit, Mask,
  RzLabel, RzButton;

type
  TfrmUserInfo = class(TForm)
    RzPanel1: TRzPanel;
    RzFormShape1: TRzFormShape;
    RzPanel2: TRzPanel;
    RzSeparator1: TRzSeparator;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    edName: TRzEdit;
    edRemark: TRzMemo;
    cbSex: TRzComboBox;
    UserImageList: TRzImageComboBox;
    RzLabel3: TRzLabel;
    edID: TRzEdit;
    RzShapeButton1: TRzShapeButton;
    procedure RzShapeButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
implementation

uses mainfrm;

{$R *.DFM}

procedure TfrmUserInfo.RzShapeButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmUserInfo.FormCreate(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to frmmain.ImageList3.Count -1 do
  begin
    UserImageList.AddItem('',i,0);
    UserImageList.ItemIndex :=0;
  end;
end;

procedure TfrmUserInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
