//
//  BreadsViewController.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import UIKit

class BreedsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: BreedsViewModel?
    
    struct cellsId {
        static let bread = "BreedRow"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func reloadData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }



}


// MARK: -DataSocurce and delegate
extension BreedsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.container?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellsId.bread) as! BreedTableViewCell
        
        if let breed = viewModel?.container?[indexPath.row]{
            cell.initCell(name: breed.name ?? "", temperament: breed.temperament ?? "")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let breed = viewModel?.container?[indexPath.row]{
            self.navigationController?.pushViewController(Modules.breedDetail(breed: breed), animated: true)
        }
    }
    
    
}

