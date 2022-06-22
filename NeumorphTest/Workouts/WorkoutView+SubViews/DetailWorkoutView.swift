//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI
import RealmSwift

struct DetailWorkoutView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @ObservedRealmObject var workout: Workout
    @FocusState var isFocused: Bool?
    
    @State private var icon: String = ""
    @State var deleteMode = false
        
    var body: some View {

            ScrollView {
                ForEach(workout.choosenExercises, id: \.id) { choosenExercise in
                    ChoosenExerciseButtonView(
                        isFocused: _isFocused,
                        choosenExercise: choosenExercise,
                        deleteMode: $deleteMode,
                        action: {deleteChoosenExercise(choosenExerciseId: choosenExercise.id)})
                        .environmentObject(realmManager)
                }
                .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                deleteMode.toggle()
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.customRed)
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
                .padding()
        }
    }
}

extension DetailWorkoutView {
    private func deleteChoosenExercise(choosenExerciseId: ObjectId) {
        guard let exerciseToDelete = workout.choosenExercises.first(where: { $0.id == choosenExerciseId }) else {return}
            realmManager.deleteAllSets(choosenExerciseId: exerciseToDelete.id)
            realmManager.deleteChoosenExercise(id: exerciseToDelete.id)
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView(workout: Workout())
    }
}
