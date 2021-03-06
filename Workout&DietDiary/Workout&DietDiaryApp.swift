//
//  NeumorphTestApp.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

@main
struct NeumorphTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RealmManager())
                .preferredColorScheme(.light)
        }
    }
}
