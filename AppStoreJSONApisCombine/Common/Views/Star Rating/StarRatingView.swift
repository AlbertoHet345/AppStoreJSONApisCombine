//
//  StarRatingView.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto.garcia on 14/01/22.
//

import UIKit

final class StarRatingView: UIView {
    
    @UsesAutoLayout private var starOne: StarView = StarView()
    @UsesAutoLayout private var starTwo: StarView = StarView()
    @UsesAutoLayout private var starThree: StarView = StarView()
    @UsesAutoLayout private var starFour: StarView = StarView()
    @UsesAutoLayout private var starFive: StarView = StarView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [starOne, starTwo, starThree, starFour, starFive].forEach {
            addSubview($0)
            $0.constrainHeight(constant: 14)
            $0.constrainWidth(constant: 14)
        }
        
        NSLayoutConstraint.activate([
            starOne.leadingAnchor.constraint(equalTo: leadingAnchor),
            starTwo.leadingAnchor.constraint(equalTo: starOne.trailingAnchor, constant: 1),
            starThree.leadingAnchor.constraint(equalTo: starTwo.trailingAnchor, constant: 1),
            starFour.leadingAnchor.constraint(equalTo: starThree.trailingAnchor, constant: 1),
            starFive.leadingAnchor.constraint(equalTo: starFour.trailingAnchor, constant: 1),
        ])
    }
    
    func setRating(_ rating: Float) {
        [starOne, starTwo, starThree, starFour, starFive].enumerated().forEach { index, star in
            let value = getStarImage(starNumber: Float(index + 1), forRating: rating)
            star.image(for: value)
        }
    }
    
    private func getStarImage(starNumber: Float, forRating rating: Float) -> Float {
        if rating >= starNumber {
            return 1
        } else if rating + 0.5 == starNumber {
            return 0.5
        } else {
            return 0
        }
    }
    
}
