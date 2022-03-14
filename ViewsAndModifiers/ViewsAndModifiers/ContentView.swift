import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")

    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }

    var body: some View {
        VStack {
            spells
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

