//
//  SectionVC.swift
//  newsFeed
//
//  Created by Dava on 30.11.2020.
//

import UIKit

class SectionVC: UITableViewController {
    let networkDataFetcher = NetworkDataFetcher()
    var articleResponse: ArticleRespons?
    let sectionArr = ["sports","arts","books"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dequeueReusableCell(withIdentifier: "cell")
        

    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sectionArr[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 26)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! DetailVC
                destinationVC.section = tableView.cellForRow(at: indexPath)?.textLabel?.text
            }
        }
    }
}
