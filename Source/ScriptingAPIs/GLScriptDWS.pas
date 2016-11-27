//
// This unit is part of the GLScene Project, http://glscene.org
//
{
  DelphiWebScript implementation for the GLScene scripting layer. 

  History :  
       04/11/2004 - SG - Creation
    
}
unit GLScriptDWS;

interface

uses
  System.Classes, 
  System.SysUtils, 
  GLXCollection, 
  GLScriptBase, 
  dwsComp, 
  dwsExprs,
  dwsSymbols, 
  GLManager;

type
  // TGLDelphiWebScript
  //
  {This class only adds manager registration logic to the TDelphiWebScriptII
     class to enable the XCollection items (ie. TGLScriptDWS2) retain it's
     assigned compiler from design to run -time. }
  TGLDelphiWebScript = class(TDelphiWebScript)
    public
      constructor Create(AOnwer : TComponent); override;
      destructor Destroy; override;
  end;

  // GLScriptDWS
  //
  {Implements DelphiWebScriptII scripting functionality through the
     abstracted GLScriptBase . }
  TGLScriptDWS = class(TGLScriptBase)
    private
      { Private Declarations }
      FDWSProgram : TProgram;
      FCompiler : TGLDelphiWebScript;
      FCompilerName : String;

    protected
      { Protected Declarations }
      procedure SetCompiler(const Value : TGLDelphiWebScriptII);

      procedure ReadFromFiler(reader : TReader); override;
      procedure WriteToFiler(writer : TWriter); override;
      procedure Loaded; override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;

      function GetState : TGLScriptState; override;

    public
      { Public Declarations }
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure Compile; override;
      procedure Start; override;
      procedure Stop; override;
      procedure Execute; override;
      procedure Invalidate; override;
      function Call(aName : String;
        aParams : array of Variant) : Variant; override;

      class function FriendlyName : String; override;
      class function FriendlyDescription : String; override;
      class function ItemCategory : String; override;

      property DWS2Program : TProgram read FDWS2Program;

    published
      { Published Declarations }
      property Compiler : TGLDelphiWebScriptII read FCompiler write SetCompiler;

  end;

procedure Register;

// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------
implementation
// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------

// ---------------
// --------------- Miscellaneous ---------------
// ---------------

// Register
//
procedure Register;
begin
  RegisterClasses([TGLDelphiWebScript, TGLScriptDWS]);
  RegisterComponents('GLScene DWS', [TGLDelphiWebScript]);
end;


// ----------
// ---------- TGLDelphiWebScript ----------
// ----------

// Create
//
constructor TGLDelphiWebScript.Create(AOnwer : TComponent);
begin
  inherited;
  RegisterManager(Self);
end;

// Destroy
//
destructor TGLDelphiWebScript.Destroy;
begin
  DeregisterManager(Self);
  inherited;
end;


// ---------------
// --------------- TGLScriptDWS2 ---------------
// ---------------

// Destroy
//
destructor TGLScriptDWS.Destroy;
begin
  Invalidate;
  inherited;
end;

// Assign
//
procedure TGLScriptDWS.Assign(Source: TPersistent);
begin
  inherited;
  if Source is TGLScriptDWS then begin
    Compiler:=TGLScriptDWS(Source).Compiler;
  end;
end;

// ReadFromFiler
//
procedure TGLScriptDWS.ReadFromFiler(reader : TReader);
var
  archiveVersion : Integer;
begin
  inherited;
  archiveVersion:=reader.ReadInteger;
  Assert(archiveVersion = 0);

  with reader do begin
    FCompilerName:=ReadString;
  end;
end;

// WriteToFiler
//
procedure TGLScriptDWS.WriteToFiler(writer : TWriter);
begin
  inherited;
  writer.WriteInteger(0); // archiveVersion

  with writer do begin
    if Assigned(FCompiler) then
      WriteString(FCompiler.GetNamePath)
    else
      WriteString('');
  end;
end;

