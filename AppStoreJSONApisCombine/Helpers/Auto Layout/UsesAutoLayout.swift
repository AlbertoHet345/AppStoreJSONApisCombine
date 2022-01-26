//
//  UsesAutoLayout.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto.garcia on 14/01/22.
//

import UIKit

@propertyWrapper
public struct UsesAutoLayout<View: UIView> {
    public var wrappedValue: View {
        didSet {
            setTranslatesAutoResizingMaskIntoConstraints()
        }
    }
    
    public init(wrappedValue: View) {
        self.wrappedValue = wrappedValue
        setTranslatesAutoResizingMaskIntoConstraints()
    }
    
    private func setTranslatesAutoResizingMaskIntoConstraints() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
