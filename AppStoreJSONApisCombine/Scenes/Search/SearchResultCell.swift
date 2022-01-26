//
//  SearchResultCell.swift
//  AppStoreJSONApis
//
//  Created by Alberto Garcia on 15/08/21.
//

import UIKit
import Combine

final class SearchResultCell: UICollectionViewCell, ReusableView {
    
    let appIconImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        label.font = .systemFont(ofSize: 14, weight: .ultraLight)
        return label
    }()
    
    let starRatingView: StarRatingView = StarRatingView()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = VerticalStackView(arrangedSubviews:
                                                    [nameLabel,
                                                     categoryLabel,
                                                     starRatingView],
        spacing: 2)
        labelsStackView.distribution = .fillEqually
        
        let infoTopStackView = HorizontalStackView(arrangedSubviews:
                                                    [appIconImageView,
                                                     labelsStackView,
                                                     getButton],
                                                   spacing: 12,
                                                   alignment: .center)
        
        let screenshotsStackView = HorizontalStackView(arrangedSubviews:
                                                        [screenshot1ImageView,
                                                         screenshot2ImageView,
                                                         screenshot3ImageView],
                                                       spacing: 12,
                                                       distribution: .fillEqually)
        
        let overallStackView = VerticalStackView(arrangedSubviews:
                                                    [infoTopStackView,
                                                     screenshotsStackView],
                                                 spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16,
                                                      left: 16,
                                                      bottom: 16,
                                                      right: 16))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        appIconImageView.removeImage()
        [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView].forEach { $0.removeImage() }
    }
    
    private func createScreenshotImageView() -> CachedImageView {
        let imageView = CachedImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }
    
    func configure(app: Result) {
        nameLabel.text = app.trackName
        categoryLabel.text = app.primaryGenreName
        ratingsLabel.text = "\(app.averageUserRating ?? 0)"
        guard let averageRating = app.averageUserRating else { return }
        let rating = round(averageRating * 10) / 10.0
        starRatingView.setRating(rating)
        setImages(for: app)
    }
    
    private func setImages(for app: Result) {
        guard let imageUrl = URL(string: app.artworkUrl512) else { return }
        appIconImageView.setImage(for: imageUrl)
        
        let imageViews = [screenshot1ImageView,
                          screenshot2ImageView,
                          screenshot3ImageView]
        
        app.screenshotUrls.enumerated().forEach { index, string in
            guard let imageUrl = URL(string: string) else { return }
            guard index < 3 else { return }
            imageViews[index].setImage(for: imageUrl)
        }
    }
}
