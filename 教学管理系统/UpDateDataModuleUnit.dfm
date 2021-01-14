object UpDateDataModule: TUpDateDataModule
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 420
  Width = 350
  object TeachersTable: TTable
    Active = True
    DatabaseName = 'ZJJ'
    TableName = 'Teacher.DB'
    Left = 56
    Top = 64
    object TeachersTableTNo: TStringField
      FieldName = 'TNo'
      Required = True
      Size = 8
    end
    object TeachersTableName: TStringField
      FieldName = 'Name'
      Size = 10
    end
    object TeachersTableSex: TStringField
      FieldName = 'Sex'
      Size = 2
    end
    object TeachersTableAge: TSmallintField
      FieldName = 'Age'
    end
    object TeachersTableAddress: TStringField
      FieldName = 'Address'
    end
  end
  object StudentsTable: TTable
    Active = True
    DatabaseName = 'ZJJ'
    TableName = 'Student.db'
    Left = 56
    Top = 136
    object StudentsTableSNo: TStringField
      FieldName = 'SNo'
      Required = True
      Size = 8
    end
    object StudentsTableName: TStringField
      FieldName = 'Name'
      Size = 10
    end
    object StudentsTableSex: TStringField
      FieldName = 'Sex'
      Size = 2
    end
    object StudentsTableAge: TSmallintField
      FieldName = 'Age'
    end
    object StudentsTableEntrance: TDateField
      FieldName = 'Entrance'
    end
  end
  object CourseTable: TTable
    Active = True
    DatabaseName = 'ZJJ'
    TableName = 'Course.db'
    Left = 56
    Top = 208
    object CourseTableCNo: TStringField
      FieldName = 'CNo'
      Required = True
      Size = 5
    end
    object CourseTableCName: TStringField
      FieldName = 'CName'
    end
    object CourseTableTCTime: TSmallintField
      FieldName = 'TCTime'
    end
  end
  object TeachingTable: TTable
    Active = True
    DatabaseName = 'ZJJ'
    TableName = 'Teaching.db'
    Left = 56
    Top = 280
    object TeachingTableCNo: TStringField
      FieldName = 'CNo'
      Size = 5
    end
    object TeachingTableTNo: TStringField
      FieldName = 'TNo'
      Size = 8
    end
    object TeachingTableSNo: TStringField
      FieldName = 'SNo'
      Size = 8
    end
    object TeachingTableGrade: TStringField
      FieldName = 'Grade'
      Size = 1
    end
  end
  object TeacherDataSource: TDataSource
    DataSet = TeachersTable
    Left = 208
    Top = 64
  end
  object StudentDataSource: TDataSource
    DataSet = StudentsTable
    Left = 208
    Top = 136
  end
  object CourseDataSource: TDataSource
    DataSet = CourseTable
    Left = 208
    Top = 208
  end
  object TeachingDataSource: TDataSource
    DataSet = TeachingTable
    Left = 208
    Top = 280
  end
end
