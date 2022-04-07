/*
KWin Script Test
(C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
GNU General Public License v3.0
*/

// get KWin information
debug(workspace.supportInformation());

// print basic window properties
[workspace.clientActivated, workspace.clientAdded].
forEach(event => {event.connect(win => {if (win) {
    debug("");
    debug(win.caption);
    debug("name:", win.resourceName, "class:", win.resourceClass, "role:", win.windowRole);
    debug("type:", win.windowType, windowType(win), (win.normalWindow ? "" : "not ") + "normal", (win.specialWindow ? "" : "not ") + "special");
    debug("x:", win.x, win.width, win.x + win.width, "y:", win.y, win.height, win.y + win.height);
    debug("screen:", win.screen, "desktop:", win.desktop, workspace.desktopName(win.desktop), "stack:", win.stackingOrder);
}})});

// print all window properties
[workspace.clientActivated, workspace.clientAdded].
forEach(event => {event.connect(win => {if (win) {
    debug("");
    win_ = {"resourceName":    String(win.resourceName),
            "resourceClass":   String(win.resourceClass),
            "windowRole":      String(win.windowRole),
            "desktopFileName": String(win.desktopFileName)};
    win = Object.assign({}, win, win_);
    debug(JSON.stringify(win, undefined, 2));
}})});

// helpers
function windowType(win) {
    var windowTypes = [
        "normalWindow", // 0
        "desktopWindow", // 1
        "dock", // 2
        "dialog", // 5
        "utility", // 8
        "splash", // 9
        "notification", // 13
        "onScreenDisplay", // 16
        "dropdownMenu",
        "popupMenu",
        "criticalNotification",
        "tooltip",
        "toolbar",
        "menu",
        "comboBox",
        "dndIcon"];
    return windowTypes.map(type => (win[type] ? type : "")).join("");
}

function debug(...args) {console.debug("kwindebug:", ...args);}
