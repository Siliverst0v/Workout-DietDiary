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
    
    @State var realmWorkout = Workout()
    @State var realmChoosenExerises: [ChoosenExercise] = []
    @State var date: Date
    
    @Binding var exercises: [ExerciseGroup]
//    @Binding var exerciseGroupsNames: [String]
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
                            realmChoosenExerises: $realmChoosenExerises,
                            date: $date)
                        .environmentObject(realmManager)
                    }
                }
            }
            .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    realmWorkout.exerciseGroups.append(
                        objectsIn: exercises.map {$0.exerciseGroupName})
                    
                    realmWorkout.choosenExercises.append(
                        objectsIn: realmChoosenExerises)
                    
                    realmManager.addWorkout(
                        date: date,
                        exerciseGroups: realmWorkout.exerciseGroups,
                        choosenExercises: realmWorkout.choosenExercises)
                    
                            workoutsIsActive = false
                    } label: {
                        Text("Готово")
                    }

                }
            }
    }
}

extension ExercisesView {
//    func addWorkout() {
//        realmWorkout.exerciseGroups.append(objectsIn: exerciseGroupsNames)
//        realmWorkout.choosenExercises.append(objectsIn: realmChoosenExerises)
//        realmManager.addWorkout(
//            date: date,
//            exerciseGroups: realmWorkout.exerciseGroups,
//            choosenExercises: realmWorkout.choosenExercises)
//
//            workoutsIsActive = false
//    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(
            date: Date(), exercises: .constant(ExerciseGroup.getMocExercises()),
//            exerciseGroupsNames: .constant([]),
                workoutsIsActive: .constant(false))
        .environmentObject(RealmManager())
    }
}
