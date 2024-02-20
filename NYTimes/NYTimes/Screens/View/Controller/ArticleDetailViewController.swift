//
//  ArticleDetailViewController.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 19/02/24.
//

import UIKit

class ArticleDetailViewController: UIViewController,UIScrollViewDelegate {
    
    //MARK: - Variables
    var articleDetailViewModelObj: ArticleDetailViewModel?
    
    //MARK: - IBOutlet
    @IBOutlet weak var imgStoryImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescrptn: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var scrDetail: UIScrollView!
    @IBOutlet weak var vwScrollV: UIView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrDetail.delegate = self
        setUpView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        vwScrollV.frame =  CGRect.init(x: vwScrollV.frame.origin.x, y: vwScrollV.frame.origin.y, width: vwScrollV.frame.size.width, height: lblAuthor.frame.origin.y + 50)
        view.layoutSubviews()
    }

    //MARK: - Custom Methods
    func setUpView() {
        self.navigationItem.title = articleDetailViewModelObj?.title
        lblTitle.text = articleDetailViewModelObj?.title
        lblDescrptn.text = articleDetailViewModelObj?.description
        lblAuthor.text = articleDetailViewModelObj?.author
        lblDate.text = "Published: " + (articleDetailViewModelObj?.publishedDate ?? "")
        if let url = URL(string: articleDetailViewModelObj?.imageUrl ?? Constant.General.KBlankString) {
            imgStoryImage.loadImageFromURL(url: url)
        }
    }
    
}

