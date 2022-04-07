//
//  UIImageView+Download.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 17.03.2021.
//

import UIKit

extension UIImageView {
  func download(from url: URL?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    guard let url = url else { return }
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard
        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
      else { return }
      DispatchQueue.main.async() { [weak self] in
        self?.image = image
      }
    }.resume()
  }
  
  func download(from link: String?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    guard let url = URL(string: link ?? "") else { return }
    download(from: url, contentMode: mode)
  }
}
