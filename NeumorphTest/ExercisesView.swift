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
    @State var workouts: [Workout]
    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Далее") {
                        Workouts(workouts: workouts)
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        workouts.append(Workout(
                            date: date,
                            exerciseGroupName: exerciseGroupsNames,
                            choosenExercises: choosenExercises))
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(exercises: .constant(ExerciseGroup.getExercises()), exerciseGroupsNames: .constant([]), date: Date(), workouts: Workout.getWorkout())
    }
}
