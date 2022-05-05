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
    
    @State var exercises: [ExerciseGroup] = []
    @State var exerciseGroupNames: [String] = []
    @State var date: Date = Date()
    
    let muscleGroups = Exercise.shared
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
            VStack {
                DatePicker("Выбери дату тренировки", selection: $date, displayedComponents: .date)
                    .id(date)
                    .environment(\.locale, Locale.init(identifier: "ru"))
                    .datePickerStyle(.compact)
                    .foregroundColor(.customRed)
                    .font(.headline)
                    .padding(.horizontal)
                Text("Выбери группу упражнений")
                    .foregroundColor(.customRed)
                    .fontWeight(.semibold)
                    .padding()
                LazyVGrid(columns: columns, spacing: 30) {
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $chestIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Грудь",
                            icon: "chest",
                            exercises: muscleGroups.chest),
                        title: "Грудь")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $shouldersIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Плечи",
                            icon: "shoulders",
                            exercises: muscleGroups.shoulders),
                        title: "Плечи")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $backIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Спина",
                            icon: "back",
                            exercises: muscleGroups.back),
                        title: "Спина")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $bicepsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Бицепс",
                            icon: "biceps",
                            exercises: muscleGroups.biceps),
                        title: "Бицепс")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $tricepsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Трицепс",
                            icon: "triceps",
                            exercises: muscleGroups.triceps),
                        title: "Трицепс")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $legsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Ноги",
                            icon: "legs",
                            exercises: muscleGroups.legs),
                        title: "Ноги")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $absIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Пресс",
                            icon: "abs",
                            exercises: muscleGroups.abs),
                        title: "Пресс")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $forearmsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Предплечья",
                            icon: "forearms",
                            exercises: muscleGroups.forearms),
                        title: "Предплечья")
                    SimpleButton(
                        exercises: $exercises,
                        isPressed: $cardioIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        exercise: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Кардио",
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
                    exercises: $exercises,
                    exerciseGroupsNames: $exerciseGroupNames,
                    date: date, workouts: Workouts.init(workouts: []))) {
                        Text("Далее")
                            .foregroundColor(.customRed)
                            .padding()
                }
                    .navigationBarHidden(true)
                    .scaledToFit()
                    .buttonStyle(SimpleButtonStyle())
                    .opacity(exercises.isEmpty ? 0 : 1)
                    .disabled(exercises.isEmpty)
        }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesView(exercises: [], exerciseGroupNames: [], date: Date())
            .previewInterfaceOrientation(.portrait)
    }
}
