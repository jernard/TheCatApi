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
        static let noData = "nodata"
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
        return viewModel?.container.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let voted = viewModel?.container[indexPath.row], viewModel?.container.count ?? 0 > 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellsId.voted) as! HistoryTableViewCell
            cell.setUp(model: voted)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellsId.noData)!
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let _ = viewModel?.container[indexPath.row], viewModel?.container.count ?? 0 > 0{
            return 301
        }else{
            return tableView.frame.height
        }
        
    }
    
    
}
