//
//  Modules.swift
//  TheCatApiImplementation
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation
import UIKit

class Modules: NSObject{
    static let network = NetworkManager()
    
    class func voting() -> VotingViewController{
        let mainStoryboard = UIStoryboard(name: "VotingView", bundle: Bundle.main)
        let view = mainStoryboard.instantiateViewController(withIdentifier: "Init") as! VotingViewController
        let viewModel = votingViewModel()
        view.viewModel = viewModel
        viewModel.viewDelegate = view
        viewModel.setUp(network: network)
        
        return view
    }
    
    class func breeds() -> BreedsViewController{
        let mainStoryboard = UIStoryboard(name: "BreedsView", bundle: Bundle.main)
        let view = mainStoryboard.instantiateViewController(withIdentifier: "Init") as! BreedsViewController
        let viewModel = BreedsViewModel()
        view.viewModel = viewModel
        viewModel.viewDelegate = view
        viewModel.setUp(network: network)
        
        return view
    }
    
    class func history() -> HistoryViewController{
        let mainStoryboard = UIStoryboard(name: "HistoryView", bundle: Bundle.main)
        let view = mainStoryboard.instantiateViewController(withIdentifier: "Init") as! HistoryViewController
        let viewModel = HistoryViewModel()
        view.viewModel = viewModel
        viewModel.viewDelegate = view
        viewModel.setUp()
        
        return view
    }
    
    class func breedDetail(breed: BreedsModel) -> BreedDescriptionViewController{
        let mainStoryboard = UIStoryboard(name: "BreedDescription", bundle: Bundle.main)
        let view = mainStoryboard.instantiateViewController(withIdentifier: "Init") as! BreedDescriptionViewController
        let viewModel = BreedDescriptionViewModel()
        view.viewModel = viewModel
        viewModel.viewDelegate = view
        viewModel.setUp(network: network, breed: breed)
        
        return view
    }
    
    
    class func urlExternal(url: String) -> WKModuleViewController{
        let mainStoryboard = UIStoryboard(name: "WKModule", bundle: Bundle.main)
        let view = mainStoryboard.instantiateViewController(withIdentifier: "Init") as! WKModuleViewController
        view.url = url
        
        return view
    }
}
