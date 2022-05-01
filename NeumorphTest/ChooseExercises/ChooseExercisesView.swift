//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesView: View {
    @State var backIsVisible = false
    @State var chestIsVisible = false
    @State var bicepsIsVisible = false
    @State var tricepsIsVisible = false
    @State var absIsVisible = false
    @State var forearmsIsVisible = false
    @State var legsIsVisible = false
    @State var shouldersIsVisible = false
    @State var cardioIsVisible = false
    
    @State var exercises: [Exercise]
    @State private var date = Date()
    
    let muscleGroups = Exercises.shared
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Выбери дату тренировки", selection: $date, displayedComponents: .date)
                    .id(date)
                    .environment(\.locale, Locale.init(identifier: "ru"))
                    .datePickerStyle(.compact)
                    .foregroundColor(redColor)
                    .font(.headline)
                    .padding()
                Text("Выбери группу упражнений")
                    .foregroundColor(redColor)
                    .fontWeight(.semibold)
                LazyVGrid(columns: columns, spacing: 30) {
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $chestIsVisible,
                        exercise: Exercise(
                            header: "Грудь",
                            icon: "chest",
                            exercises: muscleGroups.chest),
                        title: "Грудь")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $shouldersIsVisible,
                        exercise: Exercise(
                            header: "Плечи",
                            icon: "shoulders",
                            exercises: muscleGroups.shoulders),
                        title: "Плечи")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $backIsVisible,
                        exercise: Exercise(
                            header: "Спина",
                            icon: "back",
                            exercises: muscleGroups.back),
                        title: "Спина")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $bicepsIsVisible,
                        exercise: Exercise(
                            header: "Бицепс",
                            icon: "biceps",
                            exercises: muscleGroups.biceps),
                        title: "Бицепс")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $tricepsIsVisible,
                        exercise: Exercise(
                            header: "Трицепс",
                            icon: "triceps",
                            exercises: muscleGroups.triceps),
                        title: "Трицепс")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $legsIsVisible,
                        exercise: Exercise(
                            header: "Ноги",
                            icon: "legs",
                            exercises: muscleGroups.legs),
                        title: "Ноги")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $absIsVisible,
                        exercise: Exercise(
                            header: "Пресс",
                            icon: "abs",
                            exercises: muscleGroups.abs),
                        title: "Пресс")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $forearmsIsVisible,
                        exercise: Exercise(
                            header: "Предплечья",
                            icon: "forearms",
                            exercises: muscleGroups.forearms),
                        title: "Предплечья")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $cardioIsVisible,
                        exercise: Exercise(
                            header: "Кардио",
                            icon: "cardio",
                            exercises: muscleGroups.cardio),
                        title: "Кардио")
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
                NavigationLink(destination: ExercisesView(
                    exercises: $exercises)) {
                        Text("Далее ")
                            .foregroundColor(redColor)
                            .padding()
                }
                    .scaledToFit()
                    .buttonStyle(SimpleButtonStyle())
                    .opacity(exercises.isEmpty ? 0 : 1)
                    .disabled(exercises.isEmpty)
            }
            .navigationBarHidden(true)
        }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesView(exercises: [])
            .previewInterfaceOrientation(.portrait)
    }
}
