program pruebalistas;

{$mode objfpc}{$H+}
{$I+}
uses
  Interfaces, Forms, testcaseListas, GuiTestRunner;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

