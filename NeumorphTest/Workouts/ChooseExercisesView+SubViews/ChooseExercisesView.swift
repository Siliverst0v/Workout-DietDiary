//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @State var exercisesToDisplay: [ExerciseGroup] = []
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
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Грудь",
                            icon: "chest",
                            exercisesToDisplay: muscleGroups.chest))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Плечи",
                            icon: "shoulders",
                            exercisesToDisplay: muscleGroups.shoulders))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Спина",
                            icon: "back",
                            exercisesToDisplay: muscleGroups.back))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Бицепс",
                            icon: "biceps",
                            exercisesToDisplay: muscleGroups.biceps))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Трицепс",
                            icon: "triceps",
                            exercisesToDisplay: muscleGroups.triceps))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Ноги",
                            icon: "legs",
                            exercisesToDisplay: muscleGroups.legs))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Пресс",
                            icon: "abs",
                            exercisesToDisplay: muscleGroups.abs))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Предплечья",
                            icon: "forearms",
                            exercisesToDisplay: muscleGroups.forearms))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            date: date,
                            title: "Кардио",
                            icon: "cardio",
                            exercisesToDisplay: muscleGroups.cardio))
                }
                BodyView(exercisesToDisplay: $exercisesToDisplay)
        }
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink(isActive: $chooseViewIsActive, destination: {
                    ExercisesView(
                        date: date,
                        choosenExerciseGroups: $exercisesToDisplay,
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
                .opacity(exercisesToDisplay.isEmpty ? 0 : 1)
                .disabled(exercisesToDisplay.isEmpty)
            }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesView(
            exercisesToDisplay: [],
            date: Date(),
            workoutsIsActive: .constant(false))
        .environmentObject(RealmManager())
            .previewInterfaceOrientation(.portrait)
    }
}
