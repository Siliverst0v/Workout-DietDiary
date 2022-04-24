//
//  ExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 17.04.2022.
//

import SwiftUI

struct ExerciseButton: View {
    @State var notTapped = true
    @Binding var title: String
    @State var image = "CellChest"
    @State var test = ""
    @State var changeColorButton = true
    @State var setCount = 3
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)
    @State var backgroundHeight: CGFloat = 270
    
    var body: some View {
        if notTapped {
            ZStack{
                NotPressedButtonView(
                    pressed: $notTapped,
                    changeColorButton: $changeColorButton,
                    image: image,
                    title: title
                )
            .buttonStyle(CustomButtonStyle())
            }
        } else {
            ZStack {
            Image("TappedCell")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight)
                GeometryReader { geometry in
                    let width = geometry.size.width
                Image(image)
                    .resizable()
                    .frame(width: 70, height: 40)
                    .offset(x: 0, y: 15)
                Text(title)
                .fontWeight(.semibold)
                .font(.system(size: 14))
                .foregroundColor(blueColor)
                .lineLimit(3)
                .frame(width: width - 120, height: 60, alignment: .center)
                .offset(x: 70, y: 5)
                    Button(action: { checkmarkButtonAction() }) {
                    Image(systemName: "checkmark")
                        .font(.system(size: 20))
                        .foregroundColor(changeColorButton ? .gray : blueColor)
                        .frame(width: 40, height: 40, alignment: .center)
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
                    .offset(x: width - 45, y: 15)
                    VStack(alignment: .leading) {
                    HStack {
                        if width < 370 {
                    Text("Подходы")
                        .fontWeight(.semibold)
                        .foregroundColor(redColor)
                        .padding(.leading, 20)
                        } else {
                            Text("Подходы")
                                .fontWeight(.semibold)
                                .foregroundColor(redColor)
                                .padding(.leading, 20)
                                .padding(.trailing, 30)
                        }
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(redColor)
                            .padding(.leading, 8)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(redColor)
                            .padding(.leading, 15)
                    }
                    .font(.system(size: 14))
                    .padding(.top, 60)
                        ForEach(1...setCount, id: \.self) { setNumber in
                            HStack(alignment: .center) {
                                if width < 370 {
                                Text("\(setNumber)")
                                    .fontWeight(.semibold)
                                    .frame(width: 64)
                                    .font(.system(size: 17))
                                    .foregroundColor(blueColor)
                                    .padding(.leading, 20)

                                } else {
                                    Text("\(setNumber)")
                                        .fontWeight(.semibold)
                                        .frame(width: 64)
                                        .font(.system(size: 17))
                                        .foregroundColor(blueColor)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 30)
                                }
                                TextField("0", text: $test)
                                    .frame(width: 84, alignment: .center)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.leading, 8)
                                TextField("0", text: $test)
                                    .frame(width: 60, alignment: .center)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.leading, 10)
                            }
                        }
                        HStack {
                            Button(action: { plusButtonAction() }) {
                                Text("+")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .foregroundColor(blueColor)
                            }
                            .font(.system(size: 17))
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                            .disabled(setCount >= 10)
                            Button(action: { minusButtonAction() }) {
                                Text("-")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .foregroundColor(redColor)
                            }
                            .font(.system(size: 17))
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                            .disabled(setCount <= 1)
                            .padding(.trailing, 20)
                            Button(action: { notTapped.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
                            }
                            .frame(width: 100, height: 28, alignment: .center )
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
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
                        .padding(.leading, 5)
                    }
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: changeButtonSize(), alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(blueColor)
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
                    .offset(x: width - 40, y: changeMemoryButtonPosition())
                }
                .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight)
            }
        }
    }
    
    private func checkmarkButtonAction() {
        notTapped.toggle()
        changeColorButton.toggle()
    }
    
    private func plusButtonAction() {
        setCount += 1
        backgroundHeight += 46
    }
    
    private func minusButtonAction() {
        setCount -= 1
        backgroundHeight -= 46
    }
    
    private func changeButtonSize() -> CGFloat {
        var buttonSize: CGFloat = 127
        if setCount < 3 && setCount > 1 {
            buttonSize = 83
        } else if setCount == 1 {
            buttonSize = 44
        }
        return buttonSize
    }
    
    private func changeMemoryButtonPosition() -> CGFloat {
        var buttonPosition: CGFloat = backgroundHeight * 0.32
        if setCount < 3 && setCount > 1 {
            buttonPosition = backgroundHeight * 0.38
        } else if setCount == 1 {
            buttonPosition = backgroundHeight * 0.46
        }
        return buttonPosition
    }
}

//struct BottomButtons: View {
//    @Binding var setCount: Int
//    @Binding var notTapped: Bool
//
//    var body: some View {
//        HStack {
//            Button(action: { self.setCount += 1 }) {
//                Text("+")
//                    .font(.system(size: 25))
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//            }
//            .font(.system(size: 17))
//            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//            .frame(width: 50, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
//            .background(
//                RoundedRectangle(cornerRadius: 11)
//                    .fill(.white)
//                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
//                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 11)
//                            .stroke(Color.gray, lineWidth: 0.1)
//                    )
//            )
//            Button(action: { self.setCount -= 1}) {
//                Text("-")
//                    .font(.system(size: 25))
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
//            }
//            .font(.system(size: 17))
//            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//            .frame(width: 50, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
//            .background(
//                RoundedRectangle(cornerRadius: 11)
//                    .fill(.white)
//                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
//                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 11)
//                            .stroke(Color.gray, lineWidth: 0.1)
//                    )
//            )
//            .padding(.trailing, 20)
//            Button(action: { notTapped.toggle() }) {
//                Image(systemName: "arrowtriangle.up.fill")
//            }
//            .frame(width: 100, height: 28, alignment: .center )
//            .font(.system(size: 20))
//            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
//            .background(
//                RoundedRectangle(cornerRadius: 11)
//                    .fill(.white)
//                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
//                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 11)
//                            .stroke(Color.gray, lineWidth: 0.1)
//                    )
//            )
//        }
//    }
//
//    private func changeSetCount(_ setCount: Binding<Int>) -> Int {
//        $setCount.wrappedValue += 1
//        return setCount.wrappedValue
//    }
//}

//struct SetStack: View {
//    @Binding var setCount: Int
//    @Binding var test: String
//    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
//
//    var body: some View {
//        ForEach(1..<self.setCount) { setNumber in
//            HStack(alignment: .center) {
//                Text("\(setNumber)")
//                    .fontWeight(.semibold)
//                    .frame(width: 64)
//                    .font(.system(size: 17))
//                    .foregroundColor(blueColor)
//                    .padding(.leading, 20)
//                TextField("0", text: $test)
//                    .frame(width: 84, alignment: .center)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.leading, 8)
//                TextField("0", text: $test)
//                    .frame(width: 53, alignment: .center)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.leading, 10)
//            }
//        }
//    }
//}

struct CustomButtonStyle: ButtonStyle {
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .foregroundColor(blueColor)
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 70, alignment: .center)
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

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct ExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseButton(title: .constant("Exercise for example"))
    }
}