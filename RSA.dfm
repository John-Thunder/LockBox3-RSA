object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 852
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
    Left = 224
    Top = 96
    Width = 178
    Height = 13
    Caption = 'Input_want_save_decrypt_File_Path'
  end
  object Label2: TLabel
    Left = 224
    Top = 77
    Width = 119
    Height = 13
    Caption = 'Input_Encrypt_File_Path'
  end
  object Button3: TButton
    Left = 74
    Top = 64
    Width = 121
    Height = 25
    Caption = 'LoadPrivateKey'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 96
    Top = 95
    Width = 75
    Height = 25
    Caption = 'DecryptFile'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 408
    Top = 66
    Width = 289
    Height = 21
    TabOrder = 2
    Text = 'c:\file.encrypt'
  end
  object Edit2: TEdit
    Left = 408
    Top = 93
    Width = 289
    Height = 21
    TabOrder = 3
    Text = 'C:\file.decrypt'
  end
  object Signatory1: TSignatory
    Codec = RSACodec
    Left = 632
    Top = 232
  end
  object RSACodec: TCodec
    AsymetricKeySizeInBits = 1024
    AdvancedOptions2 = []
    CryptoLibrary = CryptographicLibrary1
    Left = 400
    Top = 208
    StreamCipherId = 'native.RSA'
    BlockCipherId = ''
    ChainId = ''
  end
  object CryptographicLibrary1: TCryptographicLibrary
    Left = 720
    Top = 232
  end
  object OpenDialog1: TOpenDialog
    Left = 776
    Top = 208
  end
  object SaveDialog1: TSaveDialog
    Left = 480
    Top = 248
  end
end
