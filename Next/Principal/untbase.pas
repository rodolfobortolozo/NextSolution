unit untBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, EditBtn, IDEWindowIntf, uPSComponent;

type

  { TfrmBase }

  TfrmBase = class(TForm)
    ImagensFrmBase: TImageList;
    TsPrincipal: TPageControl;
    TsCadastro: TTabSheet;
    tsconsulta: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
  private

  public

  end;

var
  frmBase: TfrmBase;

implementation

{$R *.lfm}

{ TfrmBase }

procedure TfrmBase.ToolButton16Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  //Sempre inicializar pela de cadastro
  TsPrincipal.ActivePage:=TsCadastro;
end;

end.

