//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesGroupView: View {
    let columns = [GridItem(.adaptive(minimum: 100))]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 30) {
                SimpleButton(action: {}, title: "Грудь")
                SimpleButton(action: {}, title: "Плечи")
                SimpleButton(action: {}, title: "Спина")
                SimpleButton(action: {}, title: "Бицепс")
                SimpleButton(action: {}, title: "Трицепс")
                SimpleButton(action: {}, title: "Ноги")
                SimpleButton(action: {}, title: "Пресс")
                SimpleButton(action: {}, title: "Предплечья")
                SimpleButton(action: {}, title: "Кардио")

            }
            ZStack {
                Image("Body")
                    .resizable()
                Image("Back")
                    .resizable()
                Image("Chest")
                    .resizable()
                Image("Biceps")
                    .resizable()
                Image("Triceps")
                    .resizable()
                Image("Abs")
                    .resizable()
                Image("ForeArms")
                    .resizable()
                Image("Legs")
                    .resizable()
                Image("Shoulders")
                    .resizable()
            }
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 314, alignment: .center)
            .padding(50)
        }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesGroupView()
            .previewInterfaceOrientation(.portrait)
    }
}
