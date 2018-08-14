unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Dados, PessoaForm;

type
  TFormMain = class(TForm)
    ButtonNovo: TButton;
    ButtonEditar: TButton;
    ButtonExcluir: TButton;
    Grid: TDBGrid;
    DataSource: TDataSource;
    ButtonPesquisar: TButton;
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDados: TDmDados;
    procedure AbrirPessoas;
    procedure MostrarFormEdicao;
    procedure Salvar;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

{ TFormMain }

constructor TFormMain.Create(AOwner: TComponent);
begin
  inherited;
  FDados := TDmDados.Create(Self);

  DataSource.DataSet := FDados.cdsPessoas;
end;

procedure TFormMain.AbrirPessoas;
begin
  FDados.cdsPessoas.Open;
end;

procedure TFormMain.ButtonEditarClick(Sender: TObject);
begin
  FDados.cdsPessoas.Edit;
  MostrarFormEdicao;
end;

procedure TFormMain.ButtonExcluirClick(Sender: TObject);
begin
  if not FDados.cdsPessoas.IsEmpty then
  begin
    FDados.cdsPessoas.Delete;
    Salvar;
  end;
end;

procedure TFormMain.ButtonNovoClick(Sender: TObject);
begin
  FDados.cdsPessoas.Insert;
  MostrarFormEdicao;
end;

procedure TFormMain.ButtonPesquisarClick(Sender: TObject);
begin
  FDados.cdsPessoas.Close;
  AbrirPessoas;
end;

procedure TFormMain.ButtonSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  AbrirPessoas;
end;

procedure TFormMain.MostrarFormEdicao;
var
  F: TFormPessoa;
begin
  F := TFormPessoa.Create(nil);
  try
    F.Dados := FDados;
    if F.ShowModal = mrOk then
      Salvar;
  finally
    F.Free;
  end;
end;

procedure TFormMain.Salvar;
begin
  FDados.cdsPessoas.ApplyUpdates(0);
end;

end.
