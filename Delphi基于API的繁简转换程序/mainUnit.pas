unit mainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    mainADODataSet: TADODataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    Button8: TButton;
    mainbar: TProgressBar;
    SUBbar: TProgressBar;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    onlyBox: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
    uses imcode;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    with adoconnection1 do
    begin
      if connected  then   connected:=false;
      ConnectionString:=promptdatasource(handle,'');
      connected:=true;
      adoconnection1.GetTableNames(listbox1.Items);
      statusbar1.Panels.Items[1].Text:='Open Database: '+
              connectionstring;
    end;
  except
     showmessage('Do not connected!,Please Check connectionstring');
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j:integer;
    tmpv,tmp:string;
begin
  mainbar.Min:=0;
  mainbar.Max:=listbox1.Count;
  if not onlybox.Checked then
  for i := 0 to Listbox1.Count - 1 do
    begin
      with mainadodataset do
        begin
          if active then close;
          commandtext:='select * from '+listbox1.Items.Strings[i];
          open;
        end;
      statusbar1.Panels.Items[0].Text:='Open TableNmae: '+
        listbox1.Items.Strings[i];
       mainbar.Position:=mainbar.Position+1;
      subbar.Min:=0;
      subbar.Max:=mainadodataset.RecordCount;
      while not mainadodataset.Eof do
        begin
         for j := 0 to mainadodataset.FieldCount - 1 do
           begin
             if (mainadodataset.Fields[j].DataType in [ftstring,ftwidestring,
                 ftmemo]) and (trim(mainadodataset.Fields[j].AsString)<>'') then
               begin
                 try
                 tmpv:=mainadodataset.Fields[j].AsString;
//                 mainadodataset.Fields[j].FieldName
                 mainadodataset.Edit;
                 tmp:=GBToBig5(tmpv,LanguageType_Traditional);
                 if length(tmp)>length(tmpv) then
                   tmpv:=copy(tmp,1,length(tmpv));
                 mainadodataset.Fields[j].Value:=Tmpv;
                 mainadodataset.Post;
                 except
                   continue;
                 end;
               end;
           end;
           subbar.Position:=subbar.Position+1;
           mainadodataset.Next;
        end;
    end
    else
    begin
      with mainadodataset do
        begin
          if active then close;
          commandtext:='select * from '+listbox1.Items.strings[listbox1.ItemIndex];
          open;
        end;
      statusbar1.Panels.Items[0].Text:='Open TableNmae: '+
        listbox1.Items.Strings[listbox1.ItemIndex];
       mainbar.Position:=mainbar.Position+1;
      subbar.Min:=0;
      subbar.Max:=mainadodataset.RecordCount;
      while not mainadodataset.Eof do
        begin
         for j := 0 to mainadodataset.FieldCount - 1 do
           begin
             if (mainadodataset.Fields[j].DataType in [ftstring,ftwidestring,
                 ftmemo]) and (trim(mainadodataset.Fields[j].AsString)<>'') then
               begin
                 try
                 tmpv:=mainadodataset.Fields[j].AsString;
                 mainadodataset.Edit;
                 tmp:=GBToBig5(tmpv,LanguageType_Traditional);
                 if length(tmp)>length(tmpv) then
                  tmpv:=copy(tmp,1,length(tmpv));
                 mainadodataset.Fields[j].Value:=Tmpv;
                 mainadodataset.Post;
                 except
                   continue;
                 end;
               end;
           end;
           subbar.Position:=subbar.Position+1;
           mainadodataset.Next;
        end;
    end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  with mainadodataset do
    begin
      if active then close;
      commandtext:='select * from '+listbox1.Items.Strings[listbox1.ItemIndex];
      open;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j:integer;
    tmpv,tmp:string;
begin
  mainbar.Min:=0;
  mainbar.Max:=listbox1.Count;
  if not onlybox.Checked then
  for i := 0 to Listbox1.Count - 1 do
    begin
      with mainadodataset do
        begin
          if active then close;
          commandtext:='select * from '+listbox1.Items.Strings[i];
          open;
        end;
      statusbar1.Panels.Items[0].Text:='Open TableNmae: '+
        listbox1.Items.Strings[i];
      mainbar.Position:=mainbar.Position+1;
      subbar.Min:=0;
      subbar.Max:=mainadodataset.RecordCount;
      while not mainadodataset.Eof do
        begin
         for j := 0 to mainadodataset.FieldCount - 1 do
           begin
             if (mainadodataset.Fields[j].DataType in [ftstring,ftwidestring,
                 ftmemo]) and (trim(mainadodataset.Fields[j].AsString)<>'') then
               begin
                 try
                 tmpv:=mainadodataset.Fields[j].AsString;
                 mainadodataset.Edit;
                 tmp:=GBToBig5(tmpv,LanguageType_Traditional);
                 if length(tmp)>length(tmpv) then
                   tmpv:=copy(tmp,1,length(tmpv));
                 mainadodataset.Fields[j].Value:=tmpv;
                 mainadodataset.Post;
                 except
                   continue;
                 end;
               end;
           end;
           subbar.Position:=subbar.Position+1;
           mainadodataset.Next;
        end;
    end
    else
    begin
      with mainadodataset do
        begin
          if active then close;
          commandtext:='select * from '+listbox1.Items.Strings[listbox1.ItemIndex];
          open;
        end;
      statusbar1.Panels.Items[0].Text:='Open TableNmae: '+
        listbox1.Items.Strings[listbox1.ItemIndex];
      mainbar.Position:=mainbar.Position+1;
      subbar.Min:=0;
      subbar.Max:=mainadodataset.RecordCount;
      while not mainadodataset.Eof do
        begin
         for j := 0 to mainadodataset.FieldCount - 1 do
           begin
             if (mainadodataset.Fields[j].DataType in [ftstring,ftwidestring,
                 ftmemo]) and (trim(mainadodataset.Fields[j].AsString)<>'') then
               begin
                 try
                 tmpv:=trim(mainadodataset.Fields[j].AsString);
                 mainadodataset.Edit;
                 tmp:=GBToBig5(tmpv,LanguageType_Traditional);
                 if length(tmp)>length(tmpv) then
                    tmpv:=copy(tmp,1,length(tmpv));
                 mainadodataset.Fields[j].Value:=tmpv;
                 mainadodataset.Post;
                 except
                   continue;
                 end;
               end;
           end;
           subbar.Position:=subbar.Position+1;
           mainadodataset.Next;
        end;
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if opendialog1.Execute then
    begin
      memo1.Lines.LoadFromFile(opendialog1.FileName);
      statusbar1.Panels.Items[0].Text:='Open File: '+ opendialog1.FileName;
    end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Text:=GBToBig5(memo1.Text,LanguageType_Traditional);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   memo1.Text:=Big5ToGB(memo1.Text,LanguageType_Simplified);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
if savedialog1.Execute then
  begin
    memo1.Lines.SaveToFile(savedialog1.FileName);
    statusbar1.Panels.Items[1].Text:='Save File: '+ savedialog1.FileName;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  try
    close;
  except
    application.Terminate;
  end;
end;

end.
