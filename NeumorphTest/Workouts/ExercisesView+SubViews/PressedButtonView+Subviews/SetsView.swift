//
//  SetsView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 17.06.2022.
//

import SwiftUI

struct SetsView: View {
    @FocusState var isFocused: Bool?
    
    @Binding var sets: [MocSet]
    @Binding var note: String
    @Binding var buttonNotPressed: Bool
    
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
            ForEach($sets, id: \.id) { setNumber in
                HStack {
                    if width < 370 {
                        Text("\(setNumber.id)")
                            .fontWeight(.semibold)
                            .frame(width: 64)
                            .font(.system(size: 17))
                            .foregroundColor(.customBlue)
                            .padding(.leading, 20)
                        
                    } else {
                        Text("\(setNumber.id)")
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
                            .frame(width: 50, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
                            .background(
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 11)
                                            .stroke(Color.gray, lineWidth: 0.1)
                                    )
                            )
                    }
                    .disabled(sets.count >= 10)
                    Button(action: { deleteSet() }) {
                        Text("-")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(.customRed)
                            .frame(width: 50, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
                            .background(
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 11)
                                            .stroke(Color.gray, lineWidth: 0.1)
                                    )
                            )
                    }
                    .disabled(sets.count <= 1)
                    .padding(.trailing, 20)
                    Button(action: { buttonNotPressed.toggle() }) {
                        Text("Сохранить")
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 28, alignment: .center )
                            .foregroundColor(.customRed)
                            .background(
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 11)
                                            .stroke(Color.gray, lineWidth: 0.1)
                                    )
                            )
                    }
                }
                .padding(.leading, 5)
                TextEditor(text: $note)
                    .focused($isFocused, equals: true)
                    .foregroundColor(.customBlue)
                    .lineLimit(2)
                    .frame(width: UIScreen.main.bounds.size.width - 60, height: 80)
                    .cornerRadius(10)
                    .offset(x: 10)
            }
        }
    }
}

extension SetsView {
    
    private func addSet() {
        let newSet = MocSet(
                    id: sets.count + 1,
                    repeats: "",
                    weight: "")
        if sets.count <= 9 {
        sets.append(newSet)
        }
    }
    
    private func deleteSet() {
        sets.removeLast()
    }
}

struct SetsView_Previews: PreviewProvider {
    static var previews: some View {
        SetsView(sets: .constant([MocSet(id: 1, repeats: "", weight: ""),
                                  MocSet(id: 2, repeats: "", weight: ""),
                                  MocSet(id: 3, repeats: "", weight: "")]),
                 note: .constant("..."),
                 buttonNotPressed: .constant(false),
                 width: 0)
    }
}
