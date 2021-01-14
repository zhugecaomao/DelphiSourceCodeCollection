unit zyPrint;

interface

uses
    Forms, Windows, Adodb, Grids, DB, SysUtils, StrUtils;

type
    T_SetInit=procedure(App:TApplication;AModuleName:pchar;ADbType:Integer;ACn:TADOConnection); stdcall;
    T_AddGrid=procedure(AName:PChar;ARowCount:Integer;AColCount:Integer); stdcall;
    T_SetGridCells=procedure(AGridName:PChar;ACol:Integer;ARow:Integer;AValue:PChar); stdcall;
    T_Design=procedure(); stdcall;
    T_Print=procedure(ShowDialog:Boolean); stdcall;
    DllPrintState=(hpsDesign,hpsPreview,hpsPrint,hpsPrintNoDialog);  //打印方式(设计,预览,打印,直接打印)
    procedure CallDllPrint(DllPath:string;App:TApplication;AdoConn:TAdoConnection;Grid1,Grid2,Grid3,Grid4,Grid5,Grid6,Grid7:TStringGrid;Module:string;PrintState:DllPrintState);
    //函数说明:
    //1.AdoConn为nil时为默认为本地数据库(Access)
    //2.Grid现在为7个,可自行定义增加N个数据表格
    //3.Module为模块名称.



implementation

procedure CallDllPrint(DllPath:string;App:TApplication;AdoConn:TAdoConnection;Grid1,Grid2,Grid3,Grid4,Grid5,Grid6,Grid7:TStringGrid;Module:string;PrintState:DllPrintState);
var
  DllHandle: THandle;
  ProcAddr:  FarProc;
  SetInit: T_SetInit;
  AddGrid: T_AddGrid;
  SetGridCells: T_SetGridCells;
  Design: T_Design;
  Print: T_Print;
  i,j:Integer;
begin
    DllHandle := GetModuleHandle(pchar(DllPath));
    try
        if DllHandle=0 then
        begin
            DllHandle :=LoadLibrary(pchar(DllPath));
        end;
        if DllHandle<>0 then
        begin
            ProcAddr := GetProcAddress(DllHandle, 'SetInit');
            if ProcAddr <> nil then
            begin
                SetInit := ProcAddr;
                SetInit(App,PChar(Module),1,AdoConn);
            end
            else
                MessageBox(Application.Handle,pchar('动态链接库zyPrintcrt.dll内部错误!'),'提示',MB_OK+MB_ICONINFORMATION);
            ProcAddr := GetProcAddress(DllHandle, 'AddGrid');
            if ProcAddr <> nil then
            begin
                AddGrid := ProcAddr;
                if Grid1<>nil then AddGrid(PChar(Grid1.hint),Grid1.RowCount,Grid1.ColCount);
                if Grid2<>nil then AddGrid(PChar(Grid2.hint),Grid2.RowCount,Grid2.ColCount);
                if Grid3<>nil then AddGrid(PChar(Grid3.hint),Grid3.RowCount,Grid3.ColCount);
                if Grid4<>nil then AddGrid(PChar(Grid4.hint),Grid4.RowCount,Grid4.ColCount);
                if Grid5<>nil then AddGrid(PChar(Grid5.hint),Grid5.RowCount,Grid5.ColCount);
                if Grid6<>nil then AddGrid(PChar(Grid6.hint),Grid6.RowCount,Grid6.ColCount);
                if Grid7<>nil then AddGrid(PChar(Grid7.hint),Grid7.RowCount,Grid7.ColCount);
            end
            else
                MessageBox(Application.Handle,pchar('动态链接库zyPrintcrt.dll内部错误!'),'提示',MB_OK+MB_ICONINFORMATION);
            ProcAddr := GetProcAddress(DllHandle, 'SetGridCells');
            if ProcAddr <> nil then
            begin
                SetGridCells := ProcAddr;
                if Grid1<>nil then
                begin
                  for i:=0 to Grid1.RowCount-1 do
                    for j:=0 to Grid1.ColCount-1 do
                      SetGridCells(PChar(Grid1.hint),j,i,PChar(Grid1.Cells[j,i]));
                end;
                if Grid2<>nil then
                begin
                  for i:=0 to Grid2.RowCount-1 do
                    for j:=0 to Grid2.ColCount-1 do
                      SetGridCells(PChar(Grid2.hint),j,i,PChar(Grid2.Cells[j,i]));
                end;
                if Grid3<>nil then
                begin
                  for i:=0 to Grid3.RowCount-1 do
                    for j:=0 to Grid3.ColCount-1 do
                      SetGridCells(PChar(Grid3.hint),j,i,PChar(Grid3.Cells[j,i]));
                end;
                if Grid4<>nil then
                begin
                  for i:=0 to Grid4.RowCount-1 do
                    for j:=0 to Grid4.ColCount-1 do
                      SetGridCells(PChar(Grid4.hint),j,i,PChar(Grid4.Cells[j,i]));
                end;
                if Grid5<>nil then
                begin
                  for i:=0 to Grid5.RowCount-1 do
                    for j:=0 to Grid5.ColCount-1 do
                      SetGridCells(PChar(Grid5.hint),j,i,PChar(Grid5.Cells[j,i]));
                end;
                if Grid6<>nil then
                begin
                  for i:=0 to Grid6.RowCount-1 do
                    for j:=0 to Grid6.ColCount-1 do
                      SetGridCells(PChar(Grid6.hint),j,i,PChar(Grid6.Cells[j,i]));
                end;
                if Grid7<>nil then
                begin
                  for i:=0 to Grid7.RowCount-1 do
                    for j:=0 to Grid7.ColCount-1 do
                      SetGridCells(PChar(Grid7.hint),j,i,PChar(Grid7.Cells[j,i]));
                end;
            end
            else
                MessageBox(Application.Handle,pchar('动态链接库zyPrintcrt.dll内部错误!'),'提示',MB_OK+MB_ICONINFORMATION);
            case PrintState of
            hpsDesign:  ProcAddr := GetProcAddress(DllHandle, 'ShowDesign');
            hpsPreview: ProcAddr := GetProcAddress(DllHandle, 'ShowPreview');
            hpsPrint:   ProcAddr := GetProcAddress(DllHandle, 'ShowPrint');
            hpsPrintNoDialog:ProcAddr := GetProcAddress(DllHandle, 'ShowPrint');
            end;
            if ProcAddr <> nil then
            begin
                case PrintState of
                hpsDesign:  begin
                        Design := ProcAddr;
                        Design();
                    end;
                hpsPreview: begin
                        Design := ProcAddr;
                        Design();
                    end;
                hpsPrint:   begin
                        Print := ProcAddr;
                        Print(True);
                    end;
                hpsPrintNoDialog:begin
                        Print := ProcAddr;
                        Print(False);
                    end;
                end;
            end
            else
                MessageBox(Application.Handle,pchar('动态链接库zyPrintcrt.dll内部错误!'),'提示',MB_OK+MB_ICONINFORMATION);
        end
        else
            MessageBox(Application.Handle,pchar('装载动态链接库zyPrintcrt.dll时错误!'),'提示',MB_OK+MB_ICONINFORMATION);
    finally
        FreeLibrary(DllHandle);
    end;
end;

end.
