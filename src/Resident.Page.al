page 50100 "Resident Subpage"
{
    PageType = CardPart;


    layout
    {
        area(Content)
        {
            usercontrol(Resident; Resident)
            {
                trigger OnControlReady()
                var
                    Resident: Codeunit Resident;
                begin
                    CurrPage.Resident.StartListening();
                    Resident.Initialize(CurrPage.Resident);
                    ResidentKeeper.Initialize(Resident);
                    BindSubscription(ResidentKeeper);
                end;

                trigger OnKeyPressed(EventInfo: JsonObject)
                var
                    Content: Text;
                begin
                    EventInfo.WriteTo(Content);
                    Message('Key pressed: %1', Content);
                end;
            }
        }
    }

    var
        ResidentKeeper: Codeunit "Resident Keeper";
}
