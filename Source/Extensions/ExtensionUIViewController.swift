//
//  ExtensionUIViewController.swift
//  MDFoundation
//
//  Created by Михаил Андреичев on 14.12.2019.
//

public extension UIViewController {
    func showError(_ message: String, closeText: String) {
        let alertController = UIAlertController(
            title: .empty,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        alertController.addAction(UIAlertAction(
            title: closeText,
            style: UIAlertAction.Style.default,
            handler: nil
        )
        )

        present(alertController, animated: true, completion: nil)
    }
}
