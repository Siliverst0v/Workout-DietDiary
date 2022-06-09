//
//  PreviousExercises.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 31.05.2022.
//

import SwiftUI

struct PreviousExercisesButton: View {
    @State var choosenExercise: ChoosenExercise
    
    @State var backgroundHeight: CGFloat = 238

    var body: some View {
        ZStack {
        Image("TappedCell")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width - 40,
                   height: backgroundHeight + CGFloat(((choosenExercise.sets.count - 1) * 42)))
            GeometryReader { geometry in
                let width = geometry.size.width
                HStack(alignment: .center) {
                Image(choosenExercise.icon)
                        .resizable()
                        .frame(width: 70, height: 40)
                Text(choosenExercise.title)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundColor(.customBlue)
                        .lineLimit(3)
                        .frame(width: width - 130,
                               height: 60,
                               alignment: .leading)
                        .padding(.leading)
                }
                .padding(.init(top: 5,
                               leading: 16,
                               bottom: 0,
                               trailing: 0))
                
                VStack(alignment: .leading) {
                HStack {
                    if width < 370 {
                Text("Подходы")
                    .fontWeight(.semibold)
                    .foregroundColor(.customRed)
                    .padding(.leading, 20)
                    } else {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(.customRed)
                            .padding(.init(top: 0,
                                           leading: 20,
                                           bottom: 0,
                                           trailing: 30))
                    }
                    Text("Повторения")
                        .fontWeight(.semibold)
                        .foregroundColor(.customRed)
                        .padding(.leading, 8)
                    Text("Вес(Кг)")
                        .fontWeight(.semibold)
                        .foregroundColor(.customRed)
                        .padding(.leading, 15)
                }
                .font(.system(size: 14))
                .padding(.top, 60)
                    
                    ForEach($choosenExercise.sets, id: \.id) { setNumber in
                        HStack(alignment: .center) {
                            if width < 370 {
                                Text("\(setNumber.id.wrappedValue)")
                                .fontWeight(.semibold)
                                .frame(width: 64)
                                .font(.system(size: 17))
                                .foregroundColor(.customBlue)
                                .padding(.leading, 20)

                            } else {
                                Text("\(setNumber.id.wrappedValue)")
                                    .fontWeight(.semibold)
                                    .frame(width: 64)
                                    .font(.system(size: 17))
                                    .foregroundColor(.customBlue)
                                    .padding(.init(top: 0,
                                                   leading: 20,
                                                   bottom: 0,
                                                   trailing: 30))
                            }
                            TextField("0", text: setNumber.repeats)
                                .frame(width: 84,
                                       alignment: .center)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 8)
                                .disabled(true)
                            TextField("0", text: setNumber.weight)
                                .frame(width: 60,
                                       alignment: .center)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10)
                                .disabled(true)
                        }
                    }
                    TextEditor(text: $choosenExercise.note)
                        .foregroundColor(.customBlue)
                        .lineLimit(2)
                        .frame(width: UIScreen.main.bounds.size.width - 60,
                               height: 80)
                        .cornerRadius(10)
                        .offset(x: 10)
                }
            }
            .frame(width: UIScreen.main.bounds.size.width - 40,
                   height: backgroundHeight + CGFloat(((choosenExercise.sets.count - 1) * 42)))
        }
    }
    
    private func changeButtonSize() -> CGFloat {
        var buttonSize: CGFloat = 127
        if choosenExercise.sets.count < 3 && choosenExercise.sets.count > 1 {
            buttonSize = 83
        } else if choosenExercise.sets.count == 1 {
            buttonSize = 44
        }
        return buttonSize
    }
}

struct PreviousExercisesButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviousExercisesButton(choosenExercise: Exercises.shared.getMocExercise())
    }
}
