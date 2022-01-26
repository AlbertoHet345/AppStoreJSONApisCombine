//
//  StarView.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto.garcia on 14/01/22.
//

import UIKit

final class StarView: UIView {
    
    @UsesAutoLayout
    private var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(starImageView)
        starImageView.fillSuperview()
    }
    
    func image(for number: Float) {
        switch number {
        case 1:
            starImageView.image = UIImage(systemName: "star.fill")
        case 0.5:
            starImageView.image = UIImage(systemName: "star.leadinghalf.fill")
        default:
            starImageView.image = UIImage(systemName: "star")
        }
    }
}
