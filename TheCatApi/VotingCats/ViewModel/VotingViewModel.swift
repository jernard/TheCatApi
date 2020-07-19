//
//  votingViewMovel.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class votingViewModel{
    
    weak var viewDelegate: VotingViewController?
    private var network: NetworkManager!
    private(set) var currentModel: BreedModel!
    
    func setUp(network: NetworkManager){
        self.network = network
        
    }
    
    func voted(id: Int) {
        //save in coreData
        if let model = currentModel{
            let voted = votingModel(model: model, voted: id)
            
            //seve vote
            saveVote(vote: voted)
        }
        //fetch Netxt
        fetchCat()
    }
    
    func saveVote(vote: votingModel){
        vote.save()
    }
    
    func fetchCat(){
        
        network.getNwextToVote { (model, error) in
            guard let cat = model else {return}
            self.currentModel = cat
            self.viewDelegate?.loadCat()
        }
    }
}
