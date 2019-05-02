unit dmPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZPgEventAlerter, ZSqlMonitor, ZDataset,
  pqconnection, sqldb, untBase;

type

  { TdmPostgres }

  TdmPostgres = class(TDataModule)
    PgConexao: TZConnection;
    PgMonitor: TZSQLMonitor;
  private

  public

  end;

var
  dmPostgres: TdmPostgres;

implementation

{$R *.lfm}

end.

