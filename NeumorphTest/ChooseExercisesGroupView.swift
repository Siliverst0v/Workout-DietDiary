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
    
    @Binding var muscleGroups: [[String]]
    @State var muscleGroup = Exercises.shared

    
    let columns = [GridItem(.adaptive(minimum: 100))]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)

    
    var body: some View {
        VStack {
            Text("Выбери группу мыщц")
                .foregroundColor(blueColor)
                .fontWeight(.bold)
                .padding()
            LazyVGrid(columns: columns, spacing: 30) {
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.chest,
                    isPressed: $chestIsVisible,
                    title: "Грудь")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.shoulders,
                    isPressed: $shouldersIsVisible,
                    title: "Плечи")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.back,
                    isPressed: $backIsVisible,
                    title: "Спина")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.biceps,
                    isPressed: $bicepsIsVisible,
                    title: "Бицепс")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.triceps,
                    isPressed: $tricepsIsVisible,
                    title: "Трицепс")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.legs,
                    isPressed: $legsIsVisible,
                    title: "Ноги")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.abs,
                    isPressed: $absIsVisible,
                    title: "Пресс")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.forearms,
                    isPressed: $forearmsIsVisible,
                    title: "Предплечья")
                SimpleButton(
                    muscleGroups: $muscleGroups,
                    muscleGroup: $muscleGroup.cardio,
                    isPressed: $cardioIsVisible,
                    title: "Кардио")

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
        ChooseExercisesGroupView(muscleGroups: .constant([[""]]))
            .previewInterfaceOrientation(.portrait)
    }
}
