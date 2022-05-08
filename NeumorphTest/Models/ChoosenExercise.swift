//
//  ChoosenExercise.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 08.05.2022.
//

import Foundation

struct ChoosenExercise: Identifiable, Equatable, Hashable {
    let id = UUID()
    var icon: String
    var exercise: String
}

struct Sets:  Identifiable, Equatable, Hashable {
    let id = UUID()
    var setNumber: Int
    var set: Int
    var repeats: Int
}
