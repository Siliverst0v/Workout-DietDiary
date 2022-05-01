//
//  Workout.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 01.05.2022.
//

import Foundation

struct Workout: Identifiable, Equatable, Hashable {
    
    let id: UUID = UUID()
    let date: Date
    let muscleGroups: [String]
}
