//
//  CatDescriptionViewController.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import UIKit

class BreedDescriptionViewController: UIViewController {

    var viewModel: BreedDescriptionViewModel?
    
    @IBOutlet weak var kittyImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var temperamentLbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    func setData(){
        namelbl.text = viewModel?.model?.name
        descriptionLbl.text = viewModel?.model?.description
        temperamentLbl.text = viewModel?.model?.temperament
        if let url = viewModel?.modelUrl?.url{
                kittyImg.downloaded(from: url)
        }else{
            kittyImg.image = #imageLiteral(resourceName: "NoImage")
        }
        
    }
    
    @IBAction func goToWiki(_ sender: Any) {
        self.navigationController?.pushViewController(Modules.urlExternal(url: viewModel?.model?.wikipedia_url ?? ""), animated: true)
    }
    
    
    
}
