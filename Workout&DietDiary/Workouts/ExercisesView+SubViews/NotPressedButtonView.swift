//
//  NotPressedButtonView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct NotPressedButtonView: View {
    
    @Binding var buttonNotPressed: Bool
    @Binding var exerciseAdded: Bool
    @Binding var sets: [Set]
    @Binding var choosenExercises: [ChoosenExercise]
    @Binding var date: Date
    
    @Binding var image: String
    @Binding var title: String
    @Binding var note: String

    var body: some View {
        ZStack{
        Button( action: { buttonNotPressed.toggle() } ) {
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
                    Image(systemName: exerciseAdded ? "checkmark.square" : "square")
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
    
}

extension NotPressedButtonView {
    func addExercise() {
        exerciseAdded.toggle()
        
        let choosenExercise = ChoosenExercise(
            icon: image,
            title: title,
            note: note,
            date: date)
        
        sets.forEach { sett in
            choosenExercise.sets.append(
                Set(
                    id: sett.id,
                    repeats: sett.repeats,
                    weight: sett.weight))
        }
        
        if exerciseAdded {
            choosenExercises.append(choosenExercise)
        } else {
            choosenExercises.removeAll(where: {$0.title == choosenExercise.title})
        }
    }
}

struct NotPressedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NotPressedButtonView(
            buttonNotPressed: .constant(true),
            exerciseAdded: .constant(true),
            sets: .constant([
                Set(id: 1, repeats: "", weight: ""),
                Set(id: 2, repeats: "", weight: ""),
                Set(id: 3, repeats: "", weight: "")]),
            choosenExercises: .constant([]),
            date: .constant(Date()),
            image: .constant("chest"),
            title: .constant("Exercise"),
            note: .constant("...")
        )
    }
}
