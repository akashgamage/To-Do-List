//
//  ToDoListItemView.swift
//  To Do List
//
//  Created by Akash Gamage on 2024-01-01.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    let colors: [Color] = [
        .red,
        .blue,
        .green,
        .purple,
        .orange,
        .cyan,
        .yellow,
        .pink,
    ]
    
    func randomColor() -> Color {
        return colors.randomElement() ?? .black
    }
    
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                
                Text(item.description)
                    .font(.subheadline)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .standard))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding(16)
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "app.badge.checkmark.fill" : "timer.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(item.isDone ? .blue : .red.opacity(0.5))
            }
            .padding(.horizontal,16)
        }
        .frame(maxWidth: .infinity, maxHeight: 124)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(randomColor().opacity(0.5))
        )
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123",
        title: "Task",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        dueDate: Date().timeIntervalSince1970,
        createDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
