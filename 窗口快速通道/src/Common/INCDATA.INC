const
  MSG_FINDWIN = WM_USER + 2416;
  MSG_REPOSITION = WM_USER + 2335;
  MSG_CLOSE = WM_USER + 2248;
  
type
  PReceiveStruct = ^TReceiveStruct;
  TReceiveStruct = record
    RecHandle: THandle;
    CurHandle: THandle;
  end;

