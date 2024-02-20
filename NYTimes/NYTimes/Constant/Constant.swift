//
//  Constant.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 19/02/24.
//

//Constant Files for API keys
enum Constant {
    enum API {
        static let apiKey = "leP6fiA7eTmVEdGhinlYKQXwACZlAEXj"
        static let url = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=\(apiKey)"
        static let method = "GET"
        static let headers = ["Content-Type": "application/json"]
    }
    
    enum APIKeys {
        static let Id = "id"
        static let Title = "title"
        static let Author = "byline"
        static let Description = "abstract"
        static let ImageData = "media"
        static let ImageSubData = "media-metadata"
        static let ImageFormat = "format"
        static let StandardThumbnial = "Standard Thumbnail"
        static let PublishedDate = "published_date"
        static let BiggerThumbnial = "mediumThreeByTwo440"
    }
    
    enum Alert {
        static let Title = "API Failed"
        static let Message = "There was an error while fetching data from the server. Please try again later."
        static let Button = "Ok"
        static let PleaseWait = "Please wait..."

    }
    
    enum General {
        static let KNoImage = "noimage"
        static let KSegueIdentifier = "fromListToDetail"
        static let KCellId = "ArticleCell"
        static let KMostPopularArc = "Most popular articles"
        static let KBlankString = ""
    }
}

