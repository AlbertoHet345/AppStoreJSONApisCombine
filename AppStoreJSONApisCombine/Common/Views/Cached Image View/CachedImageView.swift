//
//  CachedImageView.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia Paul on 26/01/22.
//

import UIKit
import Combine

class CachedImageView: UIImageView {
    private let imageLoader: ImageRemoteLoader
    private var cancellables: [AnyCancellable] = []
    
    init(imageLoader: ImageRemoteLoader = .init()) {
        self.imageLoader = imageLoader
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(for url: URL) {
        imageLoader.publisher(for: url)
            .sink { _ in
                
            } receiveValue: { [weak self] image in
                guard let self = self else { return }
                self.image = image
            }
            .store(in: &cancellables)
    }
    
    func removeImage() {
        image = nil
    }
}
