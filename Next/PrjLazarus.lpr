program PrjLazarus;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, tachartlazaruspkg, runtimetypeinfocontrols, pascalscript, zcomponent,
  untLogin, dmPrincipal, untBase, untPrincipal, untEstado;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmPostgres, dmPostgres);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmEstado, frmEstado);
  Application.Run;
end.

