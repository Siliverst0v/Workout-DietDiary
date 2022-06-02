//
//  AddCustomExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 03.06.2022.
//

import SwiftUI

struct AddCustomExerciseButton: View {
    enum FocusField: Hashable {
      case field
    }
    @FocusState private var focusedField: FocusField?
    @Binding var icon: String
    @State private var isPressed = false
    @State var newExerciseTitle: String = ""
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                let width = geometry.size.width
                HStack {
                    Image(icon)
                        .resizable()
                        .frame(width: 70, height: 40)
                        .foregroundColor(.customRed)
                if isPressed {
                    TextEditor(text: $newExerciseTitle)
                        .foregroundColor(.customBlue)
                        .lineLimit(2)
                        .frame(width: width - 160,
                               height: 60,
                               alignment: .leading)
                        .cornerRadius(10)
                        .offset(x: 10)
                        .onReceive(newExerciseTitle.publisher.collect()) {
                                self.newExerciseTitle = String($0.prefix(60))
                            }
                        .focused($focusedField, equals: .field)
                        .onAppear {
                                    self.focusedField = .field
                                }
                        } else {
                    Text("Добавить свое упражнение")
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .font(.system(size: 14))
                        .foregroundColor(.customRed)
                        .frame(width: width - 160,
                               height: 60,
                               alignment: .leading)
                        .padding(.leading)
                        }
                    }
                    .padding(.init(top: 5,
                                   leading: 16,
                                   bottom: 0,
                                   trailing: 0))
                Button(action: { isPressed.toggle() }) {
                Image(systemName: "plus.square")
                    .font(.system(size: 20))
                    .foregroundColor(.customRed)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(
                                RoundedRectangle(cornerRadius: 11)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                                .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.gray, lineWidth: 0.1)
                                )
                        )
                    }
                .offset(x: width - 45, y: 15)
            }
                .frame(width:UIScreen.main.bounds.size.width - 40,
                       height: 70, alignment: .center)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 11)
                .fill(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(Color.gray, lineWidth: 3)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(
                            RoundedRectangle(cornerRadius: 11)
                            .fill(LinearGradient(Color.black, Color.gray)))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(Color.white, lineWidth: 3)
                        .blur(radius: 4)
                        .offset(x: -2, y: -2)
                        .mask(
                            RoundedRectangle(cornerRadius: 11)
                                .fill(LinearGradient(Color.black, Color.gray)))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(Color.gray, lineWidth: 0.1)
                )
        )
    }
}

//extension AddCustomExerciseButton {
//    private func setTitleNewExercise() {
//
//    }
//}

struct AddCustomExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomExerciseButton(icon: .constant("chest"))
    }
}
