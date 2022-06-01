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
    @Binding var sets: [Set]
    @Binding var realmChoosenExerises: [RealmChoosenExercise]

    
    let image: String
    let title: String
    @Binding var note: String

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
        
        let choosenExerciseRealm = RealmChoosenExercise(icon: image, title: title, note: "")
        sets.forEach { sett in
            choosenExerciseRealm.sets.append(RealmSet(id: sett.id, repeats: sett.repeats, weight: sett.weight))
        }
        
        if changeColorButton {
            realmChoosenExerises.append(choosenExerciseRealm)
        } else {
            realmChoosenExerises.removeAll(where: {$0.title == choosenExerciseRealm.title})
        }
    }
}

struct NotPressedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NotPressedButtonView(
            pressed: .constant(true),
            changeColorButton: .constant(true),
            sets: .constant([
                Set(id: 1, repeats: "", weight: ""),
                Set(id: 2, repeats: "", weight: ""),
                Set(id: 3, repeats: "", weight: "")]),
            realmChoosenExerises: .constant([]),
            image: "CellChest",
            title: "Exercise",
            note: .constant("...")
        )
    }
}
