//
//  VotingViewController.swift
//  TheCatApi
//
//  Created by Jernard Ducon on 18/07/20.
//  Copyright © 2020 Jernard Ducon. All rights reserved.
//

import UIKit

class VotingViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var thumbsLabel: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var catImg: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var rotationRatio: CGFloat! {
        return (viewContainer.frame.width / 2) / 0.3925
    }
    var viewModel: votingViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        viewModel?.fetchCat()
        // Do any additional setup after loading the view.
    }
    
    private func removeCard() {
        catImg.image = #imageLiteral(resourceName: "NoImage")
        cardView.center = CGPoint(x: viewContainer.center.x, y: viewContainer.center.y - 60)
        cardView.transform = .identity
        thumbsLabel.alpha = 0
        
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        guard let card = sender.view else{
            return print("aca debo poner un throw")
        }
        
        let pointsMoved = sender.translation(in: viewContainer)
        let scale = min(100 / abs(pointsMoved.x), 1)
        card.center = CGPoint(x: viewContainer.center.x + pointsMoved.x, y: viewContainer.center.y + pointsMoved.y)
        card.transform = CGAffineTransform(rotationAngle: pointsMoved.x / rotationRatio).scaledBy(x: scale, y: scale)
        
        
        thumbsLabel.image = pointsMoved.x > 0 ? #imageLiteral(resourceName: "catLiked") : #imageLiteral(resourceName: "dislikedCat")
        thumbsLabel.alpha = abs(pointsMoved.x) / viewContainer.center.x
        
        if sender.state == .ended {
            if card.center.x < 60 {
                vote(id: 0)
                removeCardFromScreen(pickedCard: false, card: card)
                return
            } else if card.center.x > viewContainer.frame.width - 60 {
                vote(id: 1)
                removeCardFromScreen(pickedCard: true, card: card)
                return
            }
            animateCardReposition()
        }
    }
    
    private func removeCardFromScreen(pickedCard: Bool, card: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            card.center = CGPoint(x: pickedCard ? self.viewContainer.center.x + 200 : self.viewContainer.center.x - 200, y: self.viewContainer.center.y)
            card.alpha = 0
        }, completion: { _ in
            self.removeCard()
            UIView.animate(withDuration: 0.15, animations: {
                self.cardView.alpha = 1
                
            })
        })
    }
    
    private func animateCardReposition() {
        UIView.animate(withDuration: 0.3, animations: {
            self.removeCard()
        })
    }
    
    func loadCat(){
        DispatchQueue.main.async {
            guard let cat = self.viewModel?.currentModel else {return}
            self.catImg.downloaded(from: cat.url!)
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func vote(id: Int){
        viewModel?.voted(id: id)
        self.activityIndicator.startAnimating()
    }

    
}
