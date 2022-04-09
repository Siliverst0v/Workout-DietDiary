//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack{
            VStack{
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            }
        }
        .ignoresSafeArea()
    }
}



struct NeuromorphicRectangleCell: View {
    @State var notTapped = false
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var image = "CellChest"
    @State var test = "10"
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


struct ButtonContent: View {
    
    @Binding var tapValue: Bool
    @Binding var image: String
    @Binding var title: String
    @Binding var test: String
    
    var body: some View {
        if tapValue {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 70, height: 36)
            Text(title)
            .fontWeight(.bold)
            Button(action: {}) {
                Image(systemName: "pencil")
            }
        }
        } else {
            HStack {
            VStack {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 70, height: 36)
                Text(title)
                .fontWeight(.bold)
                Button(action: {}) {
                    Image(systemName: "trash")
                }
            }
            
                HStack {
                    Text("Подходы")
                        .fontWeight(.semibold)
                        .padding(.horizontal)
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
                HStack {
                    Text("1")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        .padding(.horizontal, 50)
                    TextField("10", text: $test)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("10", text: $test)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                HStack {
                    Text("2")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        .padding(.horizontal, 50)
                    TextField("10", text: $test)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("10", text: $test)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                HStack {
                    Text("3")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        .padding(.horizontal, 50)
                    TextField("10", text: $test)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal, 50)
                    TextField("10", text: $test)
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                        .padding(.horizontal)
                }
                HStack {
                Button(action: {}) {
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
                        Text("<")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    .frame(width: 88, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
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
                Button(action: {}) {
                    Text("<")
                        Image(systemName: "memories")
                        .padding(.trailing,8)
                }
                .font(.system(size: 17))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                .frame(width: 30, height: 105, alignment: .center )
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
                .padding(.top, 40)
            }
        }
    }
}


struct CustomButtonStyle: ButtonStyle {
    @Binding var didTapped: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        if didTapped {
        configuration.label
            .font(.system(size: 17))
            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
            .frame(width: 390, height: 50)
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
                .font(.system(size: 17))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                .padding(.vertical, 10)
                .frame(width: 390, height: 250, alignment: .top)
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
