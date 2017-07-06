//
//  ViewController.swift
//  DynamicsDemo
//
//  Created by Sam Meech-Ward on 2017-07-06.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var animator: UIDynamicAnimator!
    var square: UIView!
    var barrier: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animator = UIDynamicAnimator(referenceView: view)
        
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.gray
        view.addSubview(square)
        
        barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.red
        view.addSubview(barrier)
    }

    @IBAction func animate(_ sender: Any) {
        let gravityBehavior = UIGravityBehavior(items: [square])
        animator.addBehavior(gravityBehavior)
        
        gravityBehavior.action = {
            print(NSStringFromCGPoint(self.square.center))
        }
        
        let collisionBehavior = UICollisionBehavior(items: [square])
        collisionBehavior.collisionDelegate = self
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        let rightEdge = CGPoint(x: barrier.frame.origin.x + barrier.frame.size.width, y: barrier.frame.origin.y)
        collisionBehavior.addBoundary(withIdentifier: "barrier" as NSString, from: barrier.frame.origin, to: rightEdge)
        
//        animator.addBehavior(collisionBehavior)
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        let view = item as! UIView
        view.backgroundColor = UIColor.yellow
        UIView.animate(withDuration: 0.3) {
            view.backgroundColor = UIColor.gray
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

