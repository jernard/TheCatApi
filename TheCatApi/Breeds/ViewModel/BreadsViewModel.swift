//
//  BreadsViewModel.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation

class BreedsViewModel{
    
    weak var viewDelegate: BreedsViewController?
    private(set) var container: [BreedsModel]?
    private var network: NetworkManager!
    
    func setUp(network: NetworkManager){
        self.network = network
        fetchBread()
    }
    
    func getBreeds() -> [BreedsModel]{

        
        return [BreedsModel]()
    }
    
    func fetchBread(){
        
        network.getBreeds(page: 1) { (breeds, error) in
            guard let breedList = breeds else {return}
            self.container = breedList
            self.viewDelegate?.reloadData()
        }
    }
}
