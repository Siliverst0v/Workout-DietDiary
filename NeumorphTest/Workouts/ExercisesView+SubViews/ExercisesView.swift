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
    @FocusState var isFocused: Bool?

    @State var choosenExercises: [ChoosenExercise] = []
    @State var date: Date
    
    @Binding var choosenExerciseGroups: [ExerciseGroup]
    @Binding var workoutsIsActive: Bool

        
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                ForEach($choosenExerciseGroups, id: \.id) {exerciseGroup in

                    TextField("", text: exerciseGroup.title)
                        .font(.title)
                        .foregroundColor(.customRed)
                        .disabled(true)
                        .padding()

                    ForEach(exerciseGroup.exercisesToDisplay, id: \.self) {exercise in
                        ExerciseButton(
                            isFocused: _isFocused,
                            title: exercise,
                            image: exerciseGroup.icon,
                            choosenExercises: $choosenExercises,
                            date: $date)
                        .environmentObject(realmManager)
                    }
                }
            }
            .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button { addWorkout() } label: {
                        Text("Готово")
                    }

                }
                ToolbarItemGroup(placement: .keyboard) {
                    HStack{
                        Spacer()
                        Button {
                            isFocused = nil
                        } label: {
                            Text("Готово")
                        }
                    }
                }
            }
    }
}

extension ExercisesView {
    func addWorkout() {
        
        realmManager.addWorkout(
            date: date,
            exerciseGroups: choosenExerciseGroups.map {$0.title},
            choosenExercises: choosenExercises)
        
                workoutsIsActive = false
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(
            date: Date(),
            choosenExerciseGroups: .constant(ExerciseGroup.getMocExercises()),
            workoutsIsActive: .constant(false))
        .environmentObject(RealmManager())
    }
}
