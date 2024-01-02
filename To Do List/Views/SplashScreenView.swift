//
//  SplashScreenView.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-02.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            VStack {
                VStack{
                    Image("Splash")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 100, height: 100)
                        .padding()
                    Text("To Do List")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
        
    }
}

#Preview {
    SplashScreenView()
}
