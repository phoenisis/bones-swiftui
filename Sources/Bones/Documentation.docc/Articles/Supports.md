# 🧩 Supports

Components are groups of elements that work together to create a reusable, functional, and specific UI. They are the building blocks of a design system. They are also the most important part of a design system because they are the most reusable and flexible.

## Overview

Below are some examples showcasing how to use design Molecules in the Bones compared to regular SwiftUI vanilla syntax if there is any equivalent

### 💬 TextFields
**🍦 Vanilla**
```swift
TextField("Placeholder", text: $text)
  .textFieldStyle(.roundedBorder)

SecureField("Placeholder", text: $text)
  .textFieldStyle(.roundedBorder)
```
**🦴 Bones**
```swift
TextField("Placeholder", text: $text)
  .textFieldStyle(.bones)
  
TextField("Placeholder", text: $text)
  .textFieldStyle(.bonesSearch)

BoneSecureField("Placeholder", text: $text)
```
> [!NOTE]
> `BoneSecureField` add the show and hide password functionality.

### 📱 Buttons
**🍦 Vanilla**
```swift
Button("Tap me") { /* Action to perform on tap */ }
  .buttonStyle(.bordered)
```
**🦴 Bones**
```swift
Button("Bouger") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.homePlay))
Button("button with text") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.text(icon: .chevronRight)))
Button("small button") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.small(.fill)))
Button("small button outline") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.small(.outline)))
Button("medium button") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.medium(.fill(icon: .add))))
Button("medium button outline") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.medium(.outline(icon: .add))))
Button("large button") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.large(.fill(icon: .add, subtitle: "subtitle"))))
Button("large button outline") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.large(.outline(icon: .add, subtitle: "subtitle"))))
Button("") { /* Action to perform on tap */ }
  .buttonStyle(.bones(.tracker(.round(.play))))
``` 

### Avatars
An avatar is an image that represents a user, a group, or a bot. It can be used as a profile picture or as a way to visually distinguish between users.

**Usage**
```swift
BonesAvatarView(size: .small, avatarType: .user, imageUrl: nil)
```

### Tags
A tag is a small piece of information that is attached to a larger piece of information. It is used to provide additional context or to highlight important information.
```Swift
TagView("Placeholder", icon: nil, style: .primary)
```