// Loaded
//
procedure TGLScriptDWS.Loaded;
var
  temp : TComponent;
begin
  inherited;
  if FCompilerName<>'' then begin
    temp:=FindManager(TGLDelphiWebScript, FCompilerName);
    if Assigned(temp) then
      Compiler:=TGLDelphiWebScript(temp);
    FCompilerName:='';
  end;
end;

// Notification
//
procedure TGLScriptDWS.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (AComponent = Compiler) and (Operation = opRemove) then
    Compiler:=nil;
end;

// FriendlyName
//
class function TGLScriptDWS.FriendlyName : String;
begin
  Result:='GLScriptDWS';
end;

// FriendlyDescription
//
class function TGLScriptDWS.FriendlyDescription : String;
begin
  Result:='DelphiWebScript script';
end;

// ItemCategory
//
class function TGLScriptDWS.ItemCategory : String;
begin
  Result:='';
end;

// Compile
//
procedure TGLScriptDWS.Compile;
begin
  Invalidate;
  if Assigned(Compiler) then
    FDWS2Program:=Compiler.Compile(Text.Text)
  else
    raise Exception.Create('No compiler assigned!');
end;

// Execute
//
procedure TGLScriptDWS.Execute;
begin
  if (State = ssUncompiled) then
    Compile
  else if (State = ssRunning) then
    Stop;
  if (State = ssCompiled) then
    FDWS2Program.Execute;
end;

// Invalidate
//
procedure TGLScriptDWS.Invalidate;
begin
  if (State <> ssUncompiled) or Assigned(FDWSProgram) then begin
    Stop;
    FreeAndNil(FDWSProgram);
  end;
end;

// Start
//
procedure TGLScriptDWS.Start;
begin
  if (State = ssUncompiled) then
    Compile;
  if (State = ssCompiled) then
    FDWS2Program.BeginProgram(False);
end;

// Stop
//
procedure TGLScriptDWS.Stop;
begin
  if (State = ssRunning) then
    FDWS2Program.EndProgram;
end;

// Call
//
function TGLScriptDWS.Call(aName: String; aParams: array of Variant) : Variant;
var
  Symbol : TSymbol;
  Output : IInfo;
begin
  if (State <> ssRunning) then
    Start;
  if State = ssRunning then begin
    Symbol:=FDWSProgram.Table.FindSymbol(aName);
    if Assigned(Symbol) then begin
      if Symbol is TFuncSymbol then begin
        Output:=FDWSProgram.Info.Func[aName].Call(aParams);
        if Assigned(Output) then
          Result:=Output.Value;
      end else
        raise Exception.Create('Expected TFuncSymbol but found '+Symbol.ClassName+' for '+aName);
    end else
      raise Exception.Create('Symbol not found for '+aName);
  end;
end;

// SetCompiler
//
procedure TGLScriptDWS.SetCompiler(const Value : TGLDelphiWebScript);
begin
  if Value<>FCompiler then begin
    FCompiler:=Value;
    Invalidate;
  end;
end;

// GetState
//
function TGLScriptDWS.GetState : TGLScriptState;
begin
  Result:=ssUncompiled;
  if Assigned(FDWSProgram) then begin
    case FDWSProgram.ProgramState of
      psReadyToRun : Result:=ssCompiled;
      psRunning : Result:=ssRunning;
    else
      if FDWSProgram.Msgs.HasErrors then begin
        if FDWSProgram.Msgs.HasCompilerErrors then
          Result:=ssCompileErrors
        else if FDWSProgram.Msgs.HasExecutionErrors then
          Result:=ssRunningErrors;
        Errors.Text:=FDWSProgram.Msgs.AsInfo;
      end;
    end;
  end;
end;

// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------
initialization
// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------

  RegisterXCollectionItemClass(TGLScriptDWS);

// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------
finalization
// --------------------------------------------------
// --------------------------------------------------
// --------------------------------------------------

  UnregisterXCollectionItemClass(TGLScriptDWS);

end.