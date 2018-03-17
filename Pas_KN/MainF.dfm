object MainForm: TMainForm
  Left = 217
  Top = 82
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Regula-Falsi - Berechner ( (C) by Kevin Niehage ) - Version: 1.3' +
    '.11.9'
  ClientHeight = 457
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ExponentLabel: TLabel
    Left = 168
    Top = 34
    Width = 59
    Height = 16
    Caption = 'Exponent:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ValueLabel: TLabel
    Left = 184
    Top = 10
    Width = 31
    Height = 16
    Caption = 'Wert:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BLabel: TLabel
    Left = 176
    Top = 218
    Width = 12
    Height = 16
    Caption = 'B:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ALabel: TLabel
    Left = 176
    Top = 186
    Width = 12
    Height = 16
    Caption = 'A:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CalculationsLabel: TLabel
    Left = 344
    Top = 424
    Width = 6
    Height = 13
    Alignment = taRightJustify
    Caption = '0'
  end
  object FunctionValuesListBox: TListBox
    Left = 8
    Top = 8
    Width = 153
    Height = 233
    ItemHeight = 13
    TabOrder = 0
  end
  object ExponentEdit: TEdit
    Left = 232
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object ValueEdit: TEdit
    Left = 232
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object AddButton: TButton
    Left = 176
    Top = 104
    Width = 177
    Height = 25
    Caption = '&Add (+)'
    TabOrder = 4
    OnClick = AddButtonClick
  end
  object RootCheckBox: TCheckBox
    Left = 232
    Top = 64
    Width = 121
    Height = 17
    Caption = '&Wurzelziehen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Button2: TButton
    Left = 176
    Top = 136
    Width = 177
    Height = 25
    Caption = '&Clear'
    TabOrder = 5
    OnClick = Button2Click
  end
  object CalculateButton: TButton
    Left = 8
    Top = 256
    Width = 345
    Height = 25
    Caption = '&Berechne die Regula-Falsi'
    Default = True
    TabOrder = 8
    OnClick = CalculateButtonClick
  end
  object AEdit: TEdit
    Left = 192
    Top = 184
    Width = 161
    Height = 21
    TabOrder = 6
  end
  object BEdit: TEdit
    Left = 192
    Top = 216
    Width = 161
    Height = 21
    TabOrder = 7
  end
  object RegulaFalsiEdit: TEdit
    Left = 8
    Top = 296
    Width = 345
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object ResultsListBox: TListBox
    Left = 8
    Top = 320
    Width = 345
    Height = 97
    ItemHeight = 13
    TabOrder = 10
  end
  object BreakButton: TButton
    Left = 8
    Top = 424
    Width = 89
    Height = 25
    Cancel = True
    Caption = '&Break'
    TabOrder = 11
    OnClick = BreakButtonClick
  end
end
