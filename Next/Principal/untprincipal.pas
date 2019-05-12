unit untPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls,
  ExtCtrls, TDIClass,
  //forms do sistema
  //Geral
  untBase, untEstado, untCidade, untCfop, untNcm ,
  //Segurança
  untGrupoPermissao
  ;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    Cadastros: TMenuItem;
    ImagensTDI: TImageList;
    ImagensPrincipal: TImageList;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MiCidades: TMenuItem;
    miEstados: TMenuItem;
    MenuPrincipal: TMainMenu;
    StatusBar1: TStatusBar;
    TdiPrincipal: TTDINoteBook;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MiCidadesClick(Sender: TObject);
    procedure miEstadosClick(Sender: TObject);
    procedure ToolBar1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.ToolButton1Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  halt(0);
end;

procedure TfrmPrincipal.MenuItem3Click(Sender: TObject);
begin
  TdiPrincipal.CreateFormInNewPage( TfrmCfop ,3 );
end;

procedure TfrmPrincipal.MenuItem4Click(Sender: TObject);
begin
  TdiPrincipal.CreateFormInNewPage( TfrmNcm ,3 );
end;

procedure TfrmPrincipal.MenuItem8Click(Sender: TObject);
begin
  TdiPrincipal.CreateFormInNewPage( TfrmGrupoPermissao ,3 );
end;

procedure TfrmPrincipal.MiCidadesClick(Sender: TObject);
begin
  TdiPrincipal.CreateFormInNewPage( TfrmCidade ,3 );
end;

procedure TfrmPrincipal.miEstadosClick(Sender: TObject);
begin
    TdiPrincipal.CreateFormInNewPage( TfrmEstado ,3 );
end;

procedure TfrmPrincipal.ToolBar1Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.ToolButton7Click(Sender: TObject);
begin
  Close;
end;

end.

