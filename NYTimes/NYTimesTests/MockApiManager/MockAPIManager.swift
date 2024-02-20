//
//  MockAPIManager.swift
//  NYTimesTests
//
//  Created by deepakmaheshwari on 19/02/24.
//

import Foundation
@testable import NYTimes

class MockAPIManager {
    let mockArticle: ArticleList?

    init(mockArticle: ArticleList?) {
        self.mockArticle = mockArticle
    }

     func getDataFromServer(CompletionBlockWithSuccess completion: @escaping (Result<[ArticleDetail], DataError>) -> Void)  {
         completion(.success(mockArticle?.results ?? []))
    }
    
    
    
}
