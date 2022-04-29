//
//  ExerciseButtonModel.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import Combine
import Foundation

struct Exercise: Identifiable, Equatable {
    
    let id: UUID = UUID()
    let header: String
    let image: String
    let muscleGroup: String
    
}
