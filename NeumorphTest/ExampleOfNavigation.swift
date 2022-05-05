//
//  ExampleOfNavigation.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 06.05.2022.
//

import SwiftUI

struct ExampleOfNavigation: View {
    @State var array: [String] = []
    // originalIsActive is your bottom card, and you will carry a reference
    // through your views like a piece of twine.
    @State var originalIsActive = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(array, id: \.self) { element in
                    Text(element)
                }
            }
            .background(
                // This is a programatic NavigationLink that triggers when originalIsActive
                // becomes true. Placed in a background it sits and listens for originalIsActive.
                NavigationLink(isActive: $originalIsActive, destination: {
                    Details(array: $array, originalIsActive: $originalIsActive)
                }, label: {
                    // This is simply a nothing view, so you can't see the NavigationLink.
                    EmptyView()
                })
                // Necessary to prevent link pop back after this NavigationLink
                .isDetailLink(false)
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // This Button sets originalIsActive to true, activating the NavigationLink.
                        originalIsActive = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct Details: View {
    @Binding var array: [String]
    // Reference to originalIsActive
    @Binding var originalIsActive: Bool
    
    @State var detailsIsActive = false
    
    var body: some View {
        Button(action: { array.append("First Element") }) {
            Text("Append First Element")
        }
        .background(
            NavigationLink(isActive: $detailsIsActive, destination: {
                MoreDetails(array: $array, originalIsActive: $originalIsActive)
            }, label: {
                EmptyView()
            })
            // Necessary to prevent link pop back after this NavigationLink
            .isDetailLink(false)
        )
        .toolbar {
            Button {
                detailsIsActive = true
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}

struct MoreDetails: View {
    @Binding var array: [String]
    // Reference to originalIsActive
    @Binding var originalIsActive: Bool

    var body: some View {
        Button(action: { array.append("Second Element") }) {
            Text("Append Second Element")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // By setting originalIsActive to false, you pull out the bottom card.
                    // If the first link does not exist, none do.
                    originalIsActive = false
                } label: {
                    Text("Original")
                }

            }
        }
    }
}

struct ExampleOfNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ExampleOfNavigation()
    }
}
