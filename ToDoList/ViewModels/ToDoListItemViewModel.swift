//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//  A single item
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewModel: ObservableObject{
    
    init(){}
    
    /// Set toggle of items (update isDone property)
    /// - Parameter item: item need to be togggled
    func setCheck(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
