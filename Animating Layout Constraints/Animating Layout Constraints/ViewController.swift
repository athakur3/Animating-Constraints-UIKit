//
//  ViewController.swift
//  Animating Layout Constraints
//
//  Created by Akshansh Thakur on 14/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballView: BallView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.setupUI()
    }
}

class BallView: UIView {
    
    enum Direction {
        case up
        case down
        case right
        case left
        case middle
    }
    
    var currentDirection = Direction.middle
    
    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var rightKey: UIButton!
    @IBOutlet weak var leftKey: UIButton!
    @IBOutlet weak var bottomKey: UIButton!
    @IBOutlet weak var upKey: UIButton!
    
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    func setupUI() {
        
        [rightKey, leftKey, upKey, bottomKey].forEach({$0?.addTarget(self, action: #selector(moveBall(_:)), for: .touchUpInside)})
        
    }
    
    @objc func moveBall(_ sender: UIButton) {
        
        switch sender {
        case rightKey:
            horizontalConstraint.constant = UIScreen.main.bounds.width / 4.0
        case leftKey:
            horizontalConstraint.constant =  -(UIScreen.main.bounds.width / 4.0)
        case upKey:
            verticalConstraint.constant =  -(UIScreen.main.bounds.height / 4.0)
        case bottomKey:
            verticalConstraint.constant = UIScreen.main.bounds.height / 4.0
        default:
            print("Invalid")
            break
        }
        
        UIView.animate(withDuration: 1.0) {
            self.superview?.layoutIfNeeded()
        }
        
    }
    
}
