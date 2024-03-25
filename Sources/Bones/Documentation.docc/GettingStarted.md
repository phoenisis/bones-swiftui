# Getting Started with Bones

Bones is a SwiftUI component library which provides developers tools to build interface with Squadeasy like interface.

## Overview

Bones aims to bring order and consistency to all of our products and processes. We elevate user experience and increase the speed and efficiency of how we design and build products.
Bones is an open-source design system created for specific needs of Kiwi.com and together with that – for needs of travel projects.

This library allows you to integrate the Bones Design System into your iOS SwiftUI project.

Set up Bones to work with your project.


###  Custom colors or spacing (Optional)

If you omit this optional step, Bones components will use the default colors and spacing for all components.

```swift
Bones.configure(
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
Bones.update(
  .colors(
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
)

Bones.update(
  .color(.primary, with: "#2215d1")
)

Bones.update(
  .spacings(
    [
      .small: 8,
      .medium: 16,
      .xMedium: 24,
      .large: 32,
      .xLarge: 64
    ]
  )
)

Bones.update(
  .spacing(.small, with: 10)
)
```


### Import the Bones package
@TutorialReference(tutorial: "doc:01-01-hello_bones")

Include Bones package in your package or project and add `import Bones` to a SwiftUI file to access Bones foundations and components.
```swift
import Bones
```
