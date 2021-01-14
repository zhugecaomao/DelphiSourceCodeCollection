object QueryDataModule: TQueryDataModule
  OldCreateOrder = False
  Left = 231
  Top = 126
  Height = 420
  Width = 360
  object DSStudents: TDataSource
    DataSet = StudentsQuery
    Left = 216
    Top = 56
  end
  object DSTeachers: TDataSource
    DataSet = TeachersQuery
    Left = 216
    Top = 136
  end
  object DSCourse: TDataSource
    DataSet = CourseQuery
    Left = 216
    Top = 208
  end
  object DSSpecial: TDataSource
    DataSet = SpecialQuery
    Left = 216
    Top = 280
  end
  object StudentsQuery: TQuery
    Active = True
    DatabaseName = 'ZJJ'
    SQL.Strings = (
      'SELECT SNo, Name, Sex, Age, Entrance'
      'FROM "Student.db" Student')
    Left = 72
    Top = 56
    object StudentsQuerySNo: TStringField
      FieldName = 'SNo'
      Origin = 'ZJJ."Student.DB".SNo'
      Size = 8
    end
    object StudentsQueryName: TStringField
      FieldName = 'Name'
      Origin = 'ZJJ."Student.DB".Name'
      Size = 10
    end
    object StudentsQuerySex: TStringField
      FieldName = 'Sex'
      Origin = 'ZJJ."Student.DB".Sex'
      Size = 2
    end
    object StudentsQueryAge: TSmallintField
      FieldName = 'Age'
      Origin = 'ZJJ."Student.DB".Age'
    end
    object StudentsQueryEntrance: TDateField
      FieldName = 'Entrance'
      Origin = 'ZJJ."Student.DB".Entrance'
    end
  end
  object TeachersQuery: TQuery
    Active = True
    DatabaseName = 'ZJJ'
    SQL.Strings = (
      'SELECT TNo, Name, Sex, Age, Address'
      'FROM "Teacher.DB" Teacher')
    Left = 72
    Top = 136
    object TeachersQueryTNo: TStringField
      FieldName = 'TNo'
      Origin = 'ZJJ."Teacher.DB".TNo'
      Size = 8
    end
    object TeachersQueryName: TStringField
      FieldName = 'Name'
      Origin = 'ZJJ."Teacher.DB".Name'
      Size = 10
    end
    object TeachersQuerySex: TStringField
      FieldName = 'Sex'
      Origin = 'ZJJ."Teacher.DB".Sex'
      Size = 2
    end
    object TeachersQueryAge: TSmallintField
      FieldName = 'Age'
      Origin = 'ZJJ."Teacher.DB".Age'
    end
    object TeachersQueryAddress: TStringField
      FieldName = 'Address'
      Origin = 'ZJJ."Teacher.DB".Address'
    end
  end
  object CourseQuery: TQuery
    Active = True
    DatabaseName = 'ZJJ'
    SQL.Strings = (
      'SELECT CNo, CName, TCTime'
      'FROM "Course.db" Course')
    Left = 72
    Top = 208
    object CourseQueryCNo: TStringField
      FieldName = 'CNo'
      Origin = 'ZJJ."Course.DB".CNo'
      Size = 5
    end
    object CourseQueryCName: TStringField
      FieldName = 'CName'
      Origin = 'ZJJ."Course.DB".CName'
    end
    object CourseQueryTCTime: TSmallintField
      FieldName = 'TCTime'
      Origin = 'ZJJ."Course.DB".TCTime'
    end
  end
  object SpecialQuery: TQuery
    DatabaseName = 'ZJJ'
    SQL.Strings = (
      'SELECT CNo, TNo, SNo, Grade'
      'FROM "Teaching.db" Teaching')
    Left = 72
    Top = 280
  end
end
