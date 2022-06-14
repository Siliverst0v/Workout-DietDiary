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
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Грудь",
                            icon: "chest",
                            exercisesToDisplay: muscleGroups.chest))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Плечи",
                            icon: "shoulders",
                            exercisesToDisplay: muscleGroups.shoulders))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Спина",
                            icon: "back",
                            exercisesToDisplay: muscleGroups.back))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Бицепс",
                            icon: "biceps",
                            exercisesToDisplay: muscleGroups.biceps))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Трицепс",
                            icon: "triceps",
                            exercisesToDisplay: muscleGroups.triceps))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Ноги",
                            icon: "legs",
                            exercisesToDisplay: muscleGroups.legs))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Пресс",
                            icon: "abs",
                            exercisesToDisplay: muscleGroups.abs))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Предплечья",
                            icon: "forearms",
                            exercisesToDisplay: muscleGroups.forearms))
                    ExerciseGroupButton(
                        exercisesToDisplay: $exercisesToDisplay,
                        muscleGroup: ExerciseGroup(
                            date: date,
                            exerciseGroupName: "Кардио",
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
                        exercises: $exercisesToDisplay,
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
