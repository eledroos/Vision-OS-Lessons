import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ImmersiveView()

            VStack {
                HStack {
                    Text("Destination: Mars")
                        .font(.system(.largeTitle, design: .monospaced))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .padding(.leading, 70) // Additional left padding
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    Spacer() // Pushes the text to the left
                }
                .offset(z: 20) // Bring closer to the viewer
                
                Spacer() // This spacer will push everything below it to the center of the remaining space

                Button(action: {
                    // Action for the button can be defined here
                }) {
                    HStack {
                        Text("Start Exploring")
                        Image(systemName: "arrow.right")
                    }
                    .font(.system(.title, design: .monospaced))
                    .foregroundColor(Color.white.opacity(0.8))
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 30)
                .background(Color.white.opacity(0.1)) // Ensuring translucency
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                .contentShape(Capsule())
                .buttonStyle(PlainButtonStyle())
                .overlay(
                    Capsule()
                        .stroke(Color.clear, lineWidth: 0)
                        
                )
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                .offset(z: 20)
                .frame(maxWidth: .infinity)

                Spacer() // Another spacer to balance the layout

                HStack(spacing: 40) {
                    InfoView(text: "0.62 × 10²⁴", label: "Mass")
                    InfoView(text: "6792 km", label: "Diameter")
                    InfoView(text: "3934 km/m³", label: "Density")
                }
                .font(.system(size: 16, design: .monospaced))
                .foregroundColor(.white)
                .padding(.bottom, 50)
                .offset(z: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct InfoView: View {
    let text: String
    let label: String

    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(text)
                .bold()
            Text(label)
        }
    }
}
