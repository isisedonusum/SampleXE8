object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 175
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 35
    Width = 22
    Height = 13
    Caption = 'User'
  end
  object Label2: TLabel
    Left = 56
    Top = 62
    Width = 22
    Height = 13
    Caption = 'Pass'
  end
  object Label3: TLabel
    Left = 56
    Top = 8
    Width = 19
    Height = 13
    Caption = 'VKN'
  end
  object Label4: TLabel
    Left = 16
    Top = 120
    Width = 25
    Height = 13
    Caption = 'ETTN'
  end
  object Button1: TButton
    Left = 96
    Top = 144
    Width = 75
    Height = 25
    Caption = 'GetStatus'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 96
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 96
    Top = 89
    Width = 75
    Height = 25
    Caption = 'SendInvoice'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 96
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit4: TEdit
    Left = 47
    Top = 117
    Width = 189
    Height = 21
    TabOrder = 4
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = [wnoSOAP12]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 24
    Top = 64
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'xml|*.xml'
    InitialDir = '%desktop%'
    Left = 8
    Top = 16
  end
end
