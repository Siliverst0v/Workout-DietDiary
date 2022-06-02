//
//  AddCustomExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 03.06.2022.
//

import SwiftUI

struct AddCustomExerciseButton: View {
    @Binding var icon: String
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                let width = geometry.size.width
                HStack {
                    Image(icon)
                        .resizable()
                        .frame(width: 70, height: 40)
                        .foregroundColor(.customRed)
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
                    .padding(.init(top: 5,
                                   leading: 16,
                                   bottom: 0,
                                   trailing: 0))
                Button(action: {  }) {
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

struct AddCustomExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomExerciseButton(icon: .constant("chest"))
    }
}
