//
//  LoginView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//
import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var pswd = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
        // try login
        Auth.auth().signIn(withEmail: email, password: pswd)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !pswd.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all fields without whitespaces."
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email."
            return false
        }
        return true
    }
}
