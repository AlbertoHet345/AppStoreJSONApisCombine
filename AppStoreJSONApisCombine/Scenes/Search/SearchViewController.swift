//
//  SearchViewController.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 19/08/21.
//

import UIKit
import Combine

final class SearchViewController: UICollectionViewController, ViewControllable {
    
    private var cancellables: [AnyCancellable] = []
    
    private var appResults: [Result] = []
    
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        let service = SearchResultsLoader2(client: URLSessionHTTPClient())
        service.loadResults(matching: "instagram")
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            } receiveValue: { [weak self] results in
                print(results)
                self?.appResults = results
            }
            .store(in: &cancellables)

        
//        Service.shared.fetchApps()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { [weak self] _ in
//                guard let self = self else { return }
//                self.collectionView.reloadData()
//            },
//            receiveValue: { [weak self] results in
//                guard let self = self else { return }
//                self.appResults = results
//            })
//            .store(in: &cancellables)
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchResultCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(app: appResults[indexPath.item])
        return cell
    }

}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: view.frame.height / 2.5)
    }
}
