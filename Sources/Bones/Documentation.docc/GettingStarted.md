# Getting Started

Set up Bones to work with your project.


###  Custom colors or spacing (Optional)

If you omit this optional step, Bones components will use the default colors and spacing for all components.

```swift
Bones(
    colors: [
        .background: "#F5F5F5",
        .forground: "#000000",
        .primary: "#15d14a",
        .primaryForeground: "#000000",
        .secondary: "#2215d1",
        .secondaryForeground: "#FFFFFF",
        .textLight: "#FFFFFF",
        .textDark: "#000000"
    ],
    spacing: [
        .small: 8,
        .medium: 16,
        .xMedium: 24,
        .large: 32,
        .xLarge: 64
    ]
)
```

#### Colors and Spacing can be overridden at any time

```swift
Bones.overrideColors(
    [
        .background: "#F5F5F5",
        .forground: "#000000",
        .primary: "#15d14a",
        .primaryForeground: "#000000",
        .secondary: "#2215d1",
        .secondaryForeground: "#FFFFFF",
        .textLight: "#FFFFFF",
        .textDark: "#000000"
    ]
)
Bones.overrideColor(.primary, with: "#2215d1")

Bones.overrideSpacing(
    [
        .small: 8,
        .medium: 16,
        .xMedium: 24,
        .large: 32,
        .xLarge: 64
    ]
)
Bones.overrideSpacing(.small, with: 10)
```


### Import the Bones package
@TutorialReference(tutorial: "doc:01-01-hello_bones")

Include Bones package in your package or project and add `import Bones` to a SwiftUI file to access Bones foundations and components.
```swift
import Bones
```
