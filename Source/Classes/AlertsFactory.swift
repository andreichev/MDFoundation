//
//  AlertsFactory.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 28.11.2019.
//

import UIKit

open class AlertsFactory {

    public static func plain(
        title: String,
        message: String,
        tintColor: UIColor,
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
        alert.view.tintColor = tintColor
        return alert
    }

    public static func acceptAction(
        alertStyle: UIAlertController.Style,
        alertTitle: String,
        acceptTitle: String,
        cancelText: String,
        acceptStyle: UIAlertAction.Style,
        tintColor: UIColor,
        acceptHandler: @escaping ((UIAlertAction) -> Void)
    ) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(
            title: alertTitle,
            message: nil,
            preferredStyle: alertStyle
        )
        let acceptAction = UIAlertAction(
            title: acceptTitle,
            style: acceptStyle,
            handler: acceptHandler
        )
        let cancelAction = UIAlertAction(
            title: cancelText,
            style: UIAlertAction.Style.cancel
        )

        alert.addAction(acceptAction)
        alert.addAction(cancelAction)
        alert.view.tintColor = tintColor
        return alert
    }

    public static func accessDeniedWithSettingsLink(
        title: String,
        message: String,
        openSettingsText: String,
        tintColor: UIColor,
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
        alert.view.tintColor = tintColor
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
