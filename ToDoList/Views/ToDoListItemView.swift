//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @State var viewModel = ProfileViewModel()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
//                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                // fill the check mark
                viewModel.setCheck(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }

        }
//        .padding()
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: ToDoListItem(id: "001",
                                            title: "test",
                                            dueDate: Date().timeIntervalSince1970,
                                            createDate: Date().timeIntervalSince1970,
                                            isDone: true))
    }
}
