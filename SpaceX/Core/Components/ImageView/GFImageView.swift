//
//  GFImageView.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit

final class GFImageView: UIImageView {
    
    private var dataTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        contentMode = .scaleAspectFit
        clipsToBounds = true
        backgroundColor = .systemGray4
        tintColor = .red
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = bounds.width / 2
    }
    
    func download(urlString: String) {
        if let cachedImage = CacheManager.shared.getFromCache(urlString: urlString) {
            image = cachedImage
            return
        }
        guard let url = URL(string: urlString) else { return }
        dataTask = NetworkManager.shared.download(url: url, completion: { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.handleWithData(data: data, urlString: urlString)
            case .failure(_):
                break
            }
        })
    }
    
    func cancelDownloading() {
        dataTask?.cancel()
        dataTask = nil
    }
    
    private func handleWithData(data: Data, urlString: String) {
        if let downloadedImage = UIImage(data: data) {
            CacheManager.shared.addToCache(urlString: urlString, image: downloadedImage)
            DispatchQueue.main.async {
                self.image = downloadedImage
            }
        }
    }
}
