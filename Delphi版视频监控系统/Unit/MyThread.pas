Unit MyThread;

Interface

Uses
  Classes, SysUtils;

Type
  TFileManagerThread = Class(TThread)
  Private
    FStrings: TStrings;
  Public
    Constructor Create(CreateSuspended: Boolean; Strings: TStrings); Overload;
    Destructor Destroy; Override;
  Protected
    Procedure FindDir(Path: String; Var List: TStrings);
    Procedure Execute; Override;
  End;

Implementation

Uses
  Global;

Procedure TFileManagerThread.FindDir(Path: String; Var List: TStrings);
Var
  FindResult: Integer;
  FSearchrec: TSearchRec;
Begin
  FindResult := FindFirst(Path + '*.*', faDirectory, FSearchrec);
  Try
    While FindResult = 0 Do
    Begin
      If ((FSearchrec.Attr And faDirectory) = faDirectory)
        And (FSearchrec.Name <> '.') And (FSearchrec.Name <> '..') Then
        List.Add(Path + FSearchrec.Name);
      FindResult := FindNext(FSearchrec);
    End;
  Finally
    FindClose(FSearchrec);
  End;
End;

Procedure TFileManagerThread.Execute;
Var
  I, J: Integer;
  C: Char;
  S, Str, OldPath: String;
  cDay, OldDate: TDateTime;
  DirList: TStrings;
  NoClean: Boolean;
Begin
  NoClean := False;
  OldDate := Date;
  DirList := TStringList.Create;
  Try
    For I := 0 To FStrings.Count - 1 Do
    Begin
      C := FStrings[I][1];              //如果任一磁盘仍有一定空间，则不作清理工作
      If GetDiskFree(Ord(C)) > MinDiskSize + 600 Then
      Begin
        NoClean := True;
        Break;
      End;
      FindDir(FStrings[I], DirList);
    End;

    If NoClean = False Then
      If DirList.Count > 0 Then
      Begin
        For I := 0 To DirList.Count - 1 Do
        Begin
          Str := DirList[I];
          If Length(Str) > 8 Then
          Begin
            S := Copy(Str, Length(Str) - 7, 8);
            If (Length(S) = 8) And TryStrToInt(S, J) Then
            Begin                       //20080402 检查长度是否合格 是否数字类型
              Insert('-', S, 7);
              Insert('-', S, 5);
              If TryStrToDate(S, cDay) Then //检查文件夹名是否日期格式
                If cDay < OldDate Then
                Begin                   //取出列表中最旧日期的目录
                  OldDate := cDay;      //保存最旧日期
                  OldPath := Str;       //保存最旧日期的路径
                End;
            End;
          End;
        End;
        If OldDate <> Date Then
        Begin
          Deltree(OldPath, True, False); //删除最旧日期目录
          S := FormatDateTime('yyyymmdd', OldDate);
          For I := 0 To DirList.Count - 1 Do //再遍历所有录像目录与当前最旧日期的目录比较
            If Pos(S, DirList[I]) > 0 Then //如果仍有最旧日期的目录则删除
              Deltree(DirList[I], True, False);
        End;
      End;
  Finally
    DirList.Free;
  End;
End;

Constructor TFileManagerThread.Create(CreateSuspended: Boolean; Strings: TStrings);
Begin
  Inherited Create(CreateSuspended);
  FreeOnTerminate := True;
  FStrings := TStringList.Create;
  FStrings.Assign(Strings);
End;

Destructor TFileManagerThread.Destroy;
Begin
  FStrings.Free;
  Inherited;
End;
End.

