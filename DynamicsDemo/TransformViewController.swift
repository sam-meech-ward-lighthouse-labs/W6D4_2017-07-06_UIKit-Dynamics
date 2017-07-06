//
//  ViewController.swift
//  Demo2
//
//  Created by Sam Meech-Ward on 2017-07-06.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: cardView.superview)
            cardView.transform = transform(for: translation)
            
        case .ended:
            
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.cardView.transform = .identity
            }, completion: nil)
            
        default:
            break
        }
    }
    
    func transform(for translation: CGPoint) -> CGAffineTransform {
        let moveBy = CGAffineTransform(translationX: translation.x, y: translation.y)
        let rotation = -sin(translation.x / cardView.frame.width * 4.0)
        
        return moveBy.rotated(by: rotation)
    }
    
}

