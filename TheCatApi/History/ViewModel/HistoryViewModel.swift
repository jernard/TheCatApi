//
//  HistoryViewModel.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class HistoryViewModel{
    
    weak var viewDelegate: HistoryViewController?
    private(set) var container = [votingModel]()
    
    func setUp(){
        getData()
    }
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Voting")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            container.removeAll()
            for data in result as! [NSManagedObject] {
                let model = votingModel(request: data)
                container.append(model)
            }
            container = container.sorted(by: { $0.date!.compare($1.date!) == .orderedDescending })
            loadData()
        } catch {
            print("Failed")
        }
    }
    
    func loadData() {
        self.viewDelegate?.reloadData()
    }
}
