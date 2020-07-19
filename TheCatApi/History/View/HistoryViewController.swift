//
//  HistoryViewController.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var viewModel: HistoryViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    struct cellsId {
        static let voted = "votedCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.getData()
    }
    
    func reloadData(){
        guard let table = tableView else {return}
        table.reloadData()
    }


}
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.container.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellsId.voted) as! HistoryTableViewCell
        
        if let voted = viewModel?.container[indexPath.row]{
            cell.setUp(model: voted)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 301
    }
    
    
}
