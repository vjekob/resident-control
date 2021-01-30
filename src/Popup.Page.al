page 50101 "Resident Popup"
{
    PageType = StandardDialog;

    trigger OnOpenPage()
    var
        Resident: Codeunit Resident;
    begin
        Resident.Update();
    end;
}