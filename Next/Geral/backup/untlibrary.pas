unit untLibrary;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, EditBtn, DBCtrls, IDEWindowIntf, uPSComponent;

Type
  //PROCEDURE PADRAO PARA ALTERAR COR
  procedure AlterarCorCampo();
  procedure ChangeEnter(Sender: TObject);
  procedure ChangeExit(Sender: TObject);
  //PROCEDURE PARA HABILITAR BOTOES
  procedure HabilitaControles();

implementation

//ATERA COR DOS CAMPOS
procedure AlterarCorCampo();
var
 I: Integer;
begin
  //alterar cor dos campos
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
    begin
      TDBEdit(Components[I]).OnEnter  := @ChangeEnter;
      TDBEdit(Components[I]).OnExit   := @ChangeExit;
    end
    else
    if Components[I] is TDBLookupComboBox then
    begin
      TDBLookupComboBox(Components[I]).OnEnter := @ChangeEnter;
      TDBLookupComboBox(Components[I]).OnExit  := @ChangeExit;
    end
    else
    if Components[I] is TDBComboBox then
    begin
      TDBComboBox(Components[I]).OnEnter := @ChangeEnter;
      TDBComboBox(Components[I]).OnExit  := @ChangeExit;
    end
    else
    if Components[I] is TDBMemo then
    begin
      TDBMemo(Components[I]).OnEnter   := @ChangeEnter;
      TDBMemo(Components[I]).OnExit    := @ChangeExit;
    end
  end;
end;

procedure ChangeEnter(Sender: TObject);
begin

  if Sender is TDBEdit then
    TDBEdit(Sender).Color := $00FFDFEB
  else if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).Color := $00FFDFEB
  else if Sender is TDBComboBox then
    TDBComboBox(Sender).Color := $00FFDFEB
  else if Sender is TDBMemo then
    TDBMemo(Sender).Color := $00FFDFEB;
  //$00E6FED8 - Verde
end;

procedure ChangeExit(Sender: TObject);
begin
  if Sender is TDBEdit then
    TDBEdit(Sender).Color := clWindow
  else if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).Color := clWindow
  else if Sender is TDBComboBox then
    TDBComboBox(Sender).Color := clWindow
  else if Sender is TDBMemo then
    TDBMemo(Sender).Color := clWindow;
end;

procedure HabilitaControles();
begin
  if DSPadrao.DataSet.State in [dsInsert] then
    begin
     btnCancelar.Enabled    :=False;
     btnPesquisar.Enabled   :=True;
     btnNovo.Enabled        :=True;
     btnInserir.Enabled     :=True;
     btnExcluir.Enabled     :=False;
     btnPrimeiro.Enabled    :=False;
     btnAnterior.Enabled    :=False;
     btnProximo.Enabled     :=False;
     btnUltimo.Enabled      :=False;
     btnLimpar.Enabled      :=False;
    end
  else if (DSPadrao.DataSet.State in [dsBrowse]) then
    begin
     btnCancelar.Enabled    :=False;
     btnPesquisar.Enabled   :=False;
     btnNovo.Enabled        :=False;
     btnInserir.Enabled     :=False;
     btnExcluir.Enabled     :=True;
     btnPrimeiro.Enabled    :=True;
     btnAnterior.Enabled    :=True;
     btnProximo.Enabled     :=True;
     btnUltimo.Enabled      :=True;
     btnLimpar.Enabled      :=True;
    end else  if DSPadrao.DataSet.State in [dsEdit] then
    begin
     btnCancelar.Enabled    :=True;
     btnPesquisar.Enabled   :=False;
     btnNovo.Enabled        :=False;
     btnInserir.Enabled     :=True;
     btnExcluir.Enabled     :=False;
     btnPrimeiro.Enabled    :=False;
     btnAnterior.Enabled    :=False;
     btnProximo.Enabled     :=False;
     btnUltimo.Enabled      :=False;
     btnLimpar.Enabled      :=False;
    end

end;

end.

