//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ExerciseGroupButton: View {
    @Binding var muscleGroups: [ExerciseGroup]
    @Binding var isPressed: Bool
    @Binding var exerciseGroups: [String]
    @Binding var date: Date

    let muscleGroup: ExerciseGroup
    let title: String
    
    var body: some View {
        Button(action: { addingGroup() }) {
        Text("\(title)")
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
            muscleGroups.append(muscleGroup)
            exerciseGroups.append(title)
        } else {
            muscleGroups.removeAll(where: {$0.exercises == muscleGroup.exercises})
            exerciseGroups.removeAll(where: {$0 == title})
        }
    }
}

struct ExerciseGroupButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseGroupButton(
            muscleGroups: .constant([]),
            isPressed: .constant(false),
            exerciseGroups: .constant([]),
            date: .constant(Date()),
            muscleGroup: ExerciseGroup(
                date: Date(),
                exerciseGroupName: "",
                icon: "",
                exercises: []),
            title: "Exercise Group")
    }
}
