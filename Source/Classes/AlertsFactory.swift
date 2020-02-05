//
//  AlertsFactory.swift
//  MDFoundation
// 
//  Created by Михаил Андреичев on 28.11.2019.
//

open class AlertsFactory {
    public static func error(
        title: String,
        message: String,
        cancelText: String
    ) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let cancelAction = UIAlertAction(
            title: cancelText,
            style: UIAlertAction.Style.cancel
        )
        alert.addAction(cancelAction)
        return alert
    }

    public static func accessDeniedWithSettingsLink(
        title: String,
        message: String,
        openSettingsText: String,
        cancelText: String
    ) -> UIAlertController {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(
            title: openSettingsText,
            style: UIAlertAction.Style.default,
            handler: openSettingsAction(_:)
        ))
        alert.addAction(UIAlertAction(
            title: cancelText,
            style: UIAlertAction.Style.default,
            handler: nil
        ))
        return alert
    }

    public static func openSettingsAction(_ action: UIAlertAction) {
        let app = UIApplication.shared
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if app.canOpenURL(settingsUrl) {
            app.open(settingsUrl)
        }
    }
}
