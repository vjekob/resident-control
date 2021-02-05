page 50101 "Resident Popup"
{
    PageType = StandardDialog;

    trigger OnOpenPage()
    var
        ResidentKeeper: Codeunit "Resident Keeper";
        Resident: Interface IResident;
    begin
        if ResidentKeeper.RetrieveInstance(Resident) then
            Resident.Update();
    end;
}