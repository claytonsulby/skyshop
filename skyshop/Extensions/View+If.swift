//
//  View+If.swift
//  skyshop
//
//  Created by Clayton Sulby on 11/25/20.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View> (_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension View {
    @ViewBuilder
    func `if`<TrueContent: View, FalseContent: View> (_ condition: Bool, if ifTransform: (Self) -> TrueContent, else elseTransform: (Self) -> FalseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
}

extension View {
    @ViewBuilder
    func ifLet<V, Transform: View> (_ value: V?, transform: (Self, V) -> Transform) -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
}
