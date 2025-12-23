//
//  PreviewHelpers.swift
//  CustomPicker
//
//  Created by GitHub Copilot on 12/23/25.
//

import SwiftUI

/// Lightweight helper to provide bindings inside previews (single binding).
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content

    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}

/// Two-binding preview helper to avoid tuple-binding boilerplate.
struct StatefulPreviewWrapper2<Value1, Value2, Content: View>: View {
    @State private var value1: Value1
    @State private var value2: Value2
    private let content: (Binding<Value1>, Binding<Value2>) -> Content

    init(_ initialValue1: Value1, _ initialValue2: Value2, content: @escaping (Binding<Value1>, Binding<Value2>) -> Content) {
        _value1 = State(initialValue: initialValue1)
        _value2 = State(initialValue: initialValue2)
        self.content = content
    }

    var body: some View {
        content($value1, $value2)
    }
}

/// Three-binding preview helper to avoid tuple-binding boilerplate.
struct StatefulPreviewWrapper3<Value1, Value2, Value3, Content: View>: View {
    @State private var value1: Value1
    @State private var value2: Value2
    @State private var value3: Value3
    private let content: (Binding<Value1>, Binding<Value2>, Binding<Value3>) -> Content

    init(_ initialValue1: Value1, _ initialValue2: Value2, _ initialValue3: Value3, content: @escaping (Binding<Value1>, Binding<Value2>, Binding<Value3>) -> Content) {
        _value1 = State(initialValue: initialValue1)
        _value2 = State(initialValue: initialValue2)
        _value3 = State(initialValue: initialValue3)
        self.content = content
    }

    var body: some View {
        content($value1, $value2, $value3)
    }
}
