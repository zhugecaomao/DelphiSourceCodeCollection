unit CallPrint;
interface
uses
  Windows,Controls, Forms,SysUtils,
  Dialogs,  DB, ADODB, ppEndUsr,  ppReport,
  ppDBPipe, ppTypes;
  procedure ReportDesigner(WinCtl:TWinControl;Ds_Data, Ds_Template: TDataSource;ReportName: String);
  procedure ReportPrint(WinCtl:TWinControl;Ds_Data, Ds_Template: TDataSource;ReportName: String);
implementation
procedure ReportDesigner(WinCtl:TWinControl;Ds_Data, Ds_Template: TDataSource;ReportName: String);
var
  pp_DBData,pp_DBTemplate:TppDBpipeline ;
  pp_Print:TppReport;
  pp_Designer:TppDesigner;
  Flag:Integer;
begin
  Flag:=0;
  pp_Print:=TppReport.Create(WinCtl);
  pp_DBData:=TppDBpipeline.Create(WinCtl);
  pp_DBTemplate:=TppDBpipeline.Create(WinCtl);
  pp_Designer:=TppDesigner.Create(WinCtl);
  try
    Ds_Template.DataSet.Close;
    Ds_Template.DataSet.Open;
    pp_DBData.DataSource :=Ds_Data;
    pp_DBData.UserName :='Data';
    pp_DBTemplate.DataSource:=Ds_Template;
    pp_DBTemplate.UserName:='Template';
    pp_DBData.AutoCreateFields:=true;
    pp_Print.Template.Format:=ftAscii;
    pp_Print.Template.SaveTo:=stDataBase;
    pp_Print.AllowPrintToArchive:=true;
    pp_Print.AllowPrintToFile:=true;
    pp_Print.Template.DatabaseSettings.DataPipeline:=pp_DBTemplate;
    pp_Print.Template.DatabaseSettings.NameField:=Ds_Template.DataSet.Fields[0].FieldName;
    pp_Print.Template.DatabaseSettings.TemplateField:=Ds_Template.DataSet.Fields[1].FieldName;
    pp_Print.Template.DatabaseSettings.Name:=ReportName;
    while not Ds_Template.DataSet.Eof do
    begin
      if Ds_Template.DataSet.FieldByName('Name').AsString=ReportName then
      begin
        Flag:=1;
        Break;
      end;
      Ds_Template.DataSet.Next;
    end;
    if Flag=0 then
    begin
      if MessageDlg('当前报表没有可用模板，是否创建?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
    end
    else
    pp_Print.Template.LoadFromDatabase;
    pp_Print.DataPipeline :=pp_DBData;
    pp_Designer.Caption:=pp_Print.Template.DatabaseSettings.Name;
    pp_Designer.AllowDataSettingsChange:=true;
    pp_Designer.AllowSaveToFile:=true;
    pp_Designer.DataSettings.AllowEditSQL:=true;
    //pp_Designer.DataSettings.DatabaseType:=dtMSSQLServer;
    pp_Designer.DataSettings.SQLType:=sqSQL1;
    pp_Designer.DataSettings.UseDataDictionary:=true;
    pp_Designer.ShowData:=True;
    pp_Designer.Report:=pp_Print;
    pp_Designer.ShowModal;
   // pp_Designer.Show;
  finally
    pp_Print.Free;
    pp_DBData.Free;
    pp_DBTemplate.Free;
    pp_Designer.Free;
  end;
end;
procedure ReportPrint(WinCtl:TWinControl;Ds_Data, Ds_Template: TDataSource;ReportName: String);
var
  pp_DBData,pp_DBTemplate:TppDBpipeline ;
  pp_Print:TppReport;
  Flag:Integer;
begin
  Flag:=0;
  pp_Print:=TppReport.Create(WinCtl);
  pp_DBData:=TppDBpipeline.Create(WinCtl);
  pp_DBTemplate:=TppDBpipeline.Create(WinCtl);
  try
    Ds_Template.DataSet.Close;
    Ds_Template.DataSet.Open;
    pp_DBData.DataSource :=Ds_Data;
    pp_DBData.UserName :='Data';
    pp_DBTemplate.DataSource:=Ds_Template;
    pp_DBTemplate.UserName:='Template';
    pp_DBData.AutoCreateFields:=true;
    pp_Print.Template.Format:=ftAscii;
    pp_Print.Template.SaveTo:=stDataBase;
    pp_Print.AllowPrintToArchive:=true;
    pp_Print.AllowPrintToFile:=true;
    pp_Print.Template.DatabaseSettings.DataPipeline:=pp_DBTemplate;
    pp_Print.Template.DatabaseSettings.NameField:=Ds_Template.DataSet.Fields[0].FieldName;
    pp_Print.Template.DatabaseSettings.TemplateField:=Ds_Template.DataSet.Fields[1].FieldName;
    pp_Print.Template.DatabaseSettings.Name:=ReportName;
    while not Ds_Template.DataSet.Eof do
    begin
      if Ds_Template.DataSet.FieldByName('Name').AsString=ReportName then
      begin
        Flag:=1;
        Break;
      end;
      Ds_Template.DataSet.Next;
    end;
    if Flag=0 then
    begin
      Application.MessageBox('当前报表没有可用模板，无法打印','提示',0+mb_iconinformation);
      Exit;
    end
    else
      pp_Print.Template.LoadFromDatabase;
    pp_Print.DataPipeline :=pp_DBData;
    pp_Print.Print;
  finally
    pp_Print.Free;
    pp_DBData.Free;
    pp_DBTemplate.Free;
  end;
end;
end.
