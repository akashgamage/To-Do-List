//
//  ProfileView.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile ...")
                }
            }
            .padding(16)
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    
    func profile(user: User) -> some View {
        // Profile Avatar
        Image("ProfileAvater")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding(.vertical)
        
        // User Info
        
        VStack (alignment: .leading) {
            Text("Name")
                .font(.headline)
            Text(user.uname)
        }
        .padding()
        
        VStack (alignment: .leading) {
            Text("Email")
                .font(.headline)
            Text(user.email)
        }
        .padding()
        
        VStack (alignment: .leading) {
            Text("Joined")
                .font(.headline)
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
        }
        .padding()
        
        
        // Sign Out
        Button {
            viewModel.logout()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.red)
    
                Text("Sign Out")
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
