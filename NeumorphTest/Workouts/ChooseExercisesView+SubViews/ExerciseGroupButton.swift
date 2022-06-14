//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ExerciseGroupButton: View {
    @Binding var exercisesToDisplay: [ExerciseGroup]

    let muscleGroup: ExerciseGroup
    
    var body: some View {
        Button(action: { addingGroup() }) {
            Text("\(muscleGroup.exerciseGroupName)")
                .foregroundColor(showIcon() ? Color.customRed : Color.customBlue)
                .fontWeight(.medium)
                .padding()
    }
    .scaledToFit()
    .buttonStyle(ExerciseGroupButtonStyle(isPressed: showIcon()))
    }
}

extension ExerciseGroupButton {
    func addingGroup() {
        
        if !exercisesToDisplay.contains(where: {$0.exerciseGroupName == muscleGroup.exerciseGroupName}) {
            exercisesToDisplay.append(muscleGroup)
        } else {
            exercisesToDisplay.removeAll(where: {$0.exercisesToDisplay == muscleGroup.exercisesToDisplay})
        }
    }
    
    func showIcon() -> Bool {
        if exercisesToDisplay.filter({$0.exerciseGroupName == muscleGroup.exerciseGroupName}).first != nil {
            return true
        }
        
        return false
    }
}

struct ExerciseGroupButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGroupButton(
            exercisesToDisplay: .constant([]),
            muscleGroup: ExerciseGroup(
                date: Date(),
                exerciseGroupName: "",
                icon: "",
                exercisesToDisplay: []))
    }
}
