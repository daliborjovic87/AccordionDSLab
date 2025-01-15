
import SwiftUI

struct TapLeftSides: View {
    @State private var mainParts: [MainPartsModel] = []
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                // Zamenom id broja menjamo poziciju teksta u json
                if let firstPart = mainParts.first(where: { $0.id == 1 }) {
                    
                    Text(firstPart.name).font(.headline)
                    
                    Text(firstPart.description).padding(.bottom, 10)
                    
                    // Možete dodati prikaz bulletsa ako postoje (u ovom slučaju su prazni)
                    if !firstPart.bullets.isEmpty {
                        ScrollView(.horizontal) {
                            
                            HStack(spacing : 20){
                                ForEach(firstPart.bullets,id:\.self){bullet in
                                    Text(bullet).padding().background(Color.blue.opacity(0.2)).cornerRadius(8)}
                            }.frame(height :100)// dodajte visinu ako trebate
                            
                        }.frame(maxHeight:.infinity ,alignment:.top)// dodajte visinu ako trebate
                        
                    }
                    
                } else {
                    ProgressView("Učitavanje...")
                }
            }
        }
        .onAppear(perform: decodeMainParts)
    }
    
    private func decodeMainParts() {
        if let url = Bundle.main.url(forResource: "mainparts", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                mainParts = try JSONDecoder().decode([MainPartsModel].self, from: data)
            } catch {
                print("Error decoding JSON data:\(error)")
            }
        } else {
            print("Failed to locate the file.")
        }
    }
    
}

struct TapLeftSides_Previews: PreviewProvider {
    
    static var previews : some View{
        return TapLeftSides()
        
    }
}
