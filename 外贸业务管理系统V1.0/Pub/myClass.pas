unit myClass;

interface

uses
  SysUtils, Classes, Controls;

type
  TDepartment=class
    partyId:String;
    parentId:String;
    description:String;
  end;
  TPerson=class
    partyId:String;
    certNo:String;
    name:String;
    Gender:String;
    birthDate:TDate;
    maritalStatus:String;
    deptId:String;
    comments:String;
  end;
  TSecurityGroup=class
    groupId:Integer;
    parentId:Integer;
    description:String;
  end;
  TSecurityPermission=class
    permissionId:Integer;
    parentId:Integer;
    description:String;
  end;
  TUserLogin=class
    userLoginId:String;
    partyId:String;
    password:String;
    description:String;
    enabled:Boolean;
  end;

implementation

end.
