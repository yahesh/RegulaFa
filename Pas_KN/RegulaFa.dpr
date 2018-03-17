program RegulaFa;

uses
  Forms,
  MainF in 'MainF.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Regula-Falsi - Berechner ( (C) by Kevin Niehage )';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
