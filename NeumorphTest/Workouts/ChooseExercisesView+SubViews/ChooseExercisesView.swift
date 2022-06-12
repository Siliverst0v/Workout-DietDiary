//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesView: View {
    @EnvironmentObject var realmManager: RealmManager

    @State private var backIsVisible = false
    @State private var chestIsVisible = false
    @State private var bicepsIsVisible = false
    @State private var tricepsIsVisible = false
    @State private var absIsVisible = false
    @State private var forearmsIsVisible = false
    @State private var legsIsVisible = false
    @State private var shouldersIsVisible = false
    @State private var cardioIsVisible = false
    
    @State var exercises: [ExerciseGroup] = []
    @State var exerciseGroupNames: [String] = []
    @State var date: Date = Date()
    @State var chooseViewIsActive = false
    @State var muscleGroups = Exercises.shared
    
    @Binding var workoutsIsActive: Bool
        
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
            VStack {
                DatePicker("Выбери дату тренировки", selection: $date, displayedComponents: .date)
                    .id(date)
                    .environment(\.locale, Locale.init(identifier: "ru"))
                    .datePickerStyle(.compact)
                    .foregroundColor(.customRed)
                    .font(.headline)
                    .padding()
                Text("Выбери группу упражнений")
                    .foregroundColor(.customRed)
                    .fontWeight(.semibold)
                    .padding()
                LazyVGrid(columns: columns, spacing: 30) {
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $chestIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Грудь",
                            icon: "chest",
                            exercises: muscleGroups.chest),
                        title: "Грудь")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $shouldersIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Плечи",
                            icon: "shoulders",
                            exercises: muscleGroups.shoulders),
                        title: "Плечи")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $backIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Спина",
                            icon: "back",
                            exercises: muscleGroups.back),
                        title: "Спина")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $bicepsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Бицепс",
                            icon: "biceps",
                            exercises: muscleGroups.biceps),
                        title: "Бицепс")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $tricepsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Трицепс",
                            icon: "triceps",
                            exercises: muscleGroups.triceps),
                        title: "Трицепс")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $legsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Ноги",
                            icon: "legs",
                            exercises: muscleGroups.legs),
                        title: "Ноги")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $absIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Пресс",
                            icon: "abs",
                            exercises: muscleGroups.abs),
                        title: "Пресс")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $forearmsIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Предплечья",
                            icon: "forearms",
                            exercises: muscleGroups.forearms),
                        title: "Предплечья")
                    ExerciseGroupButton(
                        muscleGroups: $exercises,
                        isPressed: $cardioIsVisible,
                        exerciseGroups: $exerciseGroupNames,
                        date: $date,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Кардио",
                            icon: "cardio",
                            exercises: muscleGroups.cardio),
                        title: "Кардио")
                }
                BodyView(backIsVisible: $backIsVisible,
                         chestIsVisible: $chestIsVisible,
                         bicepsIsVisible: $bicepsIsVisible,
                         tricepsIsVisible: $tricepsIsVisible,
                         absIsVisible: $absIsVisible,
                         forearmsIsVisible: $forearmsIsVisible,
                         legsIsVisible: $legsIsVisible,
                         shouldersIsVisible: $shouldersIsVisible,
                         cardioIsVisible: $cardioIsVisible)
        }
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink(isActive: $chooseViewIsActive, destination: {
                    ExercisesView(
                        date: date, exercises: $exercises,
                        exerciseGroupsNames: $exerciseGroupNames,
                        workoutsIsActive: $workoutsIsActive)
                    .environmentObject(realmManager)
                }, label: {
                    EmptyView()
                })
                .isDetailLink(false)
            )
            .toolbar {
                Button {
                    chooseViewIsActive = true
                } label: {
                    Text("Далее")
                }
                .opacity(exercises.isEmpty ? 0 : 1)
                .disabled(exercises.isEmpty)
            }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesView(
            exercises: [],
            exerciseGroupNames: [],
            date: Date(),
            workoutsIsActive: .constant(false))
        .environmentObject(RealmManager())
            .previewInterfaceOrientation(.portrait)
    }
}
