object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
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
    Left = 16
    Top = 8
    Width = 81
    Height = 13
    Caption = 'VKN/TCKN Listesi'
  end
  object Memo1: TMemo
    Left = 16
    Top = 27
    Width = 185
    Height = 89
    Lines.Strings = (
      '4660392430')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 80
    Top = 122
    Width = 75
    Height = 25
    Caption = 'Sorgula'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 207
    Top = 27
    Width = 410
    Height = 264
    TabOrder = 2
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = [wnoSOAP12]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 24
    Top = 184
  end
end
