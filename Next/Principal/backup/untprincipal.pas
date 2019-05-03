unit untPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls,
  //forms do sistema
  untBase, untEstado
  ;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    Cadastros: TMenuItem;
    ImagensPrincipal: TImageList;
    MenuItem1: TMenuItem;
    MenuPrincipal: TMainMenu;
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
    procedure MenuItem1Click(Sender: TObject);
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
  frmBase.showmodal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  halt(0);
end;

procedure TfrmPrincipal.MenuItem1Click(Sender: TObject);
begin

end;

procedure TfrmPrincipal.ToolButton7Click(Sender: TObject);
begin
  Close;
end;

end.

