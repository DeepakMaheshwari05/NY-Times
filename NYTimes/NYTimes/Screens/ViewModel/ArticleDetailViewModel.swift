//
//  ArticleDetailViewModel.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 20/02/24.
//

import Foundation

class ArticleDetailViewModel {
    private var articleDetailModel: ArticleDetail?

    init(articleDetailModel: ArticleDetail) {
        self.articleDetailModel = articleDetailModel
    }

    var title: String {
        return articleDetailModel?.title ?? Constant.General.KBlankString
    }

    var description: String {
        return articleDetailModel?.abstract ?? Constant.General.KBlankString
    }
    
    var author: String {
        return articleDetailModel?.byline ?? Constant.General.KBlankString
    }
    var publishedDate: String {
        return articleDetailModel?.published_date ?? Constant.General.KBlankString
    }
    var imageUrl: String {
        return articleDetailModel?.getImageForThumbnil() ?? Constant.General.KBlankString
    }
}
