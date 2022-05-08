//
//  ChoosenExercise.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 08.05.2022.
//

import Foundation

final class ChoosenExercises: ObservableObject {
    @Published var choosenExercises: [ChoosenExercise] = []
    
    init() {}
    
    init(choosenExercises: [ChoosenExercise]) {
        self.choosenExercises = choosenExercises
    }
    
}

struct ChoosenExercise: Identifiable, Equatable, Hashable {
    let id = UUID()
    var icon: String
    var exercise: String
}
