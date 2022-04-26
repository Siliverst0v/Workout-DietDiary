//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesGroupView: View {
    @State var backIsHidden = false
    @State var chestIsHidden = false
    @State var bicepsIsHidden = false
    @State var tricepsIsHidden = false
    @State var absIsHidden = false
    @State var forearmsIsHidden = false
    @State var legsIsHidden = false
    @State var shouldersIsHidden = false
    @State var cardioIsHidden = false

    
    let columns = [GridItem(.adaptive(minimum: 100))]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)

    
    var body: some View {
        VStack {
            Text("Выбери группу мыщц")
                .foregroundColor(blueColor)
                .fontWeight(.bold)
                .padding()
            LazyVGrid(columns: columns, spacing: 30) {
                SimpleButton(isPressed: $chestIsHidden, title: "Грудь")
                SimpleButton(isPressed: $shouldersIsHidden, title: "Плечи")
                SimpleButton(isPressed: $backIsHidden, title: "Спина")
                SimpleButton(isPressed: $bicepsIsHidden, title: "Бицепс")
                SimpleButton(isPressed: $tricepsIsHidden, title: "Трицепс")
                SimpleButton(isPressed: $legsIsHidden, title: "Ноги")
                SimpleButton(isPressed: $absIsHidden, title: "Пресс")
                SimpleButton(isPressed: $forearmsIsHidden, title: "Предплечья")
                SimpleButton(isPressed: $cardioIsHidden, title: "Кардио")

            }
            ZStack {
                Image("Body")
                    .resizable()
                Image("Back")
                    .resizable()
                    .opacity(backIsHidden ? 1 : 0)
                Image("Chest")
                    .resizable()
                    .opacity(chestIsHidden ? 1 : 0)
                Image("Biceps")
                    .resizable()
                    .opacity(bicepsIsHidden ? 1 : 0)
                Image("Triceps")
                    .resizable()
                    .opacity(tricepsIsHidden ? 1 : 0)
                Image("Abs")
                    .resizable()
                    .opacity(absIsHidden ? 1 : 0)
                Image("ForeArms")
                    .resizable()
                    .opacity(forearmsIsHidden ? 1 : 0)
                Image("Legs")
                    .resizable()
                    .opacity(legsIsHidden ? 1 : 0)
                Image("Shoulders")
                    .resizable()
                    .opacity(shouldersIsHidden ? 1 : 0)
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
