unit uftpdown;

interface

uses
  Classes,Dialogs, SysUtils;

type
  ftpdown = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    public
    constructor Create;

  end;

implementation
 uses U_main;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,


    procedure ftpdown.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ ftpdown }

procedure ftpdown.Execute;
var i:integer;

begin
with frmain do begin
 ftp1.ChangeDir('\');
 try
 finally
 for i:=0 to ListView_files.Items.Count-1  do begin
  tsfile:=subsoft+'\'+ListView_files.Items.Item[i].Caption ;
   ListView_files.Items.Item[i].SubItems.Strings[1]:='正在更新';
   try
   BytesToTransfer :=FTP1.Size(tsfile);

   ftp1.Get(tsfile,g_path+subsoft+'\'+listView_files.Items.Item[i].Caption,true);

      
      ListView_files.Items.Item[i].SubItems.Strings[1]:='更新完成';
      ListView_files.Items.Item[i].ImageIndex:=1;
      except
       ListView_files.Items.Item[i].SubItems.Strings[1]:='更新失败';
       ListView_files.Items.Item[i].ImageIndex:=2;
      end;
       { Place thread code here }
end;
end;
ftpfinish;
end;
 Self.Terminate;
end;
constructor ftpdown.Create;
 begin
 FreeOnTerminate := True;
  inherited Create(False);
  Priority := tpLower;
end;
end.
