object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 198
  Width = 283
  object SQLConnection: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoadParamsOnConnect = True
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\Dev\Beaver\DATABASE.FDB'
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connected = True
    Left = 104
    Top = 48
  end
end
