//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct DetailWorkoutView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var icon: String = ""
    @State var deleteMode = false
    
    @Binding var choosenExercises: [ChoosenExercise]
    
    var body: some View {

            ScrollView {
                ForEach($choosenExercises.indices, id: \.self) {index in
                    ChoosenExerciseButton(
                        choosenExercise: $choosenExercises[index],
                        deleteMode: $deleteMode,
                        action: {deleteChoosenExercise(index: index)}
                    )
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
            realmManager.deleteSet(set: sett)
        }
            realmManager.deleteChoosenExercise(id: exerciseToDelete.id)
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView(choosenExercises: .constant([]))
    }
}
