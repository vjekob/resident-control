pageextension 50100 "Order Processor Extension" extends "Order Processor Role Center"
{
    layout
    {
        addafter(Control4)
        {
            part(Resident; "Resident Subpage")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(Workflows)
        {
            action(Popup)
            {
                Caption = 'Resident Popup';
                ApplicationArea = all;
                RunObject = page "Resident Popup";
            }
        }
    }
}
