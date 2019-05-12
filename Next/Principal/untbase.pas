unit untBase;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, EditBtn, DBCtrls, ZDataset, IDEWindowIntf, uPSComponent;

type

  { TfrmBase }

  TfrmBase = class(TForm)
    btnExcluir: TToolButton;
    DsPadrao: TDataSource;
    DScampoObrig: TDataSource;
    GbBase: TGroupBox;
    ImagensFrmBase: TImageList;
    btnPesquisar: TToolButton;
    QueryCampoObrig: TZReadOnlyQuery;
    QueryCampoObrigativo: TStringField;
    QueryCampoObrigdescricao: TStringField;
    QueryCampoObrigform: TStringField;
    QueryCampoObrigidaplicacao: TLongintField;
    QueryCampoObrigidaplicacao_1: TLongintField;
    QueryCampoObrigidcampoobrigatorio: TLongintField;
    QueryCampoObrigmensagem: TStringField;
    QueryCampoObrignomecampo: TStringField;
    QueryCampoObrigunit: TStringField;
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
    //PROCEDURE PADRAO PARA AIVAR OS BOTÕES
    procedure HabilitaControles();
    procedure AlterarCor();
    //Funcção pra verificar campo vazio
    procedure CamposObrigatorios();

  public


  end;

var
  frmBase  : TfrmBase;
  //Variavel Global para contagem
  contador : Integer;

implementation

{$R *.lfm}

{ TfrmBase }
procedure TfrmBase.ChangeEnter(Sender: TObject);
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

procedure TfrmBase.HabilitaControles();
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

procedure TfrmBase.AlterarCor();
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

procedure TfrmBase.CamposObrigatorios();
var
 i         : Integer;
 nomeForm  : String;
 nomeCampo : String;
 mensagem  : String;
begin
   contador:=0;
   //Verificar os Campos Obrigatórios
   QueryCampoObrig.Active:=True;
   QueryCampoObrig.Close;
   QueryCampoObrig.SQL.Clear;
   //Pego Nome do Form Aberto
   nomeForm:=UnitName ;
   QueryCampoObrig.SQL.Add('SELECT * FROM GE_Aplicacao a, GE_CampoObrigatorio c where a.IdAplicacao = c.IdAplicacao and Ativo=''S'' and a.Unit = '''+nomeForm+'''');
   QueryCampoObrig.Open;
   //Percorro pra ver os campos Obrigaórios
   for i:=0 to DsPadrao.DataSet.Fields.Count-1 do
   begin
     //ShowMessage('1'+DSPadrao.DataSet.Fields[i].FieldName);
     QueryCampoObrig.First;
     //Percorro os Campos Obrigatórios
     while not QueryCampoObrig.Eof do
       begin
           nomeCampo := QueryCampoObrig.FieldbyName('nomecampo').AsString;
           mensagem  := QueryCampoObrig.FieldbyName('mensagem').AsString;
                 if (DSPadrao.DataSet.Fields[i].AsString='')then
                 begin
                    if (DSPadrao.DataSet.Fields[i].FieldName=nomeCampo) then
                    begin
                      ShowMessage(mensagem);
                      Contador :=  Contador+1;
                      Exit;//Ja sai na primeira mensagem de campo obrigátorio
                    end;
                 end;
           QueryCampoObrig.Next;
       end;
   end;

   end;

procedure TfrmBase.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.FormCreate(Sender: TObject);
var
 i : Integer;
begin
  //Sempre inicializar pela de cadastro
   TsPrincipal.ActivePage:=TsCadastro;
  //AlterarCor()
   AlterarCor();
end;

procedure TfrmBase.btnNovoClick(Sender: TObject);
begin
    DSPadrao.DataSet.Insert;
    HabilitaControles;
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
  TsPrincipal.ActivePage:=TsCadastro;
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
       DSPadrao.DataSet.delete;
       DsPadrao.DataSet.Insert;
    End;
end;

procedure TfrmBase.btnInserirClick(Sender: TObject);
begin

          CamposObrigatorios();//Verifica os campos obrigatórios
          //senão retornar nenhum campo obrigatorio salva
          if(Contador =0) then
           begin
                DSPadrao.dataset.post;
                HabilitaControles;
           end;

end;

procedure TfrmBase.btnAnteriorClick(Sender: TObject);
begin
DSPadrao.dataset.prior;
end;

end.
