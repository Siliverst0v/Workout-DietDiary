//
//  ChoosenSetsView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 24.06.2022.
//

import SwiftUI
import RealmSwift

struct ChoosenSetsView: View {
    @EnvironmentObject var realmManager: RealmManager
    @ObservedRealmObject var choosenExercise: ChoosenExercise
    @FocusState var isFocused: Bool?

    @Binding var buttonIsNotPressed: Bool
    let width: CGFloat
    
    var body: some View {
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
                Text("Вес/Время")
                    .fontWeight(.semibold)
                    .foregroundColor(.customRed)
                    .padding(.leading, 5)
            }
            .font(.system(size: 14))
            .padding(.top, 60)
            ForEach($choosenExercise.sets, id: \.self) { setNumber in
                HStack {
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
                        .focused($isFocused, equals: true)
                        .frame(width: 84)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 8)
                    TextField("0", text: setNumber.weight)
                        .focused($isFocused, equals: true)
                        .frame(width: 60)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 10)
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    Button(action: { addSet() }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(.customBlue)
                            .frame(width: 50,
                                   height: 28,
                                   alignment: .init(horizontal: .center,
                                                    vertical: .bottom) )
                            .background(
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.2),
                                            radius: 10, x: 5, y: 5)
                                    .shadow(color: .white.opacity(0.7),
                                            radius: 10, x: -5, y: -5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 11)
                                            .stroke(Color.gray, lineWidth: 0.1)
                                    )
                            )
                    }
                    .disabled(choosenExercise.sets.count >= 10)
                    Button(action: { deleteSet() }) {
                        Text("-")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(.customRed)
                            .frame(width: 50,
                                   height: 28,
                                   alignment: .init(horizontal: .center,
                                                    vertical: .bottom) )
                            .background(
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.2),
                                            radius: 10, x: 5, y: 5)
                                    .shadow(color: .white.opacity(0.7),
                                            radius: 10, x: -5, y: -5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 11)
                                            .stroke(Color.gray, lineWidth: 0.1)
                                    )
                            )
                    }
                    .disabled(choosenExercise.sets.count <= 1)
                    .padding(.trailing, 20)
                    Button(action: { buttonIsNotPressed.toggle() }) {
                        Text("Сохранить")
                            .fontWeight(.semibold)
                            .frame(width: 140,
                                   height: 28,
                                   alignment: .center )
                            .foregroundColor(.customRed)
                            .background(
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.2),
                                            radius: 10, x: 5, y: 5)
                                    .shadow(color: .white.opacity(0.7),
                                            radius: 10, x: -5, y: -5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 11)
                                            .stroke(Color.gray, lineWidth: 0.1)
                                    )
                            )
                    }
                }
                .padding(.leading, 5)
                TextEditor(text: $choosenExercise.note)
                    .focused($isFocused, equals: true)
                    .foregroundColor(.customBlue)
                    .lineLimit(2)
                    .frame(width: UIScreen.main.bounds.size.width - 60,
                           height: 80)
                    .cornerRadius(10)
                    .offset(x: 10)
            }
        }
    }
    
    private func addSet() {
        if choosenExercise.sets.count <= 9 {
            realmManager.addSet(
                id: choosenExercise.id)
        }
    }
    
    private func deleteSet() {
        realmManager.deleteLastSet(id: choosenExercise.id)
    }
    

}

struct ChoosenSetsView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosenSetsView(choosenExercise: Exercises.shared.getMocExercise().choosenExercises.first!,
                        buttonIsNotPressed: .constant(false),
                        width: 374)
    }
}
