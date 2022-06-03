//
//  NotPressedButtonView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct NotPressedButtonView: View {
    @Binding var pressed: Bool
    @Binding var exerciseAdded: Bool
    @Binding var sets: [Set]
    @Binding var realmChoosenExerises: [RealmChoosenExercise]
    @Binding var date: Date

    
    @Binding var image: String
    @Binding var title: String
    @Binding var note: String

    var body: some View {
        ZStack{
        Button( action: { pressed.toggle() } ) {
            GeometryReader { geometry in
                let width = geometry.size.width
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 40)
                    Text(title)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .frame(width: width - 160,
                               height: 60,
                               alignment: .leading)
                        .padding(.leading)
                    }
                    .padding(.init(top: 5,
                                   leading: 16,
                                   bottom: 0,
                                   trailing: 0))
                
                Button(action: { addExercise() }) {
                    Image(systemName: "checkmark.square")
                        .font(.system(size: 20))
                        .foregroundColor(.customBlue)
                        .frame(width: 40,
                               height: 40,
                               alignment: .center)
                    }
                    .offset(x: width - 45, y: 15)
                }
                .frame(width:UIScreen.main.bounds.size.width - 40,
                       height: 70, alignment: .center)
            }
            .buttonStyle(ExerciseButtonStyle())
        }
    }
    
    func addExercise() {
        exerciseAdded.toggle()
        
        let choosenExerciseRealm = RealmChoosenExercise(icon: image,
                                                        title: title,
                                                        note: note,
                                                        date: date)
        sets.forEach { sett in
            choosenExerciseRealm.sets.append(RealmSet(id: sett.id,
                                                      repeats: sett.repeats,
                                                      weight: sett.weight))
        }
        
        if exerciseAdded {
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
            exerciseAdded: .constant(true),
            sets: .constant([
                Set(id: 1, repeats: "", weight: ""),
                Set(id: 2, repeats: "", weight: ""),
                Set(id: 3, repeats: "", weight: "")]),
            realmChoosenExerises: .constant([]),
            date: .constant(Date()),
            image: .constant("chest"),
            title: .constant("Exercise"),
            note: .constant("...")
        )
    }
}
