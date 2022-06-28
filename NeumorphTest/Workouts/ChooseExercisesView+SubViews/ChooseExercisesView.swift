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
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Грудь",
                            icon: "chest",
                            exercisesToDisplay: muscleGroups.chest))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Плечи",
                            icon: "shoulders",
                            exercisesToDisplay: muscleGroups.shoulders))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Спина",
                            icon: "back",
                            exercisesToDisplay: muscleGroups.back))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Бицепс",
                            icon: "biceps",
                            exercisesToDisplay: muscleGroups.biceps))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Трицепс",
                            icon: "triceps",
                            exercisesToDisplay: muscleGroups.triceps))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Ноги",
                            icon: "legs",
                            exercisesToDisplay: muscleGroups.legs))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Пресс",
                            icon: "abs",
                            exercisesToDisplay: muscleGroups.abs))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
                            title: "Предплечья",
                            icon: "forearms",
                            exercisesToDisplay: muscleGroups.forearms))
                    ExerciseGroupButtonView(
                        exercisesToDisplay: $exercisesToDisplay,
                        exerciseGroup: ExerciseGroup(
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
            workoutsIsActive: .constant(false))
        .environmentObject(RealmManager())
            .previewInterfaceOrientation(.portrait)
    }
}
