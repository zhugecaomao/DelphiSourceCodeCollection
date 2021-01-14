unit drv_unit;
 interface
 type
   psingle = ^single;

 Function IC_InitComm(port:smallint):longint;stdcall;
 far;external 'Dcic32.dll' name 'IC_InitComm';
 Function IC_ExitComm(idComDev:longint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ExitComm';
 Function IC_Status(idComDev:longint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Status';
 Function IC_Down(idComDev:longint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Down';
 Function IC_InitType(idComDev:longint;ctype:smallint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_InitType';

 Function IC_ReadCount_SLE4442(idComDev:longint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ReadCount_SLE4442';
 Function IC_CheckPass_4442hex(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckPass_4442hex';
 Function IC_CheckPass_SLE4442(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckPass_SLE4442';
 Function IC_ChangePass_4442hex(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangePass_4442hex';
 Function IC_ChangePass_SLE4442(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangePass_SLE4442';
 Function IC_Read_Hex(idComDev:longint;offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Read_Hex';
 Function IC_Write_Hex(idComDev:longint;offset,len:smallint;writebuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Write_Hex';
 Function IC_Read(idComDev:longint;offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Read';
 Function IC_Write(idComDev:longint;offset,len:smallint;writebuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Write';
 Function IC_Write_Float(idComDev:longint;offset:smallint;fdata:single):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Write_Float';
 Function IC_Read_Float(idComDev:longint;offset:smallint;fdata:psingle):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Read_Float';

 Function IC_Write24(idComDev:longint;offset,len:smallint;writebuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Write24';
 Function IC_Write24_hex(idComDev:longint;offset,len:smallint;writebuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Write24_Hex';
  Function IC_Write64(idComDev:longint;offset,len:smallint;writebuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Write64';
 Function IC_Write64_hex(idComDev:longint;offset,len:smallint;writebuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Write64_Hex';

 Function IC_DirectRead(idComDev:longint;page,offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_DirectRead';
 Function IC_DirectWrite(idComDev:longint;page,offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_DirectWrite';
 Function IC_WriteByBuffer(idComDev:longint;page,offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_WriteByBuffer';
 Function IC_DirectRead_Hex(idComDev:longint;page,offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_DirectRead_Hex';
 Function IC_DirectWrite_Hex(idComDev:longint;page,offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_DirectWrite_Hex';
 Function IC_WriteByBuffer_Hex(idComDev:longint;page,offset,len:smallint;databuffer:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_WriteByBuffer_Hex';

 Function IC_CheckPass_102(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckPass_102';
 Function IC_ChangePass_102(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangePass_102';
 Function IC_CheckPass_102hex(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckPass_102hex';
 Function IC_ChangePass_102hex(idComDev:longint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangePass_102hex';
  Function IC_ReadCount_102(idComDev:longint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ReadCount_102';
 Function IC_CheckAZPass_102(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckAZPass_102';
 Function IC_ChangeAZPass_102(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangeAZPass_102';
 Function IC_CheckAZPass_102hex(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckAZPass_102hex';
 Function IC_ChangeAZPass_102hex(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangeAZPass_102hex';
 Function IC_Erase_102(idComDev:longint;zone,offset,len:smallint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Erase_102';
 Function IC_Fuse_102(idComDev:longint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Fuse_102';


 Function IC_CheckPass_1604(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckPass_1604';
 Function IC_ChangePass_1604(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangePass_1604';
 Function IC_CheckPass_1604hex(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_CheckPass_1604hex';
 Function IC_ChangePass_1604hex(idComDev:longint;zone:smallint;password:pchar):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ChangePass_1604hex';
 Function IC_ReadCount_1604(idComDev:longint;zone:smallint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_ReadCount_1604';
 Function IC_Fuse_1604(idComDev:longint):smallint;stdcall;
 far;external 'Dcic32.dll' name 'IC_Fuse_1604';








 implementation

end.