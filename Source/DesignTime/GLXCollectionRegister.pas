//
// This unit is part of the GLScene Project, http://glscene.org
//
{
   Register TXCollection property editor 
}
unit GLXCollectionRegister;

interface

{$I GLScene.inc}

uses
  System.Classes,
  GLXCollection,

  DesignEditors, 
  DesignIntf;

type
	TXCollectionProperty = class(TClassProperty)
	public
      	  function GetAttributes: TPropertyAttributes; override;
	  procedure Edit; override;
	end;

procedure Register;

// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------

uses
  FXCollectionEditor;


//----------------- TXCollectionProperty ------------------------------------

function TXCollectionProperty.GetAttributes: TPropertyAttributes;
begin
	Result:=[paDialog];
end;

procedure TXCollectionProperty.Edit;
begin
   with XCollectionEditorForm do begin
     SetXCollection(TXCollection(GetOrdValue), Self.Designer);
     Show;
   end;
end;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TXCollection), nil, '', TXCollectionProperty);
end;


// ------------------------------------------------------------------
initialization
// ------------------------------------------------------------------

// class registrations

end.
