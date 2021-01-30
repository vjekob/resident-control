function getALMethod(name, SKIP_IF_BUSY) {
    const nav = Microsoft.Dynamics.NAV.GetEnvironment();

    return (...args) => {
        let result;

        window["OnInvokeResult"] = function (alResult) {
            result = alResult;
        }

        return new Promise(resolve => {
            if (SKIP_IF_BUSY && nav.Busy) {
                resolve(SKIP_IF_BUSY);
                return;
            }

            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(name, args, false, () => {
                delete window.OnInvokeResult;
                resolve(result);
            });
        });
    }
}

let indicator;

function initialize() {
    indicator = document.createElement("div");
    indicator.className = "indicator";
    document.getElementById("controlAddIn").append(indicator);
}

function StartListening() {
    indicator.className = "indicator on";

    const keyPressed = getALMethod("OnKeyPressed");
    const frames = window.top.document.querySelectorAll("iframe");
    for (let frame of frames) {
        frame.contentDocument.addEventListener("keyup", e => {
            const data = { key: e.key, shift: e.shiftKey, ctrl: e.ctrlKey, alt: e.altKey };
            indicator.className = "indicator on";
            indicator.innerText = e.key;
            keyPressed(data);
        });
    }
}

function Update() {
    indicator.className = "indicator updated";
}