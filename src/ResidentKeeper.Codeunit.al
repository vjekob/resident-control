codeunit 50100 "Resident Keeper"
{
    EventSubscriberInstance = Manual;

    var
        Resident: Interface IResident;

    procedure Initialize(Resident2: Interface IResident)
    begin
        Resident := Resident2;
    end;

    procedure RetrieveInstance(var ResidentOut: Interface IResident) Handled: Boolean
    begin
        OnRetrieveInstance(ResidentOut, Handled);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnRetrieveInstance(var ResidentOut: Interface IResident; var Handled: Boolean);
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Resident Keeper", 'OnRetrieveInstance', '', false, false)]
    local procedure OnRetrieveInstanceSubscriber(var ResidentOut: Interface IResident; var Handled: Boolean);
    begin
        ResidentOut := Resident;
        Handled := true;
    end;
}