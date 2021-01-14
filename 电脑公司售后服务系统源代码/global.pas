{********************************************************
*                                                       *
*   unit Name:Global                                    *
*   用途：1、可用于access数据的修复与压缩               *
*                                                       *
*                                                       *
*********************************************************}
unit global;

interface
  uses DB,ADODB,Sysutils,ComObj,Dialogs,variants;

var CheckReg: integer = 0 ;    //用来保存是否注册的信息.0表示未注册状态 1表示注册状态
    Tempinc,tempRegCode:string;  //用来保存注册公司名称 和 注册代码 

  function DaoActive(var DaoObject:OleVariant):Boolean;  //激活 DaoObject
  function DaoCompactDB(const FileName:string):Boolean;  //压缩数据库
  function DaoRepairDB(const FileName:string):Boolean;   //修复数据库

implementation

//激活 DaoObject
function DaoActive(var DaoObject:OleVariant):Boolean;
begin
  Result:=False;
{  try
    DaoObject:=GetActiveOleObject('DAO.DBEngine.36');
    Result:=True;
  except
    try    }
      DaoObject:=CreateOleObject('DAO.DBEngine.36');
      Result:=True;
{    except
      DaoObject:=Null;
    end;
  end; }
end;

//压缩Access数据库  本版暂进没有
function DaoCompactDB(const FileName:string):Boolean;
var
  db:OleVariant;
  TempFile:string;
begin
   Result:=False;
   try
     if not DaoActive(db) then Exit;
     try
       TempFile:=ExtractFilePath(FileName)+'msaTemp.mdb';
       db.CompactDatabase(FileName,TempFile);
       DeleteFile(FileName);
       RenameFile(TempFile,FileName);
       Result:=True;
     except
       on E:EOleException do ShowMessage(E.Message);
     end
   finally
     db:=Unassigned;
   end;
end;

//修复Access数据库     //本版本中没有使用本功能
function DaoRepairDB(const FileName:string):Boolean;
var
  db:OleVariant;
begin
  Result:=False;
  try
    if not DaoActive(db) then Exit;
    try
     db.RepairDatabase(FileName);
     Result:=True;
    except
      on E:EOleException do ShowMessage(E.Message);
    end
  finally
    db:=Unassigned;
  end;   
end;

end.
 