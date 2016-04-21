unit rsa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uTPLb_Codec,
  uTPLb_CryptographicLibrary, uTPLb_BaseNonVisualComponent, uTPLb_Signatory;

type
  TForm1 = class(TForm)
    Signatory1: TSignatory;
    CryptographicLibrary1: TCryptographicLibrary;
    RSACodec: TCodec;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  i: Integer;

implementation

{$R *.dfm}
uses  uTPLb_StreamUtils, uTPLb_Constants, uTPLb_Asymetric, uTPLb_StrUtils;

procedure TForm1.Button3Click(Sender: TObject);
  var
  Store: TFileStream;
  Source: System.TArray<Byte>;
  s: String;
  sRSAKeyFileName: String;
  Base64Store: TStream;
begin
openDialog1 := TOpenDialog.Create(self);
openDialog1.InitialDir := GetCurrentDir;
openDialog1.Options := [ofAllowMultiSelect];
if not openDialog1.Execute
  then ShowMessage('Open file was cancelled')
  else
  begin
    // Display the selected file names
    for i := 0 to openDialog1.Files.Count-1 do
      sRSAKeyFileName := openDialog1.Files[i];
  end;

  // Free up the dialog
  openDialog1.Free;
Store := TFileStream.Create( sRSAKeyFileName, fmOpenRead);
try
  Store.Position := 0;
  Signatory1.LoadKeysFromStream( Store, [partPrivate]);
  Source := Stream_to_Base64( Store );
  Base64Store := TFileStream.Create( sRSAKeyFileName + 'b64', fmCreate );
  Base64Store.WriteBuffer( Source[1], Length( Source ) );
  Base64Store.Free;
  ShowMessage('Key_File_Load_Successful');

finally
  Store.Free
end
end;
procedure TForm1.Button4Click(Sender: TObject);
var
  sEncryptedFile: String;
  sDecryptedFile: String;
begin
  sEncryptedFile:=Edit1.Text;
  sDecryptedFile:=Edit2.Text;
RSACodec.DecryptFile(sDecryptedFile, sEncryptedFile);
end;
end.
