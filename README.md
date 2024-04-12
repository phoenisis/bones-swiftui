[![OS](https://img.shields.io/badge/iOS_>17-000000?style=fla&logo=ios&logoColor=white)](https://apple.com/) [![Language](https://img.shields.io/badge/Swift_5.9-FA7343?style=fla&logo=swift&logoColor=white)](https://swift.org/download/) [![Framework](https://img.shields.io/badge/SwiftUI_-4497ed?style=fla&logo=swift&logoColor=white)](https://developer.apple.com/documentation/swiftui/)

> [!IMPORTANT]
> 🚨 This current version of Bones is still in development. It is not yet ready for production use.

<h1 align="center">🦴 Bones iOS</h1>
<p align="center">Design System libraries for iOS applications</p>

## 🌐 Introduction
Bones Design System is the framework that helps our ecosystem design and develop consistent, high-quality experiences. It consists of rules, principles, and guidelines likes used to design.

To help developers avoid any design mistakes, we prefix all our design system elements with the `bones` keyword. We also prefer to scope any type into a `bones` namespace enum.

## 📦 Installation

### Swift Package Manager
1. Append Bones to your package's dependency array
    ```swift
    dependencies: [
      .package(
        url: "https://github.com/phoenisis/bones-swiftui",
        .upToNextMajor(from: "0.0.0")
      ),
      // Any other dependencies...
    ],
    ```

2. Subsequently, integrate Bones to any target's dependency array requiring it
```swift
  .target(
    name: "YourSwiftTarget",
    dependencies: [
      .product(
        name: "Bones", 
        package: "bones-swiftui"
      ),
      // Any other dependencies...
    ]
  ),
```

## ✨ Available Elements
This Design System is intended to align closely with the SwiftUI base modifier signature. This way, you can use it as follows

- [🎨 Tokens](Documentations/Tokens.md)
- [🧩 Components](Documentations/Components.md)
- [🧱 Templates](Documentations/Templates.md)

## 💪 Contributing
To ensure consistent code quality and adherence to best practices, we've integrated tools to help automate the process. Please follow the steps below to set up your development environment

### 1️⃣ Install Required Tools
- [SwiftLint](https://github.com/realm/SwiftLint) This is a tool to enforce Swift style and conventions
```bash 
brew install swiftlint
```
- [pre-commit](https://pre-commit.com/#installation) This tool is used to manage and maintain pre-commit hooks 
```bash 
brew install pre-commit
```
### 2️⃣ Set Up Pre-commit Hook
After installing the necessary tools, set up the pre-commit hook by running the following command

```bash
echo '#!/usr/bin/env bash
./Scripts/process.sh --fail-on-errors

failed=$?
exit $failed' > .git/hooks/pre-commit-test && chmod +x .git/hooks/pre-commit-test
```
This command creates a hook in your .git directory, which will be executed before each commit. If the script encounters any errors, the commit will be aborted

> [!NOTE]
> Ensure you're in your project's root directory when setting up the pre-commit hook. If you encounter any issues or have questions, please consult the project's maintainer or review our troubleshooting guide.
