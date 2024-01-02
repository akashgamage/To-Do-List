////
////  ViewController.swift
////  To Do List
////
////  Created by Akash Gamage on 2024-01-02.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    @IBOutlet var keyboardBottomConstraint: NSLayoutConstraint!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    
//    @objc func onKeyboardShow(notification: Notification) {
//        keyboardBottomConstraint.isActive = true
//        
//        guard let userInfo = notification.userInfo else {
//            return
//        }
//        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
//            return
//        }
//        
//        keyboardBottomConstraint.constant = keyboardSize.height + 32
//        
//        UIView.animate(withDuration: 0.1) {
//            self.view.layoutIfNeeded()
//        }
//    }
//    
//    @objc func onKeyboardHide() {
//        
//    }
//}
