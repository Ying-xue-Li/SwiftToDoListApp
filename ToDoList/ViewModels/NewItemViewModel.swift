//
//  NewItemView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        
        // get current userID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create a model
        let newId = UUID().uuidString // unique id for every item
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   // time both should be represented in number which is easy to store, sort and compatible
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        // save it to database
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            //  today: Date() is not older than today
            return false
        }
        return true
    }
    
    
}
