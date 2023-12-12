//
//  LoginView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                //header
                HeaderView(image: Image("killmyself-cat"),
                           title: "To Do List",
                           subtitle: "Get things down",
                           color: .orange,
                           angle: 15.0)
                .offset(y: 115)
                
                //login form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email: ", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password: ", text: $viewModel.pswd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    ButtonView(
                        text: "Log In",
                        foreColor: .blue,
                        textColor: .white){
                            viewModel.login()
                        }
                        .padding()
                }
                
                //create account
                VStack{
                    Text("New here?")
                    NavigationLink(destination: RegisterView(),
                                   label: { Text("Creat an account") })
                }
                .padding(.bottom, 60)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
