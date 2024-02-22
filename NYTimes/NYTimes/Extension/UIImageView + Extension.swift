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
        let downloadQueue = DispatchQueue(label: "imageDownloadQueue", qos: .background)
        
        downloadQueue.async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            } catch {
            }
        }
    }

}
