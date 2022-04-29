//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct SimpleButton: View {
    @Binding var muscleGroups: [[String]]
    let muscleGroup: [String]
    @Binding var isPressed: Bool
    
    let title: String
    let imageName: String
    @Binding var imageNames: [String]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    
    var body: some View {
        Button(action: { addingGroup() }) {
        Text("\(title)")
            .foregroundColor(blueColor)
            .fontWeight(.medium)
            .padding()
    }
    .scaledToFit()
    .buttonStyle(SimpleButtonStyle(isPressed: $isPressed))
    }
    
    func addingGroup() {
        isPressed.toggle()
        if isPressed {
            muscleGroups.append(muscleGroup)
            imageNames.append(imageName)
            print(muscleGroups)
        } else {
            guard let index = muscleGroups.firstIndex(of: muscleGroup) else {return}
            guard let imageIndex = imageNames.firstIndex(of: imageName) else {return}
            muscleGroups.remove(at: index)
            imageNames.remove(at: imageIndex)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton(
            muscleGroups: .constant([[]]),
            muscleGroup: [],
            isPressed: .constant(true),
            title: "",
            imageName: "",
            imageNames: .constant([]))
    }
}
