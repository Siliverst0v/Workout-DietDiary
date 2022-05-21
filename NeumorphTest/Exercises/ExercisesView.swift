//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI
import RealmSwift


struct ExercisesView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @Binding var exercises: [ExerciseGroup]
    @Binding var exerciseGroupsNames: [String]
    @State var date: Date
//    @EnvironmentObject var workouts: Workouts
    @Binding var workoutsIsActive: Bool
    @State var choosenExerises: [ChoosenExercise] = []
    @State var realmWorkout = RealmWorkout()
    @State var realmChoosenExerises: [RealmChoosenExercise] = []

        
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
                            choosenExercises: $choosenExerises,
                            realmChoosenExerises: $realmChoosenExerises)
                        .environmentObject(realmManager)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                        workouts.workouts.append(Workout(
//                            date: date,
//                            exerciseGroupNames: exerciseGroupsNames,
//                            choosenExercises: choosenExerises))
                        
                        realmWorkout.exerciseGroups.append(objectsIn: exerciseGroupsNames)
                        realmWorkout.choosenExercises.append(objectsIn: realmChoosenExerises)
                        realmManager.addWorkout(date: date, exerciseGroups: realmWorkout.exerciseGroups, choosenExercises: realmWorkout.choosenExercises)
                        realmManager.getWorkouts()
                        
                            workoutsIsActive = false
                    } label: {
                        Text("Готово")
                    }

                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(
                exercises: .constant(ExerciseGroup.getExercises()),
                exerciseGroupsNames: .constant([]),
                date: Date(),
                workoutsIsActive: .constant(false), choosenExerises: [])
        .environmentObject(RealmManager())
    }
}
