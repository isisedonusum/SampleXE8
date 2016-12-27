object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
  object Button1: TButton
    Left = 288
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Olu'#351'tur'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cbProfileID: TComboBox
    Left = 120
    Top = 5
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 1
    Text = 'TEMELFATURA'
    Items.Strings = (
      'TEMELFATURA'
      'TICARIFATURA'
      'IHRACAT'
      'YOLCUBERABERFATURA')
  end
  object cbInvoiceType: TComboBox
    Left = 120
    Top = 32
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = 'SATIS'
    Items.Strings = (
      'SATIS'
      'IADE'
      'TEVKIFAT'
      'ISTISNA'
      'OZELMATRAH'
      'IHRACKAYITLI')
  end
end
