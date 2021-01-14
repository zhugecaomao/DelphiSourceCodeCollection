unit CompanyInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIGroupBox, SUIImagePanel,
  GridsEh, DBGridEh, StdCtrls, SUIButton, Mask, DBCtrls, DB, ADODB, jpeg,
  Grids, DBGrids, SUIDBCtrls, ShellAPI;

type
  TCompanyInfo_frm = class(TBaseFrm)
    suiImagePanel1: TsuiImagePanel;
    suiGroupBox1: TsuiGroupBox;
    btnadd: TsuiButton;
    btndel: TsuiButton;
    btnsave: TsuiButton;
    btnclose: TsuiButton;
    suiImagePanel2: TsuiImagePanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    suiImagePanel3: TsuiImagePanel;
    DataSource1: TDataSource;
    Query: TADOQuery;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    suiGroupBox2: TsuiGroupBox;
    suiGroupBox3: TsuiGroupBox;
    suiImagePanel4: TsuiImagePanel;
    suiImagePanel5: TsuiImagePanel;
    CompanyCachet: TImage;
    btnleadLogo: TsuiButton;
    suiButton6: TsuiButton;
    btnleadCachet: TsuiButton;
    suiButton8: TsuiButton;
    OpenDialog1: TOpenDialog;
    CompanyLogo: TImage;
    DBGrid1: TsuiDBGrid;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    btnOpenEmail: TsuiButton;
    btnOpenWeb: TsuiButton;
    procedure btnaddClick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnleadLogoClick(Sender: TObject);
    procedure suiButton6Click(Sender: TObject);
    procedure btnleadCachetClick(Sender: TObject);
    procedure suiButton8Click(Sender: TObject);
    procedure QueryBeforeEdit(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnOpenEmailClick(Sender: TObject);
    procedure btnOpenWebClick(Sender: TObject);
  private
    MaxRecID :string;
  public
    { Public declarations }
  end;

var
  CompanyInfo_frm: TCompanyInfo_frm;

implementation

uses DataModule, BasePage;

{$R *.dfm}

procedure TCompanyInfo_frm.btnaddClick(Sender: TObject);
begin
  inherited;
  Query.Append;
  CompanyLogo.Picture :=nil;
  CompanyCachet.Picture :=nil;
  Query.FieldByName('CompanyID').AsString :=Get_MaxTabID('CompanyInfo', 3);
  Set_MaxTabID('CompanyInfo');
  btnsave.Enabled :=true;

end;

procedure TCompanyInfo_frm.btndelClick(Sender: TObject);
begin
  inherited;
  Query.Delete;
end;

procedure TCompanyInfo_frm.btnsaveClick(Sender: TObject);
begin
  inherited;
  if Query.State in[dsedit, dsinsert] then
  begin
     Query.Post;
     btnsave.Enabled :=false;
  end;
end;

procedure TCompanyInfo_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  close();
end;

procedure TCompanyInfo_frm.FormShow(Sender: TObject);
var sqlstr:string;
begin
  inherited;
//
  try
    //CompanyLogo.Picture.LoadFromFile('image\Company.jpg');
    sqlstr :='select * from Companyinfo ';
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(sqlstr);
    Query.Open;
  except
  end;
end;

procedure TCompanyInfo_frm.btnleadLogoClick(Sender: TObject);
var filestr, filename,extname:string;
begin
  inherited;
//   lead logo
  if OpenDialog1.Execute then
  begin
    try
       extname :=LowerCase(ExtractFileExt(OpenDialog1.FileName));  //文件扩展名
       if pos(extname, '.jpg, .jpeg') >0 then
       begin
         filename :=query.fieldbyname('CompanyID').AsString + '_logo.jpg';
         {Jpg:=TJpegImage.Create;
         Jpg.LoadFromFile(imagename);
         Jpg.Free ; }
       end
       else
       begin
         //CompanyLogo.Picture.Bitmap.LoadFromFile(OpenDialog1.FileName);
         filename :=query.fieldbyname('CompanyID').AsString + '_logo.bmp';
       end;
       //btnsave.Enabled :=true;
       filestr :=SystemFilePath + 'Image\Company\' + filename;
       CompanyLogo.Picture.LoadFromFile(OpenDialog1.FileName);
       CompanyLogo.Picture.SaveToFile(filestr);
       CompanyLogo.Hint :=filename;
       Query.Edit;
       Query.FieldByName('CompanyLogo').AsString := CompanyLogo.Hint;
       Query.UpdateRecord;
    except
      on  ex : Exception do showmessage(ex.Message);
    end;
  end;
end;

procedure TCompanyInfo_frm.suiButton6Click(Sender: TObject);
begin
  inherited;
//
       CompanyLogo.Picture :=nil;
       CompanyLogo.Hint :='';
       Query.Edit;
       Query.FieldByName('CompanyLogo').AsString := CompanyLogo.Hint;
       Query.UpdateRecord;
end;

procedure TCompanyInfo_frm.btnleadCachetClick(Sender: TObject);
var filestr, filename, extname :string;
begin
  inherited;
//  lead Cachet
  if OpenDialog1.Execute then
  begin
    try
       extname :=LowerCase(ExtractFileExt(OpenDialog1.FileName));  //文件扩展名
       if pos(extname, '.jpg, .jpeg') >0 then
       begin
         filename :=query.fieldbyname('CompanyID').AsString + '_Cachet.jpg';
       end
       else
       begin
         filename :=query.fieldbyname('CompanyID').AsString + '_Cachet.bmp';
       end;
       filestr :=SystemFilePath + 'Image\Company\' + filename;
       CompanyCachet.Picture.LoadFromFile(OpenDialog1.FileName);
       CompanyCachet.Picture.SaveToFile(filestr);
       CompanyCachet.Hint :=filename;
       Query.Edit;
       Query.FieldByName('CompanyCachet').AsString := CompanyCachet.Hint;
       Query.UpdateRecord ;
    except
      on  ex : Exception do showmessage(ex.Message);
    end;
  end;

end;

procedure TCompanyInfo_frm.suiButton8Click(Sender: TObject);
begin
  inherited;
       CompanyCachet.Picture :=nil;
       CompanyCachet.Hint :='';
       Query.Edit;
       Query.FieldByName('CompanyCachet').AsString := CompanyCachet.Hint;
       Query.UpdateRecord;
end;

procedure TCompanyInfo_frm.QueryBeforeEdit(DataSet: TDataSet);
begin
  inherited;
//
  btnsave.Enabled :=true;
end;

procedure TCompanyInfo_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   Case Key of
    //VK_F9  : if btnadd.Enabled then  btnadd.Click;
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TCompanyInfo_frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Query.State in [dsEdit, dsinsert] then
  begin
     if application.MessageBox(pchar('是否保存当前数据'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
       Query.Post;

  end;
end;

procedure TCompanyInfo_frm.DBGrid1CellClick(Column: TColumn);
var filepath, filename:string;
begin
  inherited;
//

  with Query do
  begin
    try
      CompanyLogo.Picture :=nil;
      CompanyCachet.Picture :=nil;
      filename :=query.fieldbyname('CompanyLogo').AsString;
      if  filename <>'' then
      begin
         filepath :=SystemFilePath + 'Image\Company\' + filename;
         if fileexists(filepath) then
         begin
            CompanyLogo.Picture.LoadFromFile(filepath);
            CompanyLogo.Hint :=filename;
         end;
      end;
      filename :=query.fieldbyname('CompanyCachet').AsString;
      if  filename <>'' then
      begin
         filepath :=SystemFilePath + 'Image\Company\' + filename;
         if fileexists(filepath) then
         begin
            CompanyCachet.Picture.LoadFromFile(filepath);
            CompanyCachet.Hint :=filename;
         end;
      end;
    except
    end;
  end;
end;

procedure TCompanyInfo_frm.btnOpenEmailClick(Sender: TObject);
var emai:string;
begin
  inherited;
//
  if Query.Active then
  begin
    emai :='mailto:'+Query.FieldByName('Email').AsString;
    ShellExecute(handle,nil,pchar(emai),nil,nil,sw_shownormal);
  end;

end;

procedure TCompanyInfo_frm.btnOpenWebClick(Sender: TObject);
var web:string;
begin
  inherited;
//  打开WEB
  if Query.Active then
  begin
    web :=''+Query.FieldByName('webUrl').AsString;
    ShellExecute(handle,nil,pchar(web),nil,nil,sw_shownormal);
  end;

end;

end.
