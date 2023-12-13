//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ying on 27/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    init(){}
    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                } else{
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        Spacer()
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
            .frame(width: 125, height: 125)
        
        // Info: name, email, joined date
        VStack(alignment: .leading){
            Spacer()
            HStack{
                Text("Name: ").bold()
                Text(user.name)
            }
            Spacer()
            HStack{
                Text("Email: ").bold()
                Text(user.email)
            }
            Spacer()
            HStack{
                Text("Joined: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            Spacer()
        }
        
        // Sign out button
        ButtonView(
            text: "Log Out",
            foreColor: .red,
            textColor: .white){
                viewModel.logOut()
            }
            .padding()
            .padding(.bottom, 180)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
