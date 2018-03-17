unit RegulaU;

// DON'T DELETE THIS COMMENT !!!

{--------------------------------------------}
{ Unit :     RegulaU.pas                     }
{ Version:   1.07                            }
{                                            }
{ Coder:     Yahe <hello@yahe.sh>            }
{                                            }
{ I'm NOT Liable For Damages Of ANY Kind !!! }
{--------------------------------------------}

// DON'T DELETE THIS COMMENT !!!

interface

uses
  FunctU;

function CalculateRegulaFalsi(aFunctionValues : TFunctionValueRecordArray; aA : Extended; aB : Extended) : Extended;
function RegulaFalsi(aFunctionValues : TFunctionValueRecordArray; aA : Extended; aB : Extended) : Extended;

implementation

function CalculateRegulaFalsi(aFunctionValues : TFunctionValueRecordArray; aA : Extended; aB : Extended) : Extended;
var
  fA : Extended;
  fB : Extended;
begin
  fA := CalculateFunction(aFunctionValues, aA);
  fB := CalculateFunction(aFunctionValues, aB);

  Result := aA - (fA * ((aB - aA) / (fB - fA)));
end;

function RegulaFalsi(aFunctionValues : TFunctionValueRecordArray; aA : Extended; aB : Extended) : Extended;
var
  fResult : Extended;
begin
  Result := 0;

  fResult := 1;
  while (Trunc(fResult * 1000) <> 0) do
  begin
    Result  := CalculateRegulaFalsi(aFunctionValues, aA, aB);
    fResult := CalculateFunction(aFunctionValues, Result);

    if (fResult < 0) then
      aA := Result;
    if (fResult > 0) then
      aB := Result;
  end;
end;

end.
