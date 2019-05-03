unit untBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, EditBtn, DBCtrls, IDEWindowIntf, uPSComponent;

type

  { TfrmBase }

  TfrmBase = class(TForm)
    btnExcluir: TToolButton;
    DsPadrao: TDataSource;
    GbBase: TGroupBox;
    ImagensFrmBase: TImageList;
    btnPesquisar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    TsConsulta: TTabSheet;
    ToolBar1: TToolBar;
    btnNovo: TToolButton;
    ToolButton10: TToolButton;
    btnProximo: TToolButton;
    btnAnterior: TToolButton;
    ToolButton13: TToolButton;
    btnRelatorio: TToolButton;
    ToolButton15: TToolButton;
    btnSair: TToolButton;
    btnLog: TToolButton;
    btnInserir: TToolButton;
    btnCancelar: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    btnPrimeiro: TToolButton;
    btnUltimo: TToolButton;
    btnLimpar: TToolButton;
    TsCadastro: TTabSheet;
    TsPrincipal: TPageControl;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure DsPadraoStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private

    //PROCEDURE PADRAO PARA ALTERAR COR
    procedure ChangeEnter(Sender: TObject);
    procedure ChangeExit(Sender: TObject);
    //botoes padrao ativar e desativar
    procedure HabilitaControles();

  public


  end;

var
  frmBase: TfrmBase;

implementation

{$R *.lfm}

{ TfrmBase }
procedure TfrmBase.ChangeEnter(Sender: TObject);
begin

  if Sender is TDBEdit then
    TDBEdit(Sender).Color := $00E6FED8
  else if Sender is TDBLookupComboBox then
    TDBLookupComboBox(Sender).Color := $00E6FED8
  else if Sender is TDBComboBox then
    TDBComboBox(Sender).Color := $00E6FED8
  else if Sender is TDBMemo then
    TDBMemo(Sender).Color := $00E6FED8;

end;

procedure TfrmBase.ChangeExit(Sender: TObject);
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

procedure TfrmBase.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.HabilitaControles();
begin
  if DSPadrao.DataSet.State in [dsInsert] then
    begin
     btnInserir.Enabled    :=False;
     btnPesquisar.Enabled   :=True;
     btnLimpar.Enabled        :=True;
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
     btnInserir.Enabled     :=False;
     btnPesquisar.Enabled   :=False;
     btnLimpar.Enabled      :=False;
     btnInserir.Enabled     :=False;
     btnExcluir.Enabled     :=True;
     btnPrimeiro.Enabled    :=True;
     btnAnterior.Enabled    :=True;
     btnProximo.Enabled     :=True;
     btnUltimo.Enabled      :=True;
     btnLimpar.Enabled      :=True;
    end else  if DSPadrao.DataSet.State in [dsEdit] then
    begin
     btnInserir.Enabled     :=True;
     btnPesquisar.Enabled   :=False;
     btnLimpar.Enabled      :=False;
     btnInserir.Enabled     :=True;
     btnExcluir.Enabled     :=False;
     btnPrimeiro.Enabled    :=False;
     btnAnterior.Enabled    :=False;
     btnProximo.Enabled     :=False;
     btnUltimo.Enabled      :=False;
     btnLimpar.Enabled      :=False;
    end

end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  //Sempre inicializar pela de cadastro
  TsPrincipal.ActivePage:=TsCadastro;
end;



procedure TfrmBase.btnNovoClick(Sender: TObject);
begin
    DSPadrao.DataSet.Insert;
    HabilitaControles;
end;

procedure TfrmBase.btnPesquisarClick(Sender: TObject);
begin

end;

procedure TfrmBase.btnPrimeiroClick(Sender: TObject);
begin
  DSPadrao.dataset.first;
end;

procedure TfrmBase.btnProximoClick(Sender: TObject);
begin
  DSPadrao.dataset.next;
end;

procedure TfrmBase.btnUltimoClick(Sender: TObject);
begin
  DSPadrao.dataset.last;
end;

procedure TfrmBase.DsPadraoStateChange(Sender: TObject);
begin
  HabilitaControles;
end;

procedure TfrmBase.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DSPadrao.DataSet.Close;
end;

procedure TfrmBase.btnCancelarClick(Sender: TObject);
begin
   with DSPadrao.DataSet do
    begin
      Cancel;
    end;
    HabilitaControles;
end;

procedure TfrmBase.btnExcluirClick(Sender: TObject);
begin
   if MessageDlg('Deseja Excluir o Registro', mtconfirmation, [mbYes, mbNo], 0)
    = mrYes then
    Begin
       DSPadrao.dataset.delete;
    End;
end;

procedure TfrmBase.btnInserirClick(Sender: TObject);
begin
      DSPadrao.dataset.post;
    HabilitaControles;
end;

procedure TfrmBase.btnAnteriorClick(Sender: TObject);
begin
  DSPadrao.dataset.prior;
end;

end.
