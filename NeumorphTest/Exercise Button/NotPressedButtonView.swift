//
//  NotPressedButtonView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct NotPressedButtonView: View {
    @Binding var pressed: Bool
    @State var choosenExercises: [String]
//TODO: - Заменить это свойство на добавление в массив упражнений
    @Binding var changeColorButton: Bool
    
    let image: String
    let title: String

    var body: some View {
        ZStack{
        Button( action: { pressed.toggle() } ) {
            GeometryReader { geometry in
                let width = geometry.size.width
            Image(image)
                .resizable()
                .frame(width: 70, height: 40)
                .offset(x: 10, y: 15)
            Text(title)
            .fontWeight(.semibold)
            .lineLimit(3)
            .frame(width: width - 130, height: 60, alignment: .leading)
            .offset(x: 85, y: 5)
                Button(action: { checkmarkButtonAction() }) {
                Image(systemName: "checkmark")
                    .font(.system(size: 20))
                    .foregroundColor(changeColorButton ? .customBlue : .gray)
                    .frame(width: 40, height: 40, alignment: .center)
                }
                .offset(x: width - 45, y: 15)
            }
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 70, alignment: .center)
            }
        }
    }
    
    func checkmarkButtonAction() {
//        pressed.toggle()
        changeColorButton.toggle()
        
        if changeColorButton {
        choosenExercises.append(title)
            print(choosenExercises)
        } else {
            choosenExercises.removeAll(where: {$0 == title})
            print(choosenExercises)
        }
    }
}

struct NotPressedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NotPressedButtonView(
            pressed: .constant(true), choosenExercises: [],
            changeColorButton: .constant(true),
            image: "CellChest",
            title: "Exercise"
        )
    }
}
