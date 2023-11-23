import SwiftUI

struct Item3: Identifiable {
    var id: UUID = UUID()
    var imageName: String
    var title: String
    var description: String
}

class Item3ViewModel {
    var items3 = [
        Item3(imageName: "news", title: "New and Popular", description: "The latest meditations and top picks from our team"),
       
     
    ]
}

struct RectangleView: View {
    
    
    
    var viewModel3 = Item3ViewModel()
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .bold()
                .padding()
                .font(.title2)
            
            LazyVStack(spacing: 20) {
                ForEach(viewModel3.items3) { item3 in
                    HStack {
                        Image(item3.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 110, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading) {
                            Text(item3.title)
                                .font(.headline)
                                .bold()
                            
                            Text(item3.description)
                                .font(.subheadline)
                        }
                        
                       Spacer()
                        
                        Button(action: {
                            // Azione del pulsante
                        }) {
                            Image(systemName: "chevron.forward")
                                .resizable()
                                .frame(width: 8, height: 8)
                                .foregroundColor(Color.gray.opacity(0.5))
                                .padding(8)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(width: 350, height: 180))
                }
            }
            .padding()
        }
    }
}


struct ResourceDetail: View {
    
    
    
    @State private var isFavorite = false
    
    let videoURL = "https://www.youtube.com/watch?v=VIDEO_ID_HERE" // Sostituisci "VIDEO_ID_HERE" con l'ID del video di YouTube

    var body: some View {
        
        
        ScrollView(.vertical) {
            VStack {
                HStack {
                                    Text("How to Headspace")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Button(action: {
                                        isFavorite.toggle()
                                        // Aggiungi qui la logica per gestire i preferiti
                                        if isFavorite {
                                            // Aggiungi l'elemento ai preferiti
                                            // Esegui azioni di salvataggio o gestione dei dati qui
                                        } else {
                                            // Rimuovi l'elemento dai preferiti
                                            // Esegui azioni di rimozione o gestione dei dati qui
                                        }
                                    }) {
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                            .foregroundColor(isFavorite ? .red : .gray)
                                            .font(.title)
                                    }
                                }
                
                Text("video - 2 min")
                    .font(.subheadline)
                
                Image("headspace1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                
                Button(action: {
                    openYouTubeVideo()
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Play Video")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel("Play YouTube Video")
                
                //list
                
                ListaView()
     
               // Spacer()
                
                RectangleView(text: "Explore more about meditation")
            }
        }
    }
    
    
    
    
    func openYouTubeVideo() {
        if let url = URL(string: videoURL) {
            UIApplication.shared.open(url)
        }
    }
}

struct ResourceDetail_Previews: PreviewProvider {
    static var previews: some View {
        ResourceDetail()
    }
}



struct Items: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
}

struct ListaView: View {
    let items = [
        Items(imageName: "headspace1", title: "Basics", description: "Course 3-10 min"),
        Items(imageName: "breathe", title: "Breathe", description: "Meditation 1-5 min"),
        Items(imageName: "lettinggo", title: "Letting Go of Stress", description: "Course 10-20 min"),
        // Aggiungi altri oggetti se necessario
    ]

    //FEATURED LIST
    var body: some View {
        NavigationView {
            List(items) { item in
               
                HStack {
                               Image(item.imageName)
                                   .resizable()
                                   .frame(width: 50, height: 50)
                                   .cornerRadius(8)

                               VStack(alignment: .leading) {
                                   Text(item.title)
                                       .font(.headline)
                                   Text(item.description)
                                       .font(.subheadline)
                                       .foregroundColor(.gray)
                               }

                               Spacer()

                    Image(systemName: "chevron.forward")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(Color.gray.opacity(0.5))
                        .padding(8)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                           }
                
            }
            .navigationTitle("Featured")
        }
       
            Image(systemName: "rainbow")
        
            .resizable()
                .frame(width: 300, height: 160)
            //    .padding()
                .foregroundColor(Color.orange)
                .symbolEffect(
                    .variableColor.iterative.dimInactiveLayers.reversing
                    )
             //   .padding(.top, -50)
        
    }
}

struct DetailsView: View {
    var item: Items

    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()

            Text(item.title)
                .font(.title)

            Text(item.description)
                .font(.body)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle(item.title)
    }
}



