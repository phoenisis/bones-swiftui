  //
  //  BindingSource.swift
  //
  //
  //  Created by Quentin PIDOUX on 13/03/2024.
  //

import SwiftUI

  /// A view that provides a way to use either an external or an internal `Binding`.
  ///
  /// This struct allows for conditional use of an external binding if it exists,
  /// or falls back to an internal state otherwise. It's particularly useful in reusable
  /// components where you want to give the option of controlling the state from outside
  /// or let the component handle its own state.
struct BindingSource<Value, Content: View>: View {
  
    /// The external binding passed to the view. If `nil`, the view uses its internal state.
  let outer: Binding<Value>?
  
    /// The internal state of the view used if no external binding is provided.
  @State var inner: Value
  
    /// The content of the view, which is a function that takes a binding and returns a view.
  let content: (Binding<Value>) -> Content
  
  var body: some View {
    content(outer ?? $inner)
  }
  
    /// Initializes the `BindingSource` with an optional external binding and a fallback initial value.
    ///
    /// - Parameters:
    ///   - binding: An optional `Binding<Value>` that the view will use if not `nil`.
    ///   - fallbackInitialValue: The initial value to use for the internal state if the binding is `nil`.
    ///   - content: A closure that takes a `Binding<Value>` and returns a `Content` view.
  init(
    _ binding: Binding<Value>?,
    fallbackInitialValue: Value,
    @ViewBuilder content: @escaping (Binding<Value>) -> Content
  ) {
    self.outer = binding
    self._inner = State(wrappedValue: fallbackInitialValue)
    self.content = content
  }
}
