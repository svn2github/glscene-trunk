//
// This unit is part of the GLScene Project, http://glscene.org
//
{ : FPlugInManagerEditor<p>

  Need a short description of what it does here.<p>

  <b>History : </b><font size=-1><ul>
  <li>17/11/14 - PW - Renamed from PlugInManagerPropEditor.pas to FPlugInManagerEditor.pas
  <li>16/10/08 - UweR - Compatibility fix for Delphi 2009
  <li>02/04/07 - DaStr - Added $I GLScene.inc
  <li>28/07/01 - EG - Creation
  </ul></font>

}
unit FPlugInManagerEditor;

interface

{$I GLScene.inc}

uses
{$IFDEF GLS_DELPHI_XE2_UP}
  System.Classes, System.SysUtils, VCL.Forms, VCL.Dialogs, VCL.StdCtrls,
  VCL.Controls, VCL.Buttons, Vcl.ExtCtrls, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin,
{$ELSE}
  Classes, SysUtils, Forms, Dialogs, StdCtrls, Controls, Buttons, ExtCtrls,
  ImgList, ComCtrls, ToolWin,
{$ENDIF}
  GLPlugInIntf, GLPlugInManager;

type
  TPlugInManagerEditor = class(TForm)
    OpenDialog: TOpenDialog;
    ListBox: TListBox;
    Label1: TLabel;
    GroupBox: TGroupBox;
    DescriptionMemo: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    DateLabel: TLabel;
    SizeLabel: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ServiceBox: TComboBox;
    NameBox: TComboBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList: TImageList;
    procedure OKButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure UnloadButtonClick(Sender: TObject);
    procedure ServiceBoxChange(Sender: TObject);
  private
    { Private declarations }
    FManager: TPlugInManager;
  public
    { Public declarations }
    class procedure EditPlugIns(AManager: TPlugInManager);
  end;

var
  PlugInManagerEditor: TPlugInManagerEditor;

  // ------------------------------------------------------------------------------

implementation

{$R *.DFM}
// ------------------------------------------------------------------------------

procedure TPlugInManagerEditor.OKButtonClick(Sender: TObject);
begin
  Close;
end;

// ------------------------------------------------------------------------------

procedure TPlugInManagerEditor.LoadButtonClick(Sender: TObject);

var
  I, Index: Integer;

begin
  with OpenDialog do
    if Execute then
      for I := 0 to Files.Count - 1 do
      begin
        Index := FManager.AddPlugIn(Files[I]);
        if Index > -1 then
          if Index >= ListBox.Items.Count then
          begin
            FManager.PlugIns.Objects[Index];
            ListBox.Items.Add(FManager.PlugIns.Strings[I]);
          end
          else
        else
          MessageDlg(Format('Error while loading %s' + #13 +
            'not a valid GLScene plug-in', [Files[I]]), mtError, [mbOK], 0);
      end;
end;

// ------------------------------------------------------------------------------

class procedure TPlugInManagerEditor.EditPlugIns(AManager: TPlugInManager);

begin
  // ensure only one instance
  if assigned(PlugInManagerEditor) then
    PlugInManagerEditor.Free;
  PlugInManagerEditor := TPlugInManagerEditor.Create(Application);
  with PlugInManagerEditor do
  begin
    ListBox.Items := AManager.PlugIns;
    FManager := AManager;
    ShowModal;
    Free;
  end;
  PlugInManagerEditor := nil;
end;

// ------------------------------------------------------------------------------

procedure TPlugInManagerEditor.ListBoxClick(Sender: TObject);

var
  Entry: Integer;
  Service: TPIServiceType;
  Services: TPIServices;

begin
  Entry := ListBox.ItemIndex;
  if Entry > -1 then
  begin
    SizeLabel.Caption := Format('%n KB',
      [FManager.PlugIns[Entry].FileSize / 1000]);
    SizeLabel.Enabled := True;
    DateLabel.Caption := DateToStr(FManager.PlugIns[Entry].FileDate);
    DateLabel.Enabled := True;
    DescriptionMemo.Lines.Text :=
      string(FManager.PlugIns[Entry].GetDescription);
    ServiceBox.Items.Clear;
    ServiceBox.Enabled := True;
    Services := FManager.PlugIns[Entry].GetServices;
    for Service := Low(TPIServiceType) to High(TPIServiceType) do
      if Service in Services then
        case Service of
          stRaw:
            begin
              Entry := ServiceBox.Items.Add('Raw');
              ServiceBox.Items.Objects[Entry] := Pointer(stRaw);
            end;
          stObject:
            begin
              Entry := ServiceBox.Items.Add('Object');
              ServiceBox.Items.Objects[Entry] := Pointer(stObject);
            end;
          stBitmap:
            begin
              Entry := ServiceBox.Items.Add('Bitmap');
              ServiceBox.Items.Objects[Entry] := Pointer(stBitmap);
            end;
          stTexture:
            begin
              Entry := ServiceBox.Items.Add('Texture');
              ServiceBox.Items.Objects[Entry] := Pointer(stTexture);
            end;
          stImport:
            begin
              Entry := ServiceBox.Items.Add('Import');
              ServiceBox.Items.Objects[Entry] := Pointer(stImport);
            end;
          stExport:
            begin
              Entry := ServiceBox.Items.Add('Export');
              ServiceBox.Items.Objects[Entry] := Pointer(stExport);
            end;
        end;
    ServiceBox.ItemIndex := 0;
    ServiceBox.OnChange(ServiceBox);
  end;
end;

// ------------------------------------------------------------------------------

procedure TPlugInManagerEditor.UnloadButtonClick(Sender: TObject);

var
  I: Integer;

begin
  for I := 0 to ListBox.Items.Count - 1 do
    if ListBox.Selected[I] then
    begin
      FManager.RemovePlugIn(I);
      ListBox.Items.Delete(I);
    end;
  DescriptionMemo.Clear;
  DateLabel.Caption := '???';
  DateLabel.Enabled := False;
  SizeLabel.Caption := '???';
  SizeLabel.Enabled := False;
  ServiceBox.ItemIndex := -1;
  ServiceBox.Enabled := False;
  NameBox.ItemIndex := -1;
  NameBox.Enabled := False;
end;

// ------------------------------------------------------------------------------

procedure NameCallback(Name: PAnsiChar); stdcall;

begin
  PlugInManagerEditor.NameBox.Items.Add(string(StrPas(Name)));
end;

// ------------------------------------------------------------------------------

procedure TPlugInManagerEditor.ServiceBoxChange(Sender: TObject);

begin
  NameBox.Items.Clear;
  with ServiceBox, Items do
    FManager.PlugIns[ListBox.ItemIndex].EnumResourceNames
      (TPIServiceType(Objects[ItemIndex]), NameCallback);
  NameBox.ItemIndex := 0;
  NameBox.Enabled := True;
end;

// ------------------------------------------------------------------------------

end.

