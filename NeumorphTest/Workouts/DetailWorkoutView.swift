//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct DetailWorkoutView: View {
    @EnvironmentObject var realmManager: RealmManager
    @Binding var choosenExercises: [RealmChoosenExercise]
    
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
        let exerciseToDelete = choosenExercises[index]
        choosenExercises.remove(at: index)
        
        exerciseToDelete.sets.forEach { sett in
            realmManager.delete(set: sett)
        }
            realmManager.deleteChoosenExercise(id: exerciseToDelete.id)
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView(choosenExercises: .constant([]))
    }
}
