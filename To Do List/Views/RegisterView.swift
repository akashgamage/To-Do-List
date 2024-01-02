//
//  RegisterView.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        NavigationView{
            imageOverlay()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct imageOverlay: View {
    var body: some View{
        ScrollView {
            VStack {
                Image("Register")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 700)
                    .padding(.leading,150)
                    .rotationEffect(Angle(degrees: -20))
                    .opacity(0.5)
                    .overlay(BodyView())
            }
        }
    }
}

struct BodyView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
            
//            Image("Register")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(maxWidth: 700, maxHeight: 900)
//                .edgesIgnoringSafeArea(.all)
//                .padding(.leading,500)
//                .opacity(0.7)
//                .rotationEffect(Angle(degrees: -20))
                
            
            VStack (alignment: .leading) {
                
                // Header
                VStack (alignment: .leading) {
                    Text ("Register")
                        .font(.system(size: 56))
                        .foregroundColor(Color.red)
                        .bold()
                        .padding(.top)
                        
                    Text ("To Do List")
                        .font(.system(size: 32))
                        .bold()
                        

                }
                .padding(.horizontal, 32)
                .padding(.vertical, 64)
                
                Spacer()
                
                // Login
                VStack (alignment: .leading) {
                    Text ("Sign Up")
                        .font(.system(size: 40))
                        .foregroundColor(.red)
                        .bold()
                        .padding()
                    
                    TextField ("User Name", text: $viewModel.uname)
                        .padding()
                        .background(Color.pink.opacity(0.3))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    TextField ("Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color.pink.opacity(0.3))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField ("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.pink.opacity(0.3))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    Button {
                        viewModel.register()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.red)
                            
                            Text("Sign Up")
                                .bold()
                                .foregroundColor(.white)
                        }
                        .frame(height: 50)
                    }
                    .padding(.top, 16)
                    
                }
                .padding(16)
                
                
                
                // Create Account
                VStack {
                    Text("Already have an Account?")
                    NavigationLink("Log In", destination: LoginView())
                        .foregroundColor(Color.blue)
                }
                .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        }
    }

#Preview {
    RegisterView()
}
