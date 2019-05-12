unit untNcm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Buttons, DBGrids, DBCtrls, DBExtCtrls, ZDataset, untBase, db;

type

  { TfrmNcm }

  TfrmNcm = class(TfrmBase)
    DBCheckBox1: TDBCheckBox;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    QueryNcms: TZQuery;
    QueryNcmsativo: TStringField;
    QueryNcmschave: TStringField;
    QueryNcmsdescricao: TStringField;
    QueryNcmsex: TLongintField;
    QueryNcmsfonte: TStringField;
    QueryNcmsidncm: TLongintField;
    QueryNcmsimpestadual: TFloatField;
    QueryNcmsimpfederal: TFloatField;
    QueryNcmsimpimportados: TFloatField;
    QueryNcmsimpmunicipal: TFloatField;
    QueryNcmsncm: TLongintField;
    QueryNcmssilglaestado: TStringField;
    QueryNcmstipo: TLongintField;
    QueryNcmsversao: TStringField;
    QueryNcmsvigenciafinal: TDateField;
    QueryNcmsvigenciainicio: TDateField;
    txtIdEstado: TDBEdit;
    txtSigla: TDBEdit;
    txtSigla1: TDBEdit;
    txtSigla2: TDBEdit;
    txtSigla3: TDBEdit;
    txtSigla4: TDBEdit;
    txtSigla5: TDBEdit;
    txtSigla6: TDBEdit;
    txtSigla7: TDBEdit;
    txtSigla8: TDBEdit;
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmNcm: TfrmNcm;

implementation

{$R *.lfm}

{ TfrmNcm }

procedure TfrmNcm.btnLimparClick(Sender: TObject);
begin
   inherited;
  //pra entrar no modo de inserção
  QueryNcms.Close;
  QueryNcms.SQL.Clear;
  QueryNcms.SQL.Add('SELECT * FROM GE_Ncm WHERE 0>0');
  QueryNcms.Open;
  DSPadrao.DataSet.Insert();
end;

procedure TfrmNcm.btnPesquisarClick(Sender: TObject);
var
sqlwhere : String;
i        : Integer;
begin
//Where Padrão para Pesquisa
sqlwhere := ' WHERE 0=0';
//Monta sql de pesquisa
for i:=0 to QueryNcms.Fields.Count-1 do
begin
  if (DSPadrao.DataSet.Fields[i].AsString<>'')then
      if (DSPadrao.DataSet.Fields[i].FieldName='idncm') then
          sqlwhere := sqlwhere +' AND '+
          DSPadrao.DataSet.Fields[i].FieldName+' ='''+
          DSPadrao.DataSet.Fields[i].AsString + ''''
      else
          sqlwhere := sqlwhere +' AND '+
          DSPadrao.DataSet.Fields[i].FieldName+' like'''+
          DSPadrao.DataSet.Fields[i].AsString + '%''';
  end;
 //Executa a pesquisa
QueryNcms.Close;
QueryNcms.SQL.Clear;
QueryNcms.SQL.Add('SELECT * FROM GE_Ncm'+sqlwhere+' ORDER BY IdNcm ASC');
QueryNcms.ExecSQL;
QueryNcms.Open;
end;

procedure TfrmNcm.FormCreate(Sender: TObject);
Begin
 inherited;
 //ativar a query pois da erro de
 //operation cannot be performed on an inactive data set se ela tiver ativa
 QueryNcms.Active:=True;

 //INICIAR O DS PARA PESQUISA
 QueryNcms.Close;
 QueryNcms.SQL.Clear;
 QueryNcms.SQL.Add('SELECT * FROM GE_Ncm WHERE 0>0');
 QueryNcms.Open;
 DSPadrao.DataSet.Insert();
end;

end.

