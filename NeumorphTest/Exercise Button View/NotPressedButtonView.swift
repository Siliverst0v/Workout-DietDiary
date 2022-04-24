//
//  NotPressedButtonView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct NotPressedButtonView: View {
    @Binding var pressed: Bool
    
//TODO: - Заменить это свойство на добавление в массив упражнений
    @Binding var changeColorButton: Bool
    
    let image: String
    let title: String
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)
    
    var body: some View {
        ZStack{
        Button( action: { pressed.toggle() } ) {
            GeometryReader { geometry in
                let width = geometry.size.width
            Image(image)
                .resizable()
                .frame(width: 70, height: 40)
                .offset(x: 0, y: 15)
            Text(title)
            .fontWeight(.semibold)
            .lineLimit(3)
            .frame(width: width - 130, height: 60, alignment: .leading)
            .offset(x: 75, y: 5)
                Button(action: { changeColorButton.toggle() }) {
                Image(systemName: "checkmark")
                    .font(.system(size: 20))
                    .foregroundColor(changeColorButton ? .gray : blueColor)
                    .frame(width: 40, height: 40, alignment: .center)
                }
                .offset(x: width - 45, y: 15)
            }
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 70, alignment: .center)
            }
        }
    }
}

struct NotPressedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NotPressedButtonView(
            pressed: .constant(true),
            changeColorButton: .constant(true),
            image: "CellChest",
            title: "Exercise"
        )
    }
}
