program PrjLazarus;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, tachartlazaruspkg, runtimetypeinfocontrols, pascalscript, zcomponent,
  untLogin, dmPrincipal, untBase, untPrincipal
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  //DataModule com a Conexão Padrao
  Application.CreateForm(TdmPostgres, dmPostgres);
  //
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

