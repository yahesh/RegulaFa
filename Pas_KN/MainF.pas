unit MainF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RegulaU, FunctU, StdCtrls;

type
  TMainForm = class(TForm)
    FunctionValuesListBox: TListBox;
    ExponentEdit: TEdit;
    ValueEdit: TEdit;
    AddButton: TButton;
    Button2: TButton;
    CalculateButton: TButton;
    AEdit: TEdit;
    BEdit: TEdit;
    ExponentLabel: TLabel;
    ValueLabel: TLabel;
    BLabel: TLabel;
    ALabel: TLabel;
    RegulaFalsiEdit: TEdit;
    ResultsListBox: TListBox;
    CalculationsLabel: TLabel;
    BreakButton: TButton;
    RootCheckBox: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure CalculateButtonClick(Sender: TObject);
    procedure BreakButtonClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FStopFunction   : Boolean;
    FFunctionValues : TFunctionValueRecordArray;

    function ChangedRegulaFalsi(aFunctionValues : TFunctionValueRecordArray; aA : Extended; aB : Extended) : Extended;
  public
    { Public-Deklarationen }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FStopFunction := false;

  SetLength(FFunctionValues, 0);

  FunctionValuesListBox.Clear;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FStopFunction := true;

  SetLength(FFunctionValues, 0);

  FunctionValuesListBox.Clear;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  SetLength(FFunctionValues, 0);

  FunctionValuesListBox.Clear;
end;

procedure TMainForm.AddButtonClick(Sender: TObject);
begin
  SetLength(FFunctionValues, Succ(Length(FFunctionValues)));

  FFunctionValues[Pred(Length(FFunctionValues))].Exponent := StrToFloat(ExponentEdit.Text);
  FFunctionValues[Pred(Length(FFunctionValues))].Root    := RootCheckBox.Checked;
  FFunctionValues[Pred(Length(FFunctionValues))].Value    := StrToFloat(ValueEdit.Text);

  if RootCheckBox.Checked then
    FunctionValuesListBox.Items.Add(ValueEdit.Text + ' * X^(1 / ' + ExponentEdit.Text + ')')
  else
    FunctionValuesListBox.Items.Add(ValueEdit.Text + ' * X^' + ExponentEdit.Text);

  ExponentEdit.Text     := '';
  RootCheckBox.Checked := false;
  ValueEdit.Text        := '';
end;

procedure TMainForm.CalculateButtonClick(Sender: TObject);
begin
  try
    ResultsListBox.Clear;
    CalculationsLabel.Caption := IntToStr(ResultsListBox.Items.Count);

    RegulaFalsiEdit.Text := FloatToStr(ChangedRegulaFalsi(FFunctionValues, StrToFloat(AEdit.Text), StrToFloat(BEdit.Text)));

    CalculationsLabel.Caption := IntToStr(ResultsListBox.Items.Count);
  except
    MessageDlg('Im angegebenen Bereich wurde keine Nullstelle gefunden!', mtError, [mbOK], 0);
  end;
end;

function TMainForm.ChangedRegulaFalsi(aFunctionValues : TFunctionValueRecordArray; aA : Extended; aB : Extended) : Extended;
var
  fResult : Extended;
  Index   : Integer;
begin
  Result := 0;

  FStopFunction := false;
  ResultsListBox.Items.BeginUpdate;

  fResult := 1;
  Index   := 0;
  while (Trunc(fResult * 1000) <> 0) do
  begin
    if FStopFunction then
      Break;

    Result  := CalculateRegulaFalsi(aFunctionValues, aA, aB);
    fResult := CalculateFunction(aFunctionValues, Result);

    if (fResult < 0) then
      aA := Result;
    if (fResult > 0) then
      aB := Result;

    ResultsListBox.Items.Add('X = ' + FloatToStr(Result) + ' | Y = ' + FloatToStr(fResult));

    Inc(Index);
    if (Index mod 500) = 0 then
    begin
      Index := 0;

      Application.ProcessMessages;

      CalculationsLabel.Caption := IntToStr(ResultsListBox.Items.Count);
    end;
  end;

  ResultsListBox.Items.EndUpdate;
end;

procedure TMainForm.BreakButtonClick(Sender: TObject);
begin
  FStopFunction := true;
end;

end.
