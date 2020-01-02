//
//  SettingsAlertsFactory.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 28.11.2019.
//
///  Пример использования:
///  public class CustomAlertsFactory: AlertsFactory {
///      public static func speechRecognitionDenied() -> UIAlertController {
///          let alert = UIAlertController(
///              title: "Ошибка",
///              message: Text.Errors.speechRecognitionDenied,
///              preferredStyle: UIAlertController.Style.alert
///          )
///          alert.addAction(UIAlertAction(
///              title: "Доступ запрещен, это можно изменить в настройках",
///              style: UIAlertAction.Style.default,
///              handler: openSettingsAction(_:)
///          ))
///          alert.addAction(UIAlertAction(
///              title: "Отмена",
///              style: UIAlertAction.Style.default,
///              handler: nil
///          ))
///          return alert
///      }
///  }
open class SettingsAlertsFactory {
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
