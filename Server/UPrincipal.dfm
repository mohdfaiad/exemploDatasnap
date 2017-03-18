object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 93
  ClientWidth = 154
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 5
    Width = 34
    Height = 13
    Caption = 'PORTA'
  end
  object editPort: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '211'
  end
  object btnIniciar: TButton
    Left = 16
    Top = 51
    Width = 121
    Height = 30
    Caption = 'INICIAR'
    TabOrder = 1
    OnClick = btnIniciarClick
  end
end
