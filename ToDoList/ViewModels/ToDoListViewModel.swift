//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//  A list for all items

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete todo list Items
    /// - Parameter itemId: item unique id to delete
    func delete(itemId: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(self.userId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
