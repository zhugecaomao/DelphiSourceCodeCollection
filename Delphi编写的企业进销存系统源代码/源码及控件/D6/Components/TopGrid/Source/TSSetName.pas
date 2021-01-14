{*******************************************************}
{                                                       }
{       Top Support Visual Components                   }
{       TopGrid TtsImageList Editor SetName form        }
{                                                       }
{       Copyright (c) 1997 - 1999, Top Support          }
{                                                       }
{*******************************************************}

unit TSSetName;

interface

uses
      Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      StdCtrls, Buttons;

type
    TtsSetNameDlg = class(TForm)
        txtSetName: TEdit;
        Label1: TLabel;
        cmbSetNames: TComboBox;
        butCancel: TButton;
        butOK: TButton;
        procedure butOKClick(Sender: TObject);
        procedure txtSetNameKeyPress(Sender: TObject; var Key: Char);
        procedure FormShow(Sender: TObject);
        procedure txtSetNameChange(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    tsSetNameDlg: TtsSetNameDlg;

implementation

{$R *.DFM}

var
    OldSetName: string;

procedure TtsSetNameDlg.FormShow(Sender: TObject);
begin
    OldSetName := '';
    if txtSetName.Visible then
    begin
       butOK.Enabled := (txtSetName.Text <> '');
       OldSetName := txtSetName.Text;
    end;
end;

procedure TtsSetNameDlg.butOKClick(Sender: TObject);
begin
    ModalResult := mrOK;

    if txtSetName.Visible then
    begin
        if Pos('.', txtSetName.Text) > 0 then
        begin
           MessageDlg('The use of dots in setnames is not allowed.', mtError, [mbOk], 0);
           ModalResult := mrNone;
           txtSetName.SetFocus;
        end
        else
            if Trim(LowerCase(txtSetName.Text))='(main)' then
            begin
                MessageDlg('The setname ''(main)'' is not allowed, it is reserved for internal use.', mtError, [mbOk], 0);
                ModalResult:=mrNone;
                txtSetName.SetFocus;
            end
            else
                if (Trim(Lowercase(OldSetName)) <> Trim(Lowercase(txtSetName.Text))) and (cmbSetNames.Items.IndexOf(Trim(LowerCase(txtSetName.Text))) >= 0) then
                begin
                    MessageDlg('Setname ''' + txtSetName.Text + ''' already exists.', mtError, [mbOk], 0);
                    ModalResult:=mrNone;
                    txtSetName.SetFocus;
                end
                else
                    ModalResult:=mrOK;
    end;

end;

procedure TtsSetNameDlg.txtSetNameKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key=Chr(13)) And (txtSetName.Text<>'') then
    begin
        Key:=Chr(0);
        butOKClick(Sender);
    end;
end;

procedure TtsSetNameDlg.txtSetNameChange(Sender: TObject);
begin
    if txtSetName.Visible then
       butOK.Enabled:=(txtSetName.Text <> '');
end;

end.
