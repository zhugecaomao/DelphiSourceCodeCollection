unit PopedomCopy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmPopedomCopy = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPopedomCopy: TfrmPopedomCopy;

implementation

uses Dm;

{$R *.DFM}

procedure TfrmPopedomCopy.FormCreate(Sender: TObject);
begin
  with Data.Tmpl do
  begin
    Close;
    CommandText := 'select * from AppUserGroup ' +
      'where gName <> ''' + dm.Data.AppUserGroup.FieldByName('gName').AsString + '''';
    Open;
    while not Eof do
    Begin
      ComboBox1.Items.Add(FieldByName('gName').AsString);
      Next;
    end;
  end;
  self.Label3.Caption := self.Label3.Caption + '''' +
    Data.AppUserGroup.FieldByName('gName').AsString + '''Âð£¿';
end;

procedure TfrmPopedomCopy.ComboBox1Change(Sender: TObject);
begin
  btnOk.Enabled := ComboBox1.Text <> '';
end;

end.
