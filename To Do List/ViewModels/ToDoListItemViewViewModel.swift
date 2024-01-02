//
//  ToDoListItemViewViewModel.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init () {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("tasks")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
