//
//  ArticleListViewModelTesst.swift
//  NYTimesTests
//
//  Created by deepakmaheshwari on 19/02/24.
//

import XCTest
@testable import NYTimes

class ArticleListViewModelTest : XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessFetchData() {
        let oneArticle = mockOneArticle()
        let service = MockAPIManager(mockArticle: oneArticle)
        
        service.getDataFromServer { (response) in
            switch response {
            case .success(let articleList):
                XCTAssertEqual(articleList.count, oneArticle?.results?.count)
            case .failure(_): break
            }
        }
    }

    func testEmptyFetchData() {
        let noArticle = mockEmptyArticle()
        let service = MockAPIManager(mockArticle: noArticle)
        
        service.getDataFromServer { (response) in
            switch response {
            case .success(let articleList):
                XCTAssertEqual(articleList.count, 0)
            case .failure(_): break
            }
        }
    }
    
    func testNilFetchData() {
        let service = MockAPIManager(mockArticle: nil)
        
        service.getDataFromServer { (response) in
            switch response {
            case .success(let articleList):
                XCTAssertEqual(articleList.count, 0)
            case .failure(_): break
            }
        }
    }
    
func mockEmptyArticle() -> ArticleList? {
    
    let json =
    """
                {
                    "status": "Ok",
                    "copyright": "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
                    "num_results": 0,
                    "results": []
                }
    """
    
    do {
            
      if  let jsonData = json.data(using: .utf8) {
            let decodedData = try JSONDecoder().decode(ArticleList.self,from: jsonData)
            return decodedData
            }
        } catch {
            print(error)
        }
    return nil
}
    func mockOneArticle() -> ArticleList? {
        
        let json =
        """
                    {
                        "status": "Ok",
                        "copyright": "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
                        "num_results": 0,
                        "results": [
        {
          "uri": "nyt://article/2c98fd00-9607-55d3-9eb0-35c8768cbb63",
          "url": "https://www.nytimes.com/2024/02/13/opinion/trump-campaign-biden-aging.html",
          "id": 100000009310585,
          "asset_id": 100000009310585,
          "source": "New York Times",
          "published_date": "2024-02-13",
          "updated": "2024-02-17 11:33:25",
          "section": "Opinion",
          "subsection": "",
          "nytdsection": "opinion",
          "adx_keywords": "United States Politics and Government;Presidential Election of 2024;United States International Relations;Presidents and Presidency (US);North Atlantic Treaty Organization",
          "column": null,
          "byline": "By Jamelle Bouie",
          "type": "Article",
          "title": "Trump Is Losing It",
          "abstract": "Unfortunately for Biden, the former president benefits from something akin to the soft bigotry of low expectations.",
          "des_facet": [
            "United States Politics and Government",
            "Presidential Election of 2024",
            "United States International Relations",
            "Presidents and Presidency (US)"
          ],
          "org_facet": [
            "North Atlantic Treaty Organization"
          ],
          "per_facet": [],
          "geo_facet": [],
          "media": [
            {
              "type": "image",
              "subtype": "photo",
              "caption": "",
              "copyright": "Patrick T. Fallon/Agence France-Presse — Getty Images",
              "approved_for_syndication": 1,
              "media-metadata": [
                {
                  "url": "https://static01.nyt.com/images/2024/02/13/multimedia/13bouie-pjtw/13bouie-pjtw-thumbStandard-v2.jpg",
                  "format": "Standard Thumbnail",
                  "height": 75,
                  "width": 75
                },
                {
                  "url": "https://static01.nyt.com/images/2024/02/13/multimedia/13bouie-pjtw/13bouie-pjtw-mediumThreeByTwo210.jpg",
                  "format": "mediumThreeByTwo210",
                  "height": 140,
                  "width": 210
                },
                {
                  "url": "https://static01.nyt.com/images/2024/02/13/multimedia/13bouie-pjtw/13bouie-pjtw-mediumThreeByTwo440.jpg",
                  "format": "mediumThreeByTwo440",
                  "height": 293,
                  "width": 440
                }
              ]
            }
          ],
          "eta_id": 0
        }]
                    }
        """
        
        do {
                
          if  let jsonData = json.data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(ArticleList.self,from: jsonData)
                return decodedData
                }
            } catch {
                print(error)
            }
        return nil
    }
}
