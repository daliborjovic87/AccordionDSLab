import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        HStack {
            Text("My App")
                .font(.title)
            Spacer()
            Button(action: { print("Button tapped") }) {
                Image(systemName: "gear")
            }
        }
        .padding(.horizontal)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.33), radius: 5, x: 5, y: 5)
    }
}

struct ContentView2: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBar()
            
            // Ostali sadržaji...
            
            ScrollView {
                // MARK: - Categories
                HStack {
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.black)
                    Spacer()
                }
                // Promjenio boju na standardnu:
                .padding(.all)
                .overlay (
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                        .frame(height: 45)
                        .shadow(color:.black.opacity(0.5), radius :5,x :5,y :5))
                
                
                CustomDivider()
                
                ScrollView(.horizontal) {
                    CategoryGridView()
                }
                
                CustomDivider()
                
                VStack {
                    Text("All About accordion")
                    Text("About Author")
                }
                
                Spacer()
                
            }
            
        }
    }
}

struct ContentView2_Previews : PreviewProvider{
    static var previews:some View {
        ContentView2()
    }
}
