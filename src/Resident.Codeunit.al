codeunit 50100 Resident
{
    SingleInstance = true;

    var
        Resident: ControlAddIn Resident;

    procedure Initialize(Resident2: ControlAddIn Resident)
    begin
        Resident := Resident2;
    end;

    procedure Update();
    begin
        Resident.Update();
    end;
}