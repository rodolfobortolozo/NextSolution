unit untGrupoPermissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBCtrls, DBGrids, ZDataset, untBase, db;

type

  { TfrmGrupoPermissao }

  TfrmGrupoPermissao = class(TfrmBase)
    DBCheckBox1: TDBCheckBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    QueryGrupoPermissao: TZQuery;
    QueryGrupoPermissaoativo: TStringField;
    QueryGrupoPermissaodescricao: TStringField;
    QueryGrupoPermissaoidgrupopermissao: TLongintField;
    txtIdGrupoPermissao: TDBEdit;
    txtSigla: TDBEdit;
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmGrupoPermissao: TfrmGrupoPermissao;

implementation

{$R *.lfm}

{ TfrmGrupoPermissao }

procedure TfrmGrupoPermissao.btnLimparClick(Sender: TObject);
begin
   inherited;
  //pra entrar no modo de inserção
  QueryGrupoPermissao.Close;
  QueryGrupoPermissao.SQL.Clear;
  QueryGrupoPermissao.SQL.Add('SELECT * FROM SE_GrupoPermissao WHERE 0>0');
  QueryGrupoPermissao.Open;
  DSPadrao.DataSet.Insert();
end;

procedure TfrmGrupoPermissao.btnPesquisarClick(Sender: TObject);
var
sqlwhere : String;
i        : Integer;
begin
//Where Padrão para Pesquisa
sqlwhere := ' WHERE 0=0';
//Monta sql de pesquisa
for i:=0 to QueryGrupoPermissao.Fields.Count-1 do
begin
  if (DSPadrao.DataSet.Fields[i].AsString<>'')then
      if (DSPadrao.DataSet.Fields[i].FieldName='idgrupopermissao') then
          sqlwhere := sqlwhere +' AND '+
          DSPadrao.DataSet.Fields[i].FieldName+' ='''+
          DSPadrao.DataSet.Fields[i].AsString + ''''
      else
          sqlwhere := sqlwhere +' AND '+
          DSPadrao.DataSet.Fields[i].FieldName+' like'''+
          DSPadrao.DataSet.Fields[i].AsString + '%''';
  end;
 //Executa a pesquisa
QueryGrupoPermissao.Close;
QueryGrupoPermissao.SQL.Clear;
QueryGrupoPermissao.SQL.Add('SELECT * FROM SE_GrupoPermissao'+sqlwhere+' ORDER BY IdGrupoPermissao ASC');
QueryGrupoPermissao.ExecSQL;
QueryGrupoPermissao.Open;
end;

procedure TfrmGrupoPermissao.FormCreate(Sender: TObject);
begin
  inherited;
  //ativar a query pois da erro de
  //operation cannot be performed on an inactive data set se ela tiver ativa
  QueryGrupoPermissao.Active:=True;

  //INICIAR O DS PARA PESQUISA
  QueryGrupoPermissao.Close;
  QueryGrupoPermissao.SQL.Clear;
  QueryGrupoPermissao.SQL.Add('SELECT * FROM SE_GrupoPermissao WHERE 0>0');
  QueryGrupoPermissao.Open;
  DSPadrao.DataSet.Insert();
end;

end.

