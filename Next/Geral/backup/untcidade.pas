unit untCidade;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBCtrls, DBGrids, ZDataset, untBase, db;

type

  { TfrmCidade }

  TfrmCidade = class(TfrmBase)
    cbEstado: TDBLookupComboBox;
    cbPais: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    txtCodigo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    QueryCidades: TZQuery;
    QueryCidadescodigoibege: TLongintField;
    QueryCidadesidcidade: TLongintField;
    QueryCidadesidpais: TLongintField;
    QueryCidadesnomecidade: TStringField;
    QueryCidadessiglaestado: TStringField;
    QueryEstados: TZQuery;
    QueryPaises: TZQuery;
    QueryEstadosidestado: TLongintField;
    QueryEstadosnomeestado: TStringField;
    QueryEstadossiglaestado: TStringField;
    QueryPaisesidpais: TLongintField;
    QueryPaisesnomepais: TStringField;
    StringField1: TStringField;
    StringField2: TStringField;
    txtIdCidade: TDBEdit;
    txtIdCidade2: TDBEdit;
    txtIdCidade3: TDBEdit;
    txtNomeCidade: TDBEdit;
    txtIbege: TDBEdit;
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmCidade: TfrmCidade;

implementation

{$R *.lfm}

{ TfrmCidade }

procedure TfrmCidade.btnLimparClick(Sender: TObject);
begin
  inherited;
  //pra entrar no modo de inserção
  QueryCidades.Close;
  QueryCidades.SQL.Clear;
  QueryCidades.SQL.Add('SELECT * FROM GE_Cidade WHERE 0>0');
  QueryCidades.Open;
  DSPadrao.DataSet.Insert();
end;

procedure TfrmCidade.btnPesquisarClick(Sender: TObject);
var
sqlwhere : String;
i        : Integer;
begin
  //Where Padrão para Pesquisa
  sqlwhere := ' WHERE 0=0';
  //Monta sql de pesquisa
  for i:=0 to QueryCidades.Fields.Count-1 do
  begin                                               //Para inignorar o Lockup do Estado e Pais
    if (DSPadrao.DataSet.Fields[i].AsString<>'') and (DSPadrao.DataSet.Fields[i].FieldName<>'nomeestado') then
        if (DSPadrao.DataSet.Fields[i].FieldName='idcidade') and (DSPadrao.DataSet.Fields[i].FieldName='idpais') then
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' ='''+
            DSPadrao.DataSet.Fields[i].AsString + ''''
        else
            sqlwhere := sqlwhere +' AND '+
            DSPadrao.DataSet.Fields[i].FieldName+' like'''+
            DSPadrao.DataSet.Fields[i].AsString + '%''';
    end;
   //Executa a pesquisa
  QueryCidades.Close;
  QueryCidades.SQL.Clear;
  QueryCidades.SQL.Add('SELECT * FROM GE_Cidade'+sqlwhere+' ORDER BY IdCidade ASC');
  QueryCidades.ExecSQL;
  QueryCidades.Open;
end;

procedure TfrmCidade.btnRelatorioClick(Sender: TObject);
begin

end;

procedure TfrmCidade.FormCreate(Sender: TObject);
var
i        : Integer;
begin
   inherited;
  //ativar a query pois da erro de
  //operation cannot be performed on an inactive data set se ela tiver ativa
  QueryCidades.Active:=True;
  //INICIAR O DS PARA PESQUISA
  QueryCidades.Close;
  QueryCidades.SQL.Clear;
  QueryCidades.SQL.Add('SELECT * FROM GE_Cidade WHERE 0>0');
  QueryCidades.Open;
  DSPadrao.DataSet.Insert();
end;


end.

