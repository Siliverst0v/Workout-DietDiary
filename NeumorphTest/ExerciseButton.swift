//
//  ExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 17.04.2022.
//

import SwiftUI

struct ExerciseButton: View {
    @State var notTapped = false
    @State var title = "ExercisefjdshjfhskjdfhksjdhfksExercisefjdshjfhskjdfh"
    @State var image = "CellChest"
    @State var test = ""
    @State var changeColorButton = true
    @State var setsCount = 3
    @State var setCount = [1]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)
    
    var body: some View {
        if notTapped {
            ZStack{
                Button( action: { notTapped.toggle() } ) {
                    GeometryReader { geometry in
                        let width = geometry.size.width
                        let height = geometry.size.height
                        
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 40)
                        .offset(x: 0, y: 15)
                    Text(title)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .frame(width: width - 130, height: 60, alignment: .center)
                    .offset(x: 75, y: 5)
                        Button(action: { changeColorButton.toggle() }) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 20))
                            .foregroundColor(changeColorButton ? .gray : blueColor)
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                        .offset(x: width - 45, y: 15)
                }
                    .frame(width: UIScreen.main.bounds.size.width - 40, height: 70, alignment: .center)
            }
            .buttonStyle(CustomButtonStyle())
            }
        } else {
                
            ZStack {
            Image("TappedCell")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 270)
                GeometryReader { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height

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
//                    VStack {
                    HStack {
                    Text("Подходы")
                        .fontWeight(.semibold)
                        .foregroundColor(redColor)
                        .offset(x: width * 0.05 , y: height * 0.22)
                    Text("Повторения")
                        .fontWeight(.semibold)
                        .foregroundColor(redColor)
                        .offset(x: width * 0.07, y: height * 0.22)
                    Text("Вес(Кг)")
                        .fontWeight(.semibold)
                        .foregroundColor(redColor)
                        .offset(x: width * 0.1, y: height * 0.22)
                    }
                    .font(.system(size: 14))
                    HStack(alignment: .center) {
                    Text("1")
                        .fontWeight(.semibold)
                        .frame(width: 64)
                        .font(.system(size: 17))
                        .foregroundColor(blueColor)
                        .offset(x: width * 0.05, y: height * 0.3)
                    TextField("0", text: $test)
                        .frame(width: 84, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: width * 0.07, y: height * 0.3)
                    TextField("0", text: $test)
                        .frame(width: 53, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: width * 0.1, y: height * 0.3)
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 270)
            }
        }
    }
    
    private func checkmarkButtonAction() {
        notTapped.toggle()
        changeColorButton.toggle()
    }
}


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
        ExerciseButton()
    }
}
