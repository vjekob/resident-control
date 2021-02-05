codeunit 50101 Resident implements IResident
{
    var
        Resident: ControlAddIn Resident;

    procedure Initialize(ResidentIn: ControlAddIn Resident)
    begin
        Resident := ResidentIn;
    end;

    procedure Update()
    begin
        Resident.Update();
    end;
}