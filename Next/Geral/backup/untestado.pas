unit untEstado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBCtrls, DBGrids, ZDataset, ZSqlUpdate, untBase, db;

type

  { TfrmEstado }

  TfrmEstado = class(TfrmBase)
    txtIdEstado: TDBEdit;
    txtNomeEstado: TDBEdit;
    txtSigla: TDBEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QueryEstados: TZQuery;
    QueryEstadosidestado: TLongintField;
    QueryEstadosnomeestado: TStringField;
    QueryEstadossiglaestado: TStringField;
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmEstado: TfrmEstado;

implementation

{$R *.lfm}

{ TfrmEstado }

procedure TfrmEstado.FormCreate(Sender: TObject);
begin
  inherited;
    //ativar a query pois da erro de
  //operation cannot be performed on an inactive data set se ela tiver ativa
   queryestados.Active:=True;

   //INICIAR O DS PARA PESQUISA
  queryestados.Close;
  queryestados.SQL.Clear;
  queryestados.SQL.Add('SELECT * FROM GE_Estado WHERE 0>0');
  queryestados.Open;
  DSPadrao.DataSet.Insert();
end;

procedure TfrmEstado.btnLimparClick(Sender: TObject);
begin
  inherited;
  //pra entrar no modo de inserção
  queryestados.Close;
  queryestados.SQL.Clear;
  queryestados.SQL.Add('SELECT * FROM GE_Estado WHERE 0>0');
  queryestados.Open;
  DSPadrao.DataSet.Insert();
end;

procedure TfrmEstado.btnPesquisarClick(Sender: TObject);
  var
  sqlwhere : String;
  i        : Integer;
begin
  //Where Padrão para Pesquisa
  sqlwhere := ' WHERE 0=0';
  //Monta sql de pesquisa
  for i:=0 to QueryEstados.Fields.Count-1 do
  begin
    if (DSPadrao.DataSet.Fields[i].AsString<>'')then
        if (DSPadrao.DataSet.Fields[i].FieldName='idestado') then
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' ='''+
            DSPadrao.DataSet.Fields[i].AsString + ''''
        else
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' like'''+
            DSPadrao.DataSet.Fields[i].AsString + '%''';
    end;
   //Executa a pesquisa
  queryestados.Close;
  queryestados.SQL.Clear;
  queryestados.SQL.Add('SELECT * FROM GE_Estado'+sqlwhere+' ORDER BY IdEstado ASC');
  QueryEstados.ExecSQL;
  QueryEstados.Open;
end;
procedure TfrmEstado.btnCancelarClick(Sender: TObject);
begin
  inherited;
end;

procedure TfrmEstado.btnAnteriorClick(Sender: TObject);
begin
  inherited;
end;

procedure TfrmEstado.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
end;

procedure TfrmEstado.btnProximoClick(Sender: TObject);
begin
  inherited;
end;

procedure TfrmEstado.btnSairClick(Sender: TObject);
begin
  inherited;
end;

procedure TfrmEstado.btnUltimoClick(Sender: TObject);
begin
  inherited;
end;



end.

