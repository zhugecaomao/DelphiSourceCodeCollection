inherited frmBeginWorkManage: TfrmBeginWorkManage
  Caption = #24320#24037#21578#30693
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel2: TPanel
    inherited PageControl1: TPageControl
      inherited TabSheet1: TTabSheet
        inherited grdDeviceDetail: TdxDBGrid
          Filter.Criteria = {00000000}
        end
        inherited Panel4: TPanel
          inherited Panel5: TPanel
            inherited navDeviceDetail: TCSdxDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited TabSheet4: TTabSheet
        inherited grdPersonDetail: TdxDBGrid
          Filter.Criteria = {00000000}
        end
        inherited Panel7: TPanel
          inherited Panel8: TPanel
            inherited navPersonDetail: TCSdxDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited TabSheet3: TTabSheet
        inherited grdConstDetail: TdxDBGrid
          Filter.Criteria = {00000000}
        end
        inherited Panel9: TPanel
          inherited Panel10: TPanel
            inherited navConstDetail: TCSdxDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited TabSheet7: TTabSheet
        inherited grdBuildDetail: TdxDBGrid
          Filter.Criteria = {00000000}
        end
        inherited Panel11: TPanel
          inherited Panel12: TPanel
            inherited navBuildDetail: TCSdxDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited TabSheet8: TTabSheet
        inherited grdSuprDetail: TdxDBGrid
          Filter.Criteria = {00000000}
        end
        inherited Panel13: TPanel
          inherited Panel14: TPanel
            inherited navSuprDetail: TCSdxDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited TabSheet9: TTabSheet
        inherited grdDocDetail: TdxDBGrid
          Filter.Criteria = {00000000}
        end
        inherited Panel15: TPanel
          inherited Panel16: TPanel
            inherited navDocDetail: TCSdxDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
    end
  end
  inherited Panel6: TPanel
    inherited pagGeneralInfo: TPageControl
      inherited TabSheet2: TTabSheet
        inherited ScrollBox1: TScrollBox
          inherited GroupBox3: TGroupBox
            inherited deContractDate: TCSdxDBDateEdit
              StoredValues = 5
            end
            inherited deStartDate: TCSdxDBDateEdit
              StoredValues = 4
            end
            inherited deEndDate: TCSdxDBDateEdit
              StoredValues = 4
            end
          end
          inherited mRemark: TdxDBMemo
            Height = 50
          end
          inherited deAppraiseDate: TCSdxDBDateEdit
            StoredValues = 4
          end
        end
      end
      inherited TabSheet5: TTabSheet
        inherited GroupBox4: TGroupBox
          inherited deConstLicsDate: TCSdxDBDateEdit
            StoredValues = 4
          end
        end
      end
      inherited TabSheet6: TTabSheet
        inherited GroupBox2: TGroupBox
          inherited mIdeaContent: TdxDBMemo
            Height = 80
          end
          inherited deNoticeDate: TCSdxDBDateEdit
            StoredValues = 4
          end
        end
      end
    end
  end
  inherited frBeginWork: TfrReport
    ReportForm = {18000000}
  end
end
