import Bones
import SwiftUI

struct ContentView: View {
  var body: some View {
    Button("Hello, world!", action: {})
      .buttonStyle(.bones(.small(.fill)))
  }

  init() {
    Bones.configure(
      colors: [
        .primary: "#1ac91d",
        .primaryForeground: "#000000",
        .secondary: "#c91a49",
        .secondaryForeground: "#000000"
      ],
      spacing: [
        .small: 2,
        .medium: 4,
        .large: 8,
        .xLarge: 16
      ]
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
