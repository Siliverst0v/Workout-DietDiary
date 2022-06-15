//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ExerciseGroupButton: View {
    @Binding var exercisesToDisplay: [ExerciseGroup]

    let exerciseGroup: ExerciseGroup
    
    var body: some View {
        Button(action: { addingGroup() }) {
            Text("\(exerciseGroup.title)")
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
        
        if !exercisesToDisplay.contains(where: {$0.title == exerciseGroup.title}) {
            exercisesToDisplay.append(exerciseGroup)
        } else {
            exercisesToDisplay.removeAll(where: {$0.exercisesToDisplay == exerciseGroup.exercisesToDisplay})
        }
    }
    
    func showIcon() -> Bool {
        if exercisesToDisplay.filter({$0.title == exerciseGroup.title}).first != nil {
            return true
        }
        
        return false
    }
}

struct ExerciseGroupButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGroupButton(
            exercisesToDisplay: .constant([]),
            exerciseGroup: ExerciseGroup(
                date: Date(),
                title: "",
                icon: "",
                exercisesToDisplay: []))
    }
}
