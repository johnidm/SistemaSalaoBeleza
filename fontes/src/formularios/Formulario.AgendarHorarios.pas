unit Formulario.AgendarHorarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, AeroButtons, W7Classes, W7Panels, PlannerCal, Planner,
  AdvGlassButton, Lib.Funcoes, Formulario.Base01;

type
  TFrmTelaAgendaHorario = class(TFrmTelaBase01)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    PlannerCalendar1: TPlannerCalendar;
    Planner1: TPlanner;
    BtnAgendarHorarios: TAdvGlassButton;
    procedure BtnAgendarHorariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  Formulario.LancarAgendaHorario;

procedure TFrmTelaAgendaHorario.BtnAgendarHorariosClick(Sender: TObject);
begin
  inherited;
  TFuncoes.AbrirFormulario<TFrmTelaLancarAgendaHorario>;
end;

end.
