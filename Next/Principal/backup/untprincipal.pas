unit untPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ComCtrls;

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
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

end.

