program ArchiveEdit;

{$MODE Delphi}

uses
  Forms, Interfaces,
  Main in 'Main.pas' {Form1},
  FolderDialog in 'FolderDialog.pas' {FDialog},
  FolderSelect in 'FolderSelect.pas', glscene_designtime {FolderSel};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFDialog, FDialog);
  Application.CreateForm(TFolderSel, FolderSel);
  Application.Run;
end.
