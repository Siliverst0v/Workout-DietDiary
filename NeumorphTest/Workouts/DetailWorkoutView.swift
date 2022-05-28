//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct DetailWorkoutView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State var choosenExercises: [RealmChoosenExercise]
    
    var body: some View {

            ScrollView {
                ForEach($choosenExercises.indices, id: \.self) {index in
                    ChoosenExerciseButton(
                        choosenExercise: $choosenExercises[index],
                        action: {deleteChoosenExercise(index: index)}
                    )
                        .environmentObject(realmManager)
                        .listRowSeparator(.hidden)
                }
                .padding()
        }
    }
}

extension DetailWorkoutView {
    private func deleteChoosenExercise(index: Int) {
        choosenExercises.remove(at: index)
        let result = realmManager.choosenExercises.filter { !choosenExercises.contains($0) }
        result.forEach { exercise in
            exercise.sets.forEach { sett in
                realmManager.delete(set: sett)
            }
            realmManager.deleteChoosenExercise(id: exercise.id)
        }
    }
    
    private func fetchChoosenExercises() {
        realmManager.getChoosenExercises()
        let result = realmManager.choosenExercises.filter { !choosenExercises.contains($0) }
        result.forEach { exercise in
            choosenExercises.append(exercise)
        }
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView(choosenExercises: [])
    }
}
