import QtQuick 2.15
import QtQuick.Layouts 1.1

import org.kde.plasma.core as PlasmaCore
import org.kde.kirigami 2.20 as Kirigami
import org.kde.ksvg 1.0 as KSvg

import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid 
import org.kde.plasma.workspace.dbus as DBus

PlasmoidItem {
    id: root
    Layout.minimumWidth: placeLabel.implicitWidth

    Plasmoid.constraintHints: Plasmoid.CanFillArea
    property string location: "Unavailable"
        
        PlasmaComponents.Label{
        anchors.centerIn: parent
            id: placeLabel
            text: location
            width: implicitWidth
        }
    Timer {
        interval: (1000*15)
        onTriggered: refreshData()
        running:true
        triggeredOnStart:true
        repeat:true
    }

    function refreshData(){
        dbus_call()
    
    }
    

    


function dbus_call() {
let id = plasmoid.configuration.device_id    
const pendingReply = DBus.SessionBus.asyncCall({
      "service": "life.vern.traccar",
      "path": "/GetLocation",
      "iface": "life.vern.traccar",
      "member":"Get",
      "signature":"(u)",
      "arguments":[id],
    })
    pendingReply.finished.connect(() => {
        location = pendingReply.value
        console.log(location)
      pendingReply.destroy()
    })}
    
}
