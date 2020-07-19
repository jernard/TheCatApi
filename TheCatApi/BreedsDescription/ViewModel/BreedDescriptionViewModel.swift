//
//  BreedDescriptionViewModel.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation

class BreedDescriptionViewModel{
    
    weak var viewDelegate: BreedDescriptionViewController?
    private(set) var model: BreedsModel?
    private(set) var modelUrl: BreedModel?
    private var network: NetworkManager!
    
    func setUp(network: NetworkManager,breed: BreedsModel){
        self.model = breed
        self.network = network
        fetchBreed()
    }
    
    func fetchBreed() {
        network.getBreed(breedId: model?.id ?? "") { (breed, error) in
            DispatchQueue.main.async {
                self.modelUrl = breed
                self.viewDelegate?.setData()
            }
        }
    }
    
}
