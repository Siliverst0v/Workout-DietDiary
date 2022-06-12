//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ExerciseGroupButton: View {
    @Binding var exercisesToDisplay: [ExerciseGroup]
    @Binding var isPressed: Bool
//    @Binding var exerciseGroupNames: [String]
    @Binding var date: Date

    let muscleGroup: ExerciseGroup
    
    var body: some View {
        Button(action: { addingGroup() }) {
            Text("\(muscleGroup.exerciseGroupName)")
                .foregroundColor(isPressed ? Color.customRed : Color.customBlue)
                .fontWeight(.medium)
                .padding()
    }
    .scaledToFit()
    .buttonStyle(ExerciseGroupButtonStyle(isPressed: $isPressed))
    }
}

extension ExerciseGroupButton {
    func addingGroup() {
        
        isPressed.toggle()
        if isPressed {
            exercisesToDisplay.append(muscleGroup)
//            exerciseGroupNames.append(muscleGroup.exerciseGroupName)
        } else {
            exercisesToDisplay.removeAll(where: {$0.exercises == muscleGroup.exercises})
//            exerciseGroupNames.removeAll(where: {$0 == muscleGroup.exerciseGroupName})
        }
    }
}

struct ExerciseGroupButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGroupButton(
            exercisesToDisplay: .constant([]),
            isPressed: .constant(false),
//            exerciseGroupNames: .constant([]),
            date: .constant(Date()),
            muscleGroup: ExerciseGroup(
                date: Date(),
                exerciseGroupName: "",
                icon: "",
                exercises: []))
    }
}
