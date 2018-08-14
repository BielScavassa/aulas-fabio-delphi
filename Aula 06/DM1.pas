unit DM1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TMeuTipoDeEvento = reference to function: Boolean;

  TDataModule1 = class(TDataModule)
    cds: TClientDataSet;
    cdsID: TIntegerField;
  private
    FBeforeInsert: TMeuTipoDeEvento;
    FOnNewRecord: TMeuTipoDeEvento;
    procedure ClientDataSet1NewRecord(DataSet: TDataSet);
    procedure ClientDataSetBeforeInsert(DataSet: TDataSet);
  public
    property OnNewRecord: TMeuTipoDeEvento read FOnNewRecord write FOnNewRecord;
    property BeforeInsert: TMeuTipoDeEvento read FBeforeInsert write FBeforeInsert;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.ClientDataSet1NewRecord(DataSet: TDataSet);
var
  Resposta: Boolean;
begin
  if Assigned(FOnNewRecord) then
    Resposta := FOnNewRecord;

  if Resposta then
    raise Exception.Create('Exception do DM');
end;

constructor TDataModule1.Create(AOwner: TComponent);
begin
  inherited;
  cds.OnNewRecord := ClientDataSet1NewRecord;
  cds.BeforeInsert := ClientDataSetBeforeInsert;
end;

procedure TDataModule1.ClientDataSetBeforeInsert(DataSet: TDataSet);
var
  Resposta: Boolean;
begin
  if Assigned(FBeforeInsert) then
    Resposta := FBeforeInsert;

  if Resposta then
    raise Exception.Create('Exception BeforeInsert');
end;

end.
