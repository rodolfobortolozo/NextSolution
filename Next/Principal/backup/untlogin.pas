unit untLogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ComCtrls, ExtCtrls, RTTICtrls, ZDataset,
  //Dm de Conexao Principal
  dmPrincipal, db, untPrincipal;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBComboBox1: TDBComboBox;
    DsEmpresa: TDataSource;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PgQueryEmpresa: TZReadOnlyQuery;
    PgQueryEmpresaidempresa: TLongintField;
    PgQueryEmpresanomeresumido: TStringField;
    txthost: TComboBox;
    txtlogin: TEdit;
    txtsenha: TEdit;
    gbLogin: TGroupBox;
    PgQueryLogin: TZReadOnlyQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  Nome : string;

  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.Button2Click(Sender: TObject);
begin
  close();
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  PgQueryLogin.Close;
  PgQueryLogin.ParamByName('login').Value:=(txtlogin.Text);
  PgQueryLogin.ParamByName('senha').Value:=(txtsenha.Text);
  PgQueryLogin.Open;

  if PgQueryLogin.IsEmpty then
  begin
    MessageDlg('Usuário ou senha incorretos!', mtError, [mbYes, mbNo], 0)
    txtlogin.SetFocus();
    //ShowMessage('A senha está incorreta!');
  end
  else
  begin
    frmPrincipal.ShowModal;
    frmLogin.Hide;
    //ShowMessage('OK');
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
//pega os dados da conexão no xml
var
  _Nome      : String;
  _Host      : String;
  _Porta     : Integer;
  _User      : String;
  _Senha     : String;
  _Catalog   : String;
  _Database  : String;
  _LocalLib  : String;
  _ConPadrao : String;
  _EmpPadrao : Integer;
begin
  _Nome      :='Padrao';
  _Host      :='Localhost';
  _Porta     :=5432;
  _User      :='postgres';
  _Senha     :='D@taS0fT';
  _Catalog   :='public';
  _Database  :='datasoft';
  _LocalLib  :='C:\Users\Rodolfo\Desktop\DLL\libpq.dll';
  _ConPadrao :='S';
  _EmpPadrao :=1;
  //dmPostgres.PgConexao.Create(nil);
    dmPostgres.PgConexao.Connected:=False;
    dmPostgres.PgConexao.Catalog:=_Catalog;
    dmPostgres.PgConexao.Database:=_Database;
    dmPostgres.PgConexao.HostName:=_Host;
    dmPostgres.PgConexao.LibraryLocation:=_LocalLib;
    dmPostgres.PgConexao.Port:=_Porta;
    dmPostgres.PgConexao.User:=_User;
    dmPostgres.PgConexao.Password:=_Senha;
    dmPostgres.PgConexao.Connected:=True;
   //Ativa a Query e o DS da empresa
    PgQueryEmpresa.Active:=True;
    DsEmpresa.Enabled:=True;


end;

end.

