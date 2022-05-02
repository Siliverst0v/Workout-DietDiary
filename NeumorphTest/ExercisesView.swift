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
//    @State var exerciseGroups: [String]
    @State var date: Date
    
    var body: some View {

        NavigationView{
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
            .navigationTitle("Welcome")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Далее") {
                        WorkoutButton(workout: Workout(
                            date: date,
                            exerciseGroupName: exerciseGroupsNames,
                            choosenExercises: choosenExercises))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(exercises: .constant(ExerciseGroup.getExercises()), exerciseGroupsNames: .constant([]), date: Date())
    }
}
