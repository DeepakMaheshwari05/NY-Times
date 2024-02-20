//
//  UIImageView + Extension.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 20/02/24.
//

//import Foundation
import UIKit

extension UIImageView {
    // Loading Image from URL
    func loadImageFromURL(url: URL) {
        self.image = UIImage.init(named: Constant.General.KNoImage)
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // Check for errors and if the data is not nil
            guard let data = data, error == nil, let self = self else {
                return
            }
            
            // Create UIImage from data
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }

}
