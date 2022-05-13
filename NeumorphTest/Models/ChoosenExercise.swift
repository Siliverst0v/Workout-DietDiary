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
    var title: String
    var sets: [Set]
}

struct Set:  Identifiable, Equatable, Hashable {
    let id: Int
    var repeats: String
    var weight: String
}

