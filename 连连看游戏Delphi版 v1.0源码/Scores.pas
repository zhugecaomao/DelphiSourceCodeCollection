unit Scores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFileHead = record
    Name,version,Author: string[10];
  end;
  TScores = record
    Name: string[50];
    Scores: integer;
  end;


  TfmScores = class(TForm)
    ListView1: TListView;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  fmScores: TfmScores;
  FileHead: TFileHead;
  procedure ShowScores(AShowForm: boolean= true;AScores: integer=-1);
implementation

{$R *.dfm}
  procedure ShowScores(AShowForm: boolean= true;AScores: integer=-1);
  var
    FileStream: TFileStream;
    FileName: string;
    AFileHead: TFileHead;
    Arrange: array[1..10] of TScores;
    temScores: TScores;
    i,Aindex,j,inii,i1: integer;
    procedure showform;
    var
      i: integer;
    begin
      fmScores := TfmScores.Create(nil);
      try
        fmScores.ListView1.Items.Clear;
        for i := low(Arrange) to high(Arrange) do
        begin
          //FileStream.Read(Arrange[i],sizeof(TScores));
          fmScores.ListView1.AddItem(inttostr(i),fmScores.ListView1);
          fmScores.ListView1.Items[i-1].SubItems.Add(Arrange[i].Name);
          fmScores.ListView1.Items[i-1].SubItems.Add(inttostr(Arrange[i].Scores));
        end;

        fmScores.ShowModal;
      finally
        fmScores.Free;
      end;
    end;
  begin
  try
    for i := low(Arrange) to high(Arrange) do
    begin
      Arrange[i].Name := '';
      Arrange[i].Scores := 0;
    end;
    Aindex := 0;

    FileHead.Name := '连连看';
    FileHead.version := 'V2.0';
    FileHead.Author := 'kongxj';
    FileName := ExtractfilePath(Application.Name)+'Scores.kxj';
    if FileExists(FileName) then
    begin
      FileStream := TFileStream.Create(FileName,fmOpenReadWrite);
      FileStream.Seek(0,0);
      FileStream.Read(AFileHead,sizeof(TFileHead));
      if AFileHead.Name <> FileHead.Name then
      begin
        FileStream.Seek(0,0);
        FileStream.Write(AFileHead,sizeof(TFileHead));
        for i := low(Arrange) to high(Arrange) do
        begin
          temScores.Name := Arrange[i].Name;
          temScores.Scores := Arrange[i].Scores;
          FileStream.Write(temScores,sizeof(TScores));
        end;
      end
      else
      begin
        for i := low(Arrange) to high(Arrange) do
        begin
          FileStream.Read(temScores,sizeof(TScores));
          Arrange[i].Name := temScores.Name;
          Arrange[i].Scores := temScores.Scores;
        end;
        if AShowForm then
        begin
          if AScores = -1 then
          begin
            showform;
          end
          else
          begin
            for i := low(Arrange) to high(Arrange) do
            begin
              if AScores >= Arrange[i].Scores then
              begin
                Aindex := i;
                if AScores > Arrange[i].Scores then
                  inii := 1
                else
                  inii :=2;
                for j := high(Arrange) downto i+inii  do
                begin
                  if j > low(Arrange) then
                  begin
                    Arrange[j].Name := Arrange[j-1].Name;
                    Arrange[j].Scores := Arrange[j-1].Scores;
                  end;
                end;
                Arrange[i].Name := InputBox('第'+inttostr(i)+'名', '请输入名称:', 'Default User');
                Arrange[i].Scores := AScores;
                FileStream.Seek(0,0);
                FileStream.Seek(sizeof(TFileHead),0);
                if Aindex <> 0 then
                for i1 := low(Arrange) to high(Arrange) do
                begin
                  temScores.Name := Arrange[i1].Name;
                  temScores.Scores := Arrange[i1].Scores;

                  FileStream.Write(temScores,sizeof(TScores));
                end;
                showform;
                break;
              end;
            end;
          end;
        end;
      end;
    end
    else
    begin
      FileStream := TFileStream.Create(FileName,fmCreate);
      FileStream.Write(FileHead,sizeof(TFileHead));
      FileStream.Seek(0,0);
      FileStream.Seek(sizeof(TFileHead),0);
      for i := low(Arrange) to high(Arrange) do
      begin
        temScores.Name := Arrange[i].Name;
        temScores.Scores := Arrange[i].Scores;
        FileStream.Write(temScores,sizeof(TScores));
      end;
    end;
    finally
    FileStream.Free;
    end;
  end;
initialization
  ShowScores(false);
end.
