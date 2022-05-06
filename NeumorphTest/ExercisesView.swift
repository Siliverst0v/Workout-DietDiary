//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ExercisesView: View {
    @Binding var exercises: [ExerciseGroup]
    @State var choosenExercises: [String] = []
    @Binding var exerciseGroupsNames: [String]
    @State var date: Date
    @ObservedObject var workouts = Workouts()
    @Binding var workoutsIsActive: Bool
        
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                ForEach($exercises, id: \.id) {exerciseGroup in

                    TextField("", text: exerciseGroup.exerciseGroupName)
                        .font(.title)
                        .foregroundColor(.customRed)
                        .disabled(true)
                        .padding()
                    
                    ForEach(exerciseGroup.exercises, id: \.self) {exercise in
                        ExerciseButton(
                            title: exercise,
                            image: exerciseGroup.icon,
                            choosenExercises: $choosenExercises)
                    }
                }
            }
        Button(action: {
            workouts.workouts.append(Workout(
                date: date,
                exerciseGroupNames: exerciseGroupsNames,
                choosenExercises: choosenExercises))  }) {
                    Text("Append")
                }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        workouts.workouts.append(Workout(
                            date: date,
                            exerciseGroupNames: exerciseGroupsNames,
                            choosenExercises: choosenExercises))
                        workoutsIsActive = false
                    } label: {
                        Text("Готово")
                    }

                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink("Далее") {
//                        WorkoutsView(workouts: workouts)
//                    }
//                    .simultaneousGesture(TapGesture().onEnded{
//                        workouts.workouts.append(Workout(
//                            date: date,
//                            exerciseGroupNames: exerciseGroupsNames,
//                            choosenExercises: choosenExercises))
//
//                })
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(
            exercises: .constant(ExerciseGroup.getExercises()), exerciseGroupsNames: .constant([]),
                      date: Date(),
            workouts: Workouts.init(workouts: Workout.getWorkout()),
            workoutsIsActive: .constant(false))
    }
}
