//
//  VerticalStackView.swift
//  AppStoreJSONApis
//
//  Created by Alberto Garcia on 16/08/21.
//

import UIKit

final class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView],
         spacing: CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
