//
//  ProvaView.swift
//  Headspace1
//
//  Created by Alessandra Amorico on 17/11/23.
//

import SwiftUI

import SwiftUI

struct TabBarExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ProvaView()
        }
    }
}



struct PrimaVista: View {
    var body: some View {
        // Sostituisci questo con il contenuto desiderato per la prima scheda
        NavigationView {
            ScrollView {
                GreetingView()
                    .padding(.trailing, 170.0)

                VStack {
                    NavigationLink(destination: ResourceDetail()) {
                        CardView(title: "How to headspace", description: "Video", minutes: "2 min", imageName: "headspace1")
                    }
                    .accentColor(.black)
                    
                    CardView(title: "Rooted in the Present", description: "Mindful Actvity", minutes: "2 min", imageName: "headspace2")
                    CardView(title: "Kindness takes courage", description: "Today's meditation", minutes: "3-20 min", imageName: "headcoffee")
                    CardView(title: "Techniques and Support", description: "Expert guidance", minutes: "2 min", imageName: "techniques")
                    
                    
                }
                .navigationTitle("Start your day")
                .navigationBarItems(trailing:
                    HStack {
                        Button(action: {
                            // Azione per l'immagine dell'orologio
                        }) {
                            Image(systemName: "clock.arrow.circlepath")
                        }

                        Button(action: {
                            // Azione per l'immagine del cuore
                        }) {
                            Image(systemName: "heart")
                        }
                    }
                )
            }
        }
    }
}



struct ProvaView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Primo Tab con la tua vista personalizzata
            PrimaVista()
                .tabItem {
                    Image(systemName: "sun.max.fill")
                    Text("Today")
                }
                .tag(0)
            
            // Altre schede con testo di esempio
            Text("Contenuto della scheda 2")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(1)
            
            Text("Contenuto della scheda 3")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(2)
        }
    }
}

struct ProvaView_Previews: PreviewProvider {
    static var previews: some View {
        ProvaView()
    }
}





// Vista della card che utilizza i dati dal database
struct CardView: View {
    
    var title: String
    var description: String
    var minutes: String
    var imageName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color(UIColor.systemGray5))
                .frame(width: 350, height: 150)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {

                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    Text(description)
                    Text(minutes)

                }
                .padding(.leading, 40)
                .frame(maxWidth: .infinity, alignment: .leading) // Garantisce uno spazio uniforme a sinistra

                
                Image(imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .frame(width: 150, height: 100)
                    .padding(.trailing, 40)
            }
        }
    }
}
