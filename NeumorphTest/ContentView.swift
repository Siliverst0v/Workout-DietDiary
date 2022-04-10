//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
            ScrollView {
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
                TappedCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            }
        }
    }




struct NeuromorphicRectangleCell: View {
    @State var notTapped = true
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var image = "CellChest"
    @State var test = ""
    var body: some View {
        ZStack{
            Button( action: {
                if notTapped {
                    notTapped.toggle()
                } else {
                    notTapped.toggle()
                }
            })
            {
                ButtonContent(tapValue: $notTapped, image: $image, title: $title, test: $test)
            }
            .buttonStyle(CustomButtonStyle(didTapped: $notTapped))
        }
    }
}

struct TappedCell: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
        Image("TappedCell")
            .resizable()
            .frame(width: 360, height: 270)
            HStack(alignment: .top, spacing: 0) {
                VStack(spacing: 5) {
                    HStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .frame(width: 70, height: 36)
                    .padding(.trailing, 5)
                Text(title)
                    .fontWeight(.semibold)
                    .frame(width: 220)
                    .lineLimit(3)
                    .scaledToFill()
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                }
                .padding(.vertical, 10)
                HStack(alignment: .center) {
                    Text("Подходы")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    Text("Повторения")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        .padding(.leading, 20)
                    Text("Вес(Кг)")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                }
                    HStack(alignment: .center) {
                    Text("1")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.leading, 33)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                HStack(alignment: .center) {
                    Text("2")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.leading, 30)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                HStack(alignment: .center) {
                    Text("3")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.leading, 30)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                Button(action: {  }) {
                    Text("+")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                .padding(.trailing,200)
            }
                VStack(alignment: .center, spacing: 33) {
                Button(action: {}) {
                    Image(systemName: "checkmark")
                }
                .frame(width: 40, height: 40, alignment: .center )
                .font(.system(size: 20))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                Button(action: {}) {
                        Image(systemName: "memories")
                        .padding(.trailing, 1)
                }
                .frame(width: 30, height: 105, alignment: .center )
                .font(.system(size: 17))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                Button(action: {}) {
                        Image(systemName: "arrowtriangle.up.fill")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
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
                .padding(.trailing, 10)
                .padding(.top, 10)
            }
        }
    }
}

struct ButtonContent: View {
    
    @Binding var tapValue: Bool
    @Binding var image: String
    @Binding var title: String
    @Binding var test: String
    
    var body: some View {
        if tapValue {
            HStack(alignment: .center, spacing: 5) {
            Image(image)
                .resizable()
                .frame(width: 70, height: 36)
                .padding(.trailing, 1)
            Text(title)
            .fontWeight(.semibold)
            .lineLimit(3)
            .frame(width: 220)
            .padding(.trailing, 2)
            Button(action: {}) {
                Image(systemName: "checkmark")
                    .font(.system(size: 20))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.trailing, 10)
            }
        }
        } else {
            HStack {
            VStack {
                HStack(alignment: .center, spacing: 1) {
                Image(image)
                    .resizable()
                    .frame(width: 70, height: 36)
                Text(title)
                    .fontWeight(.semibold)
                    .frame(width: 200)

            }
                HStack {
                    Text("Подходы")
                        .fontWeight(.semibold)
                        .padding(.trailing, 10)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    Text("Повторения")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        .padding(.horizontal)
                    Text("Вес(Кг)")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        .padding(.horizontal, 1)
                }
                Spacer(minLength: 1)
                HStack {
                    Text("1")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                        .disabled(false)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                        .disabled(false)
                }
                Spacer(minLength: 3)
                HStack {
                    Text("2")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                Spacer(minLength: 3)
                HStack {
                    Text("3")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                    TextField("0", text: $test)
                        .frame(width: 60, alignment: .center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                HStack {
                Button(action: {  }) {
                    Text("+")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    
                .padding(.leading, 30)
                    Button(action: {}) {
                        Image(systemName: "arrowtriangle.up.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                    .frame(width: 88, height: 28 )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.leading, 80)
                    Spacer()
                }
            }
                VStack {
                Button(action: {}) {
                    Image(systemName: "checkmark")
                }
                .frame(width: 40, height: 40, alignment: .center )
                .font(.system(size: 20))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                .padding(.trailing, 10)
                Button(action: {}) {
                        Image(systemName: "memories")
                        .padding(.trailing, 1)
                }
                .frame(width: 30, height: 105, alignment: .center )
                .font(.system(size: 17))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                .padding(.trailing, 10)
                .padding(.top, 25)
                    Spacer()
                
                }
            }
        }
    }
}


struct CustomButtonStyle: ButtonStyle {
    @Binding var didTapped: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        if didTapped {
        configuration.label
            .font(.system(size: 14))
            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
            .frame(width: 360, height: 70, alignment: .trailing)
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
                .padding(.vertical, 5)
        } else {
            configuration.label
                .font(.system(size: 14))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                .padding(.vertical, 10)
                .frame(width: 360, height: 250, alignment: .top)
                    .background(
                        RoundedRectangle(cornerRadius: 11)
                            .fill(.white)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.gray, lineWidth: 4)
                                        .blur(radius: 8)
                                        .offset(x: 2, y: 2)
                                        .mask(RoundedRectangle(cornerRadius: 11).fill(LinearGradient(Color.black, Color.clear)))
                                )
                            .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.gray, lineWidth: 4)
                                        .blur(radius: 8)
                                        .offset(x: -2, y: -2)
                                        .mask(RoundedRectangle(cornerRadius: 11).fill(LinearGradient(Color.clear, Color.black)))
                                )
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray, lineWidth: 0.1)
                            )
                    )
                    .padding(.vertical, 5)
        }
    }
}


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
