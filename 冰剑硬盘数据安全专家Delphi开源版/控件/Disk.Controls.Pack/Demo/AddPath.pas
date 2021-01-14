unit AddPath;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, dcInternal, dcBrowseDialog, dcEdits;

type
  TAddPathForm = class(TForm)
    GroupBox1: TGroupBox;
    IncludeCheck: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PathEdit: TdcFolderEdit;
    procedure PathEditDlgOk(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses dcUtils;

procedure TAddPathForm.PathEditDlgOk(Sender: TObject);
begin
  PathEdit.Text := IncludeTrailingBackslash(PathEdit.Text) + '*.*';
end;

end.
