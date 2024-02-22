//
//  ArticleListViewModel.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 19/02/24.
//

import Foundation

class ArticleListViewModel {

    var articles: [ArticleDetail] = []
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    var row = 0
    
    func fetchArticles() {
        APIManager().getDataFromServer { [weak self] (response) in
            guard let self = self else { return }
                switch response {
                case .success(let articleList):
                        self.articles = articleList
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }

}

extension ArticleListViewModel {

    enum Event {
        case dataLoaded
        case error(Error?)
    }

}
