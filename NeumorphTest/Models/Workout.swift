//
//  Workout.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 01.05.2022.
//

import Combine
import Foundation

final class Workouts: ObservableObject {
    
    @Published var workouts: [Workout] = []
    
    init() {}
    
    init(workouts: [Workout]) {
        self.workouts = workouts
    }
}

struct Workout: Identifiable, Equatable, Hashable {
    
    let id: UUID = UUID()
    let date: Date
    let exerciseGroupNames: [String]
    var choosenExercises: [ChoosenExercise]
}

extension Workout {
    static func getWorkout() -> [Workout] {
        return [Workout(
                    date: Date(),
                    exerciseGroupNames: ["Спина", "Грудь"],
                    choosenExercises: []),
                Workout(
                    date: Date(),
                    exerciseGroupNames: ["Плечи", "Трицепс"],
                    choosenExercises: [])
                ]
    }
}
