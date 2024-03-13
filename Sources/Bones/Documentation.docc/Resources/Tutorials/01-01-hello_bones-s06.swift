import Bones
import SwiftUI

struct ContentView: View {
  var body: some View {
    Button("Hello, world!", action: {})
      .buttonStyle(.bones(.small(.fill)))
  }

  init() {
    Bones.overrideColor(.primary, with: "#f7bc6f")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
