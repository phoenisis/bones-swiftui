# 🎨 Tokens

Design tokens are the atoms of a design system — the smallest pieces, like colors, fonts, spacings, and shadows. Instead of hard coding these values, tokens allow for a more scalable, consistent, and maintainable system. By defining these tokens, it becomes easier to ensure that the design and the implementation remain synchronized.


## Overview

In the Bones, tokens are used to define and encapsulate fundamental design decisions. These can be easily overridden or extended for different projects, themes, or platforms, ensuring flexibility while maintaining consistency.

Below are some examples showcasing how to use design tokens in the Bones compared to regular SwiftUI vanilla syntax

### 🖋 Fonts
**🍦 Vanilla**
```swift
Text("Hello, World!")
  .font(.system(.title))
  .foregroundStyle(Color(.green))
```
**🦴 Bones**
```swift
Text("Hello, World!")
  .font(.custom(.bones(.title)))
  .foregroundStyle(Color(.bones(.primary)))
```

### 🌈 Colors
**🍦 Vanilla**
```swift
let primaryColor = Color(.green)
let secondaryColor = Color.blue
```
**🦴 Bones**
```swift
let primaryColor = Color(.bones(.primary))
let secondaryColor = Color.bones.secondary
```

##### 🖼 Images 
**🍦 Vanilla**
```swift 
Image(.add)
````
**🦴 Bones**
```swift
Image(.bones(.add))
```

### 📏 Padding
**🍦 Vanilla**
```swift
Text("Hello, World!")
  .padding(8)
Text("Hello, World!")
  .padding(.leading, 24)

HStack(spacing: 8) {}
HStack(alignment: top, spacing: 8) {}
VStack(alignment: trailing, spacing: 8) {}
```
**🦴 Bones**
```swift
Text("Hello, World!")
  .padding(.bones(.small))
Text("Hello, World!")
  .padding(.leading, .bones(.xLarge)) 
HStack(spacing: .bones(.small)) {}
HStack(alignment: .top, spacing: .bones(.small)) {}
VStack(spacing: .bones(.small)) {}
VStack(alignment: .trailing, spacing: .bones(.small)) {}
```

### 🌀 Radius
**🍦 Vanilla**
```swift
VStack {}
  .frame(width: 100, height: 100)
  .cornerRadius(8)
```
**🦴 Bones**
```swift
VStack {}
  .frame(width: 100, height: 100)
  .radius(.bones(.small))
VStack {}
  .frame(width: 100, height: 100)
  .radius(.bones(.medium))
```

### 🌑 Shadow
**🍦 Vanilla**
```swift
VStack {}
  .frame(width: 100, height: 100)
  .fill(Color.green)
  .shadow(radius: 8)
VStack {}
  .frame(width: 100, height: 100)
  .fill(Color.green)
  .shadow(color: .black, radius: 8, x: 0, y: 0)
```
**🦴 Bones**
```swift
VStack {}
  .frame(width: 100, height: 100)
  .fill(Color.bones.primary)
  .shadow(radius: .bones(.none))
VStack {}
  .frame(width: 100, height: 100)
  .fill(Color.bones.primary)
  .shadow(radius: .bones(.close))
VStack {}
  .frame(width: 100, height: 100)
  .fill(Color.bones.primary)
  .shadow(color: Color.bones.black, radius: .bones(.far))
```

### Haptic Feedback
**🦴 Bones**
```swift
Button("Tap me") {
// Action to perform on tap
}
.haptic(.medium)
```

### Shapes
```swift
BonesObsidianProfileShape()
```

