//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        // users/<id>/todos/<entries>
        
        // \(): insert a dynamic path, depends on the actual user id
        // underline means it's private and not suggested to access from outside
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(itemId: item.id)
                            } label: {
//                                Text("Delete")
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // sheet is used to pop up a new view instead of creating a new instance every time. It only changes the value of isPresented when click button
            // Only create a NewItemView() when it needs to be shown, kind of a lazy initialization to reduce performance overhead
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "iINszFKmpxQAZhbpnBSyj41Ld223")
    }
}
