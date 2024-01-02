//
//  LoginView.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            ImageOverlay()
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ImageOverlay: View {
    var body: some View{
        ScrollView {
            VStack (alignment: .center) {
                Image("welcome")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 700)
                    .padding(.leading,200)
                    .opacity(0.5)
                    .overlay(bodyView())
            }
        }
    }
}

struct bodyView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack (alignment: .center) {
            VStack (alignment: .leading) {
                // Header
                VStack (alignment: .leading) {
                    Text ("Welcome")
                        .font(.system(size: 56))
                        .foregroundColor(Color.blue)
                        .bold()
                        .padding(.top)
            
                    Text ("To Do List")
                        .font(.system(size: 32))
                        .bold()
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 64)
                .padding(.top)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.17)
            
                // Login
                    VStack (alignment: .leading) {
                        Text ("Log In")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                            .bold()
                            .padding()
                    
                        TextField ("Email Address", text: $viewModel.email)
                            .padding()
                            .background(Color.cyan.opacity(0.3))
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                        SecureField ("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.cyan.opacity(0.3))
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            
                    
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                    
                        Button {
                            viewModel.login()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.blue)
                    
                                Text("Log In")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .frame(height: 50)
                        }
                        .padding(.top,16)
                    }
                    .padding(16)
                

                // Create Account
                VStack {
                    Text("Don't have an Account?")
                    NavigationLink("Sign Up", destination: RegisterView())
                        .foregroundColor(Color.red)
                }
                .frame(maxWidth: .infinity)

            }
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    LoginView()
}
