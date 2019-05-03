unit untEstado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBCtrls, ZDataset, untBase, db;

type

  { TfrmEstado }

  TfrmEstado = class(TfrmBase)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QueryEstados: TZQuery;
    QueryEstadosidestado: TLongintField;
    QueryEstadosnomeestado: TStringField;
    QueryEstadossiglaestado: TStringField;
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmEstado: TfrmEstado;

implementation

{$R *.lfm}

{ TfrmEstado }

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
  i : Integer;
begin
  inherited;
    sqlwhere := ' WHERE 0=0';
  //monta sql para pesquisa
  for i:=0 to queryestados.Fields.Count-1 do
  begin
    if (DSPadrao.DataSet.Fields[i].AsString<>'')then
        if (DSPadrao.DataSet.Fields[i].FieldName='IdEstado') then
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' ='''+
            DSPadrao.DataSet.Fields[i].AsString + ''''
        else
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' like'''+
            DSPadrao.DataSet.Fields[i].AsString + '%''';
  end;
   //faz a pesquisa
  queryestados.Close;
  queryestados.SQL.Clear;
  queryestados.SQL.Add('SELECT * FROM GE_Estado'+sqlwhere+' ORDER BY IdEstado ASC');
  queryestados.Open;
end;

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

end.

