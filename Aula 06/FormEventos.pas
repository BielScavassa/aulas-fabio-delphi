unit FormEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DM1, Data.DB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FOnMeuClick: TNotifyEvent;
    FDM: TDataModule1;
    procedure MeuClick(Sender: TObject);
    function NewRecord: Boolean;
    function BeforeInsert: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
  FDM := TDataModule1.Create(Self);

  FDM.OnNewRecord := NewRecord;
  FDM.BeforeInsert := BeforeInsert;
end;

function TForm1.NewRecord: Boolean;
begin
  Result := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FOnMeuClick := MeuClick;
end;

procedure TForm1.MeuClick(Sender: TObject);
begin
  ShowMessage('Meu Click');
end;

function TForm1.BeforeInsert: Boolean;
begin
  ShowMessage('Ola Tudo bem ?');
  Result := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDM.cds.CreateDataSet;
  FDM.cds.Insert;

  if Assigned(FOnMeuClick) then
    FOnMeuClick(Sender);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

end.
