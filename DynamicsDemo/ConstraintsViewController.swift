//
//  ConstraintsViewController.swift
//  DynamicsDemo
//
//  Created by Sam Meech-Ward on 2017-07-06.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import UIKit

class ConstraintsViewController: UIViewController {

    @IBOutlet weak var topViewCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewLeftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomViewCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomViewRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        bottomView.addSubview(footerView)
        
        footerView.leftAnchor.constraint(equalTo: bottomView.leftAnchor).isActive = true
        footerView.rightAnchor.constraint(equalTo: bottomView.rightAnchor).isActive = true
        footerView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
        
        bottomView.layoutIfNeeded()
        
        if self.topViewCenterConstraint.isActive {
            self.topViewCenterConstraint.isActive = false
            self.bottomViewCenterConstraint.isActive = false
            
            self.topViewLeftConstraint.isActive = true
            self.bottomViewRightConstraint.isActive = true
        } else {
            self.topViewLeftConstraint.isActive = false
            self.bottomViewRightConstraint.isActive = false
            
            self.topViewCenterConstraint.isActive = true
            self.bottomViewCenterConstraint.isActive = true
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
