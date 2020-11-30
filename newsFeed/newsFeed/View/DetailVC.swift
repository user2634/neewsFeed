//
//  DetailVC.swift
//  newsFeed
//
//  Created by Dava on 30.11.2020.
//

import UIKit
import SafariServices

class DetailVC: UITableViewController {
    
    var section: String?
    let networkDataFetcher = NetworkDataFetcher()
    var articleResponse: ArticleRespons?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = section
        let urlString = "https://api.nytimes.com/svc/news/v3/content/all/\(section!).json?limit=20&offset=480&api-key=baYxG1Gx09jfkJGAEw1Xg9HlrGRNpjKJ"
        self.networkDataFetcher.fetchTracks(urlString: urlString) { (articleResponse) in
            guard let articleResponse = articleResponse else { return }
            self.articleResponse = articleResponse
            self.tableView.reloadData()
        }

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleResponse?.num_results ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailViewCell
        cell.title.text = articleResponse?.results[indexPath.row].title
        cell.abstract.text = articleResponse?.results[indexPath.row].abstract
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SFSafariViewController(url: URL(string: articleResponse?.results[indexPath.row].url ?? "https://www.google.com")!)
        present(vc, animated: true, completion: nil)
    }
    


}
