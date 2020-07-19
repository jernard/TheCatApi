//
//  VotingModel.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 19/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class votingModel{
    var id: String?
    var name: String?
    var url: String?
    var date: Date?
    var wikipedia_url: String?
    var voted: Int?
    
    
    init (model: BreedModel, voted: Int){

        
        let date = Date()
        self.name = model.breeds?.first?.name
        self.wikipedia_url = model.breeds?.first?.wikipedia_url
        self.date = date
        self.url = model.url
        self.id = model.id
        self.voted = voted
    }
    
    init(request: NSManagedObject) {
        
        self.id = request.value(forKey: "id") as? String ?? ""
        self.name = request.value(forKey: "name")  as? String ?? ""
        self.url = request.value(forKey: "url")  as? String ?? ""
        self.date = request.value(forKey: "date")  as? Date ?? Date()
        self.wikipedia_url = request.value(forKey: "wikipedia_url")  as? String ?? ""
        self.voted = request.value(forKey: "voted") as? Int ?? -1
    }
    

    func save(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newVote = NSEntityDescription.insertNewObject(forEntityName: "Voting", into: context)

        newVote.setValue(self.id, forKey: "id")
        newVote.setValue(self.name, forKey: "name")
        newVote.setValue(self.url, forKey: "url")
        newVote.setValue(self.date, forKey: "date")
        newVote.setValue(self.wikipedia_url, forKey: "wikipedia_url")
        newVote.setValue(self.voted, forKey: "voted")

        do{
            try context.save()
        }catch{
            debugPrint("Error saving")
        }
    }
    
   
}
