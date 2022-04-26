//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesGroupView: View {
    @State var backIsVisible = false
    @State var chestIsVisible = false
    @State var bicepsIsVisible = false
    @State var tricepsIsVisible = false
    @State var absIsVisible = false
    @State var forearmsIsVisible = false
    @State var legsIsVisible = false
    @State var shouldersIsVisible = false
    @State var cardioIsVisible = false

    
    let columns = [GridItem(.adaptive(minimum: 100))]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)

    
    var body: some View {
        VStack {
            Text("Выбери группу мыщц")
                .foregroundColor(blueColor)
                .fontWeight(.bold)
                .padding()
            LazyVGrid(columns: columns, spacing: 30) {
                SimpleButton(isPressed: $chestIsVisible, title: "Грудь")
                SimpleButton(isPressed: $shouldersIsVisible, title: "Плечи")
                SimpleButton(isPressed: $backIsVisible, title: "Спина")
                SimpleButton(isPressed: $bicepsIsVisible, title: "Бицепс")
                SimpleButton(isPressed: $tricepsIsVisible, title: "Трицепс")
                SimpleButton(isPressed: $legsIsVisible, title: "Ноги")
                SimpleButton(isPressed: $absIsVisible, title: "Пресс")
                SimpleButton(isPressed: $forearmsIsVisible, title: "Предплечья")
                SimpleButton(isPressed: $cardioIsVisible, title: "Кардио")

            }
            ZStack {
                Image("Body")
                    .resizable()
                Image("Back")
                    .resizable()
                    .opacity(backIsVisible ? 1 : 0)
                Image("Chest")
                    .resizable()
                    .opacity(chestIsVisible ? 1 : 0)
                Image("Biceps")
                    .resizable()
                    .opacity(bicepsIsVisible ? 1 : 0)
                Image("Triceps")
                    .resizable()
                    .opacity(tricepsIsVisible ? 1 : 0)
                Image("Abs")
                    .resizable()
                    .opacity(absIsVisible ? 1 : 0)
                Image("ForeArms")
                    .resizable()
                    .opacity(forearmsIsVisible ? 1 : 0)
                Image("Legs")
                    .resizable()
                    .opacity(legsIsVisible ? 1 : 0)
                Image("Shoulders")
                    .resizable()
                    .opacity(shouldersIsVisible ? 1 : 0)
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
