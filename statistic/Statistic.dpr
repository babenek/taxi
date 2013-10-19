program Statistic;

uses
  Forms,
  uStatistic in 'uStatistic.pas' {fStatistic};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Statistic';
  Application.CreateForm(TfStatistic, fStatistic);
  Application.Run;
end.
