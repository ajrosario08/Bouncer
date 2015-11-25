//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by Anthony Rosario on 11/25/15.
//  Copyright © 2015 Anthony Rosario. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()
    
    lazy var BlockBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedBlockBehavior = UIDynamicItemBehavior()
        lazilyCreatedBlockBehavior.allowsRotation = false
        lazilyCreatedBlockBehavior.elasticity = 0.85
        lazilyCreatedBlockBehavior.friction = 0
        lazilyCreatedBlockBehavior.resistance = 0
        return lazilyCreatedBlockBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(BlockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(Block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(Block)
        gravity.addItem(Block)
        collider.addItem(Block)
        BlockBehavior.addItem(Block)
    }
    
    func removeBlock(Block: UIView) {
        gravity.removeItem(Block)
        collider.removeItem(Block)
        BlockBehavior.removeItem(Block)
        Block.removeFromSuperview()
        
    }
}
