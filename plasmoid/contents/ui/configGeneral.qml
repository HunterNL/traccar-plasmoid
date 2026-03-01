import QtQuick
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    property alias cfg_device_id: device_id.value;

    Kirigami.FormLayout {
        id: page
  
        // property alias cfg_showLabel: showLabel.checked
        // property alias cfg_showIcon: showIcon.checked
        // property alias cfg_device_id: device_id.value

        // QQC2.CheckBox {
        //     id: showLabel
        //     Kirigami.FormData.label: i18n("Section:")
        //     text: i18n("Show label")
        // }
        // QQC2.CheckBox {
        //     id: showIcon
        //     text: i18n("Show icon")
        // }
        // QQC2.TextField {
        //     id: labelText
        //     Kirigami.FormData.label: i18n("Label:")
        //     placeholderText: i18n("Placeholder")
        // }
        QQC2.SpinBox {
            id: device_id
            Kirigami.FormData.label: i18n("Device Id:")
        }
    }
}
