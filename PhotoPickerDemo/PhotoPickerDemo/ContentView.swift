import SwiftUI
import PhotosUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("SinglePhoto", systemImage: "photo") {
                SinglePhotoPicker()
            }
            Tab("MultiPhoto", systemImage: "photo") {
                MultiPhotoPicker()
            }
        }
    }
}

#Preview {
    ContentView()
}
