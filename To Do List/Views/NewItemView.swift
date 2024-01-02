//
//  NewItemView.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.vertical, 32)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .padding(.vertical,8)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                Button {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented =  false
                    } else {
                        viewModel.showAlert = true
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
            
                        Text("Save")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 44)
                }
                .padding(.vertical,8)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fiels and select valid due date")
                )
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
