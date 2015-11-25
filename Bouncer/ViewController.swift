//
//  ViewController.swift
//  Bouncer
//
//  Created by Anthony Rosario on 11/25/15.
//  Copyright © 2015 Anthony Rosario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bouncer = BouncerBehavior()
    lazy var animator: UIDynamicAnimator = {UIDynamicAnimator(referenceView: self.view)}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(bouncer)
    }
    
    struct Constance {
        static let BlockSize = CGSize(width: 40, height: 40)
    }
    
    var redBlock: UIView?
    
    override func viewDidAppear(animated: Bool) {
        if redBlock == nil {
            redBlock = addBlock()
            redBlock?.backgroundColor = UIColor.redColor()
            bouncer.addBlock(redBlock!)
        }
    }
    
    func addBlock() -> UIView {
        let block = UIView(frame: CGRect(origin: CGPointZero, size: Constance.BlockSize))
        block.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        view.addSubview(block)
        return block
    }
    
    
}

