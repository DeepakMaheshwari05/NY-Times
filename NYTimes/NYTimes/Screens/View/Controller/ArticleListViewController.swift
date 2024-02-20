//
//  ArticleListViewController.swift
//  NYTimes
//
//  Created by deepakmaheshwari on 19/02/24.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tblArticleList: UITableView!
    
    let loader = UIAlertController(title: nil, message: Constant.Alert.PleaseWait, preferredStyle: .alert)

    // MARK: - Variables
    private var viewModel = ArticleListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tblArticleList.accessibilityIdentifier = "articleTableView"
        configuration()
    }

}

extension ArticleListViewController {
    // MARK: - SetUp Methods
    func configuration() {
        self.navigationItem.title = Constant.General.KMostPopularArc
        setLoader()
        initViewModel()
        observeEvent()
    }

    func setLoader() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        loader.view.addSubview(loadingIndicator)

    }
    
    func initViewModel() {
        // Fetching
        viewModel.fetchArticles()
    }

    // Data binding event
    func observeEvent() {
        self.present(loader, animated: true)

        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .dataLoaded:
                DispatchQueue.main.async {
                    // Reloading tableview when got success
                    self.tblArticleList.reloadData()
                    self.loader.dismiss(animated: true, completion: nil)
                }
                
            case .error(_):
                // Showing alert in case of error
                let alert = UIAlertController(title: Constant.Alert.Title, message: Constant.Alert.Message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: Constant.Alert.Button, style: UIAlertAction.Style.default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.General.KSegueIdentifier {
            if let articleDetailViewController = segue.destination as? ArticleDetailViewController {
                articleDetailViewController.articleDetailViewModelObj = ArticleDetailViewModel(articleDetailModel: viewModel.articles[viewModel.row])
            }
        }
    }
    
}
    // MARK: - TableView Delegate and Datasource Methods
extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.row = indexPath.row
        self.performSegue(withIdentifier: Constant.General.KSegueIdentifier, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.General.KCellId) as? ArticleCell else {
            return UITableViewCell()
        }
        cell.article = viewModel.articles[indexPath.row]
        return cell
    }

}
