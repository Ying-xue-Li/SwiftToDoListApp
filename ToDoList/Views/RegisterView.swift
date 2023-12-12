//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerModel = RegisterViewModel()
    
    var body: some View {
        VStack{
            //header
            HeaderView(image: Image("goodmorning-cat"),
                        title: "Register",
                        subtitle: "Start a positive day",
                        color: .blue,
                        angle: -15.0)
            .offset(y: 78)
            
            //login form
            Form{
                TextField("Your Name: ", text: $registerModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Your Email: ", text: $registerModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Create Password: ", text: $registerModel.pswd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ButtonView(
                    text: "Create Account",
                    foreColor: .green,
                    textColor: .white){
                        registerModel.register()
                }
                .padding()
            }
            .offset(y: -80)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
