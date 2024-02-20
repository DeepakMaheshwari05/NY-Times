//
//  APIManager.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 19/02/24.
//

import Foundation


enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
}


class APIManager {

    class func getDataFromServer(CompletionBlockWithSuccess completion: @escaping (Result<[ArticleDetail], DataError>) -> Void)  {

        guard let url = URL(string: Constant.API.url) else {
            completion(.failure(.invalidURL))
            return
        }

        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)

        request.httpMethod = Constant.API.method

        request.allHTTPHeaderFields = Constant.API.headers
        
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            do {
                guard let articlesList = try? JSONDecoder().decode(ArticleList.self, from: data), let results = articlesList.results else {
                   return completion(.failure(.invalidData))
                }
                completion(.success(results))
            }
        }.resume()
    }

}
