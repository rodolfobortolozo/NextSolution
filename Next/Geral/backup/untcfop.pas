unit untCfop;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBCtrls, ZDataset, untBase, db;

type

  { TfrmCfop }

  TfrmCfop = class(TfrmBase)
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    QueryCfops: TZQuery;
    QueryCfopscfop: TLongintField;
    QueryCfopscomunicaco: TStringField;
    QueryCfopsdescricao: TStringField;
    QueryCfopsdevolucao: TStringField;
    QueryCfopsnfe: TStringField;
    QueryCfopstransportadora: TStringField;
    txtCodigo: TLabel;
    txtIdCidade: TDBEdit;
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmCfop: TfrmCfop;

implementation

{$R *.lfm}

{ TfrmCfop }

procedure TfrmCfop.btnLimparClick(Sender: TObject);
begin
    inherited;
  //pra entrar no modo de inserção
  QueryCfops.Close;
  QueryCfops.SQL.Clear;
  QueryCfops.SQL.Add('SELECT * FROM GE_Cfop WHERE 0>0');
  QueryCfops.Open;
  DSPadrao.DataSet.Insert();
end;

procedure TfrmCfop.btnPesquisarClick(Sender: TObject);
var
sqlwhere : String;
i        : Integer;
begin
  //Where Padrão para Pesquisa
  sqlwhere := ' WHERE 0=0';
  //Monta sql de pesquisa
  for i:=0 to QueryCfops.Fields.Count-1 do
  begin                                               //Para inignorar o Lockup do Estado e Pais
    if (DSPadrao.DataSet.Fields[i].AsString<>'')then
        if (DSPadrao.DataSet.Fields[i].FieldName='cfop')then
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' ='''+
            DSPadrao.DataSet.Fields[i].AsString + ''''
        else
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' like'''+
            DSPadrao.DataSet.Fields[i].AsString + '%''';
    end;
   //Executa a pesquisa
  QueryCfops.Close;
  QueryCfops.SQL.Clear;
  QueryCfops.SQL.Add('SELECT * FROM GE_Cfop'+sqlwhere+' ORDER BY cfop ASC');
  QueryCfops.ExecSQL;
  QueryCfops.Open;
end;

procedure TfrmCfop.FormCreate(Sender: TObject);
begin
  inherited;
  //ativar a query pois da erro de
  //operation cannot be performed on an inactive data set se ela tiver ativa
  QueryCfops.Active:=True;
  //INICIAR O DS PARA PESQUISA
  QueryCfops.Close;
  QueryCfops.SQL.Clear;
  QueryCfops.SQL.Add('SELECT * FROM GE_Cfop WHERE 0>0');
  QueryCfops.Open;
  DSPadrao.DataSet.Insert();
end;

end.

