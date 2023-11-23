//
//  GreetingView.swift
//  Headspace1
//
//  Created by Alessandra Amorico on 16/11/23.
//

import SwiftUI

struct GreetingView: View {
    @State private var greeting: String = ""
    
    var body: some View {
        VStack {
            Text(greeting)
                .font(.title2)
             
                .padding()
        }
        .onAppear {
            self.updateGreeting()
        }
    }
    
    func updateGreeting() {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 6..<12:
            self.greeting = "Good Morning ☀️"
        case 12..<17:
            self.greeting = "Good Afternoon 🌤️"
        case 17..<22:
            self.greeting = "Good Evening 🌙"
        default:
            self.greeting = "Good Night 🌕"
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
