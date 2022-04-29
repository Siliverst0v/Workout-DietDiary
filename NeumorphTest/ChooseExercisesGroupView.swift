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
    
    @State var exercises: [[String]]
    @State var exercisesImages: [String]
    let muscleGroups = Exercises.shared

    
    let columns = [GridItem(.adaptive(minimum: 100))]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns, spacing: 30) {
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.chest,
                        isPressed: $chestIsVisible,
                        title: "Грудь",
                        imageName: "chest",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.shoulders,
                        isPressed: $shouldersIsVisible,
                        title: "Плечи",
                        imageName: "chest",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.back,
                        isPressed: $backIsVisible,
                        title: "Спина",
                        imageName: "back",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.biceps,
                        isPressed: $bicepsIsVisible,
                        title: "Бицепс",
                        imageName: "biceps",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.triceps,
                        isPressed: $tricepsIsVisible,
                        title: "Трицепс",
                        imageName: "triceps",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.legs,
                        isPressed: $legsIsVisible,
                        title: "Ноги",
                        imageName: "legs",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.abs,
                        isPressed: $absIsVisible,
                        title: "Пресс",
                        imageName: "abs",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.forearms,
                        isPressed: $forearmsIsVisible,
                        title: "Предплечья",
                        imageName: "forearms",
                        imageNames: $exercisesImages)
                    SimpleButton(
                        muscleGroups: $exercises,
                        muscleGroup: muscleGroups.cardio,
                        isPressed: $cardioIsVisible,
                        title: "Кардио",
                        imageName: "cardio",
                        imageNames: $exercisesImages)

                }
                ZStack {
                    Image("Body")
                        .resizable()
                    Image("BackBody")
                        .resizable()
                        .opacity(backIsVisible ? 1 : 0)
                    Image("ChestBody")
                        .resizable()
                        .opacity(chestIsVisible ? 1 : 0)
                    Image("BicepsBody")
                        .resizable()
                        .opacity(bicepsIsVisible ? 1 : 0)
                    Image("TricepsBody")
                        .resizable()
                        .opacity(tricepsIsVisible ? 1 : 0)
                    Image("AbsBody")
                        .resizable()
                        .opacity(absIsVisible ? 1 : 0)
                    Image("ForeArmsBody")
                        .resizable()
                        .opacity(forearmsIsVisible ? 1 : 0)
                    Image("LegsBody")
                        .resizable()
                        .opacity(legsIsVisible ? 1 : 0)
                    Image("ShouldersBody")
                        .resizable()
                        .opacity(shouldersIsVisible ? 1 : 0)
                    Image("CardioBody")
                        .resizable()
                        .opacity(cardioIsVisible ? 1 : 0)
                }
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 314, alignment: .center)
                .padding(50)
                NavigationLink(destination: ContentView(
                    exercises: exercises,
                exercisesImages: exercisesImages)) {
                        Text("Next")
                }
                .buttonStyle(.bordered)
            }
            .navigationTitle(
                Text("Выбери группу мыщц"))
        }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesGroupView(exercises:([[]]), exercisesImages: [])
            .previewInterfaceOrientation(.portrait)
    }
}
