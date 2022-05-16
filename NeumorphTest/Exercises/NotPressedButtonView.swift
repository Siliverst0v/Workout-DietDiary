//
//  NotPressedButtonView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct NotPressedButtonView: View {
    @Binding var pressed: Bool
    @Binding var changeColorButton: Bool
    @Binding var choosenExercises: [ChoosenExercise]
    @Binding var sets: [Set] 
    
    let image: String
    let title: String

    var body: some View {
        ZStack{
        Button( action: { pressed.toggle() } ) {
            GeometryReader { geometry in
                let width = geometry.size.width
            Image(image)
                .resizable()
                .frame(width: 70, height: 40)
                .offset(x: 10, y: 15)
            Text(title)
            .fontWeight(.semibold)
            .lineLimit(3)
            .frame(width: width - 130, height: 60, alignment: .leading)
            .offset(x: 85, y: 5)
                Button(action: { addExercise() }) {
                Image(systemName: "checkmark.square")
                    .font(.system(size: 20))
                    .foregroundColor(changeColorButton ? .customBlue : .gray)
                    .frame(width: 40, height: 40, alignment: .center)
                }
                .offset(x: width - 45, y: 15)
            }
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 70, alignment: .center)
            }
        }
    }
    
    func addExercise() {
        changeColorButton.toggle()
        let choosenExercise = ChoosenExercise(
            icon: image,
            title: title,
            sets: sets)
        
        let choosenExerciseRealm = RealmChoosenExercise(icon: image, title: title)
        sets.forEach { sett in
            choosenExerciseRealm.sets.append(RealmSet(id: sett.id, repeats: sett.repeats, weight: sett.weight))
        }
        
        if changeColorButton {
            choosenExercises.append(choosenExercise)
        } else {
            choosenExercises.removeAll(where: {$0.title == choosenExercise.title})
        }
    }
}

struct NotPressedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NotPressedButtonView(
            pressed: .constant(true),
            changeColorButton: .constant(true),
            choosenExercises: .constant([]),
            sets: .constant([
                Set(id: 1, repeats: "", weight: ""),
                Set(id: 2, repeats: "", weight: ""),
                Set(id: 3, repeats: "", weight: "")]),
            image: "CellChest",
            title: "Exercise"
        )
    }
}
