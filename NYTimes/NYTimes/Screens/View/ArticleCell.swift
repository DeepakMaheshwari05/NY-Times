//
//  ArticleCell.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 19/02/24.
//
import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var publishedByLabel: UILabel!

    var article: ArticleDetail? {
        didSet { // Property Observer
            articleDetailConfiguration()
        }
    }

    func articleDetailConfiguration() {
        guard let article else { return }
        articleTitleLabel.text = article.title
        dateLabel.text = article.published_date
        publishedByLabel.text = article.byline
        articleImageView.layer.cornerRadius = 10
        if let url = URL(string: article.getImageForThumbnil(true)) {
            articleImageView.loadImageFromURL(url: url)
        }
    }
    
}
