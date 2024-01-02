//
//  Extentions.swift
//  ToDoList
//
//  Created by Akash Gamage on 2024-01-01.
//

import Foundation
import UIKit

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

//extension UIViewController {
//    func setupKeyboardLayout() {
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    
//    @objc func onKeyboardShow(notification: Notification) {
//        
//        let responderKeyboardType = UIResponder.keyboardFrameEndUserInfoKey
//        
//        guard let userInfo = notification.userInfo,
//              let keyboardFrame = userInfo[responderKeyboardType] as? NSValue else {
//            return
//        }
//        
//        let keyboardIsHidden = view.frame.origin.y == 0
//
//        if keyboardIsHidden {
//            view.frame.origin.y -= keyboardFrame.cgRectValue.height
//        }
//    }
//    
//    @objc func onKeyboardHide() {
//        let keyboardIsHiden = view.frame.origin.y == 0
//        if !keyboardIsHiden {
//            view.frame.origin.y = 0
//        }
//    }
//}

