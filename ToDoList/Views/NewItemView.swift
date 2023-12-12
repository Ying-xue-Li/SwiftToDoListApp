//
//  NewItemView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import SwiftUI

struct NewItemView: View {
    // StateObeject is for data who has long life cycle
    @StateObject var viewModel = NewItemViewModel()
    // Binding updates and shares data among different views
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form{
                //title
                TextField("Title: ", text: $viewModel.title)
                    .textFieldStyle(.automatic)
                
                //due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                //button
                ButtonView(text: "Save", foreColor: .pink, textColor: .white){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date today or newer!"))
                
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
            NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in  // accept a para but don't use it
        }))
    }
}
