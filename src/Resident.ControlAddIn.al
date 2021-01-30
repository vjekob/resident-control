controladdin Resident
{
    Scripts = 'src\script\resident.js';
    StartupScript = 'src\script\startup.js';
    StyleSheets = 'src\style\resident.css';

    RequestedHeight = 100;
    RequestedWidth = 100;
    VerticalStretch = false;
    HorizontalStretch = false;

    event OnControlReady();
    event OnKeyPressed(EventInfo: JsonObject);
    procedure StartListening();
    procedure Update();
}
