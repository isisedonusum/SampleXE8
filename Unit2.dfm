object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 395
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    635
    395)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Fatura Senaryosu'
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 51
    Height = 13
    Caption = 'Fatura Tipi'
  end
  object Label3: TLabel
    Left = 10
    Top = 228
    Width = 94
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Kalem Toplam Tutar'
    ExplicitTop = 196
  end
  object Label4: TLabel
    Left = 8
    Top = 62
    Width = 79
    Height = 13
    Caption = 'Fatura Numaras'#305
  end
  object Label5: TLabel
    Left = 10
    Top = 255
    Width = 80
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Vergi Haric Tutar'
    ExplicitTop = 223
  end
  object Label6: TLabel
    Left = 10
    Top = 282
    Width = 79
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Vergi Dahil Tutar'
    ExplicitTop = 250
  end
  object Label7: TLabel
    Left = 10
    Top = 309
    Width = 69
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Toplam '#304'ndirim'
  end
  object Label8: TLabel
    Left = 10
    Top = 336
    Width = 77
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #214'denecek Tutar'
  end
  object Button1: TButton
    Left = 288
    Top = 362
    Width = 75
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Olu'#351'tur'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cbProfileID: TComboBox
    Left = 120
    Top = 5
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object cbInvoiceType: TComboBox
    Left = 120
    Top = 32
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 86
    Width = 619
    Height = 133
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 7
    Enabled = False
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    TabOrder = 3
  end
  object txKalemToplamTutar: TEdit
    Left = 120
    Top = 225
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 4
    Text = '0'
  end
  object txNo: TMaskEdit
    Left = 120
    Top = 59
    Width = 143
    Height = 21
    EditMask = '>AAA#############;1;_'
    MaxLength = 16
    TabOrder = 5
    Text = 'ISS2016000000001'
  end
  object txVergiHaricTutar: TEdit
    Left = 120
    Top = 252
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 6
    Text = '0'
  end
  object txVergiDahilTutar: TEdit
    Left = 120
    Top = 279
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 7
    Text = '0'
  end
  object txToplamIndirim: TEdit
    Left = 120
    Top = 306
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 8
    Text = '0'
  end
  object txOdenecekTutar: TEdit
    Left = 120
    Top = 333
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 9
    Text = '0'
  end
end
