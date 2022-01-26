//
//  HorizontalStackView.swift
//  AppStoreJSONApis
//
//  Created by Alberto Garcia on 16/08/21.
//

import UIKit

final class HorizontalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView],
         spacing: CGFloat = 0,
         alignment: UIStackView.Alignment = .fill,
         distribution: UIStackView.Distribution = .fill) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError()
    }
}
