program dyntexdemo;

uses
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1;

begin
  Application.Title:='DynamicTextureDemo';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

