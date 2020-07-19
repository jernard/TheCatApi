//
//  WKModuleViewController.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//


import UIKit

enum TabItem: String, CaseIterable {
    case breeds = "Breeds"
    case voting = "Voting"
    case history = "History"
    
    
    var viewController: UIViewController {
        switch self {
        case .breeds:
            return Modules.breeds()
        case .voting:
            return Modules.voting()
        case .history:
            return Modules.history()

        }
    }
    
    var icon: UIImage? {
        switch self {
        case .breeds:
            return UIImage(named: "breesTab")!
        case .voting:
            return UIImage(named: "voteTab")!
        case .history:
            return UIImage(named: "historyTab")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
