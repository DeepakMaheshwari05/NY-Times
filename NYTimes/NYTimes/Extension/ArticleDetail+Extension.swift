//
//  ArticleDetail+Extension.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 20/02/24.
//

import Foundation

extension ArticleDetail {
    
    func getImageForThumbnil(_ thumbnil: Bool = false) -> String {
        guard let media = self.media, media.count > 0,  let multimedia = media.first?.media_metadata, multimedia.count > 0 else {
            return Constant.General.KBlankString
        }
        for objMul in multimedia {
            if objMul.format == Constant.APIKeys.StandardThumbnial && thumbnil {
                return objMul.url ?? Constant.General.KBlankString
            }
            if objMul.format == Constant.APIKeys.BiggerThumbnial {
                return objMul.url ?? Constant.General.KBlankString
            }
        }
        return Constant.General.KBlankString
    }
}
