//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Igor Vologodskiy on 26.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeObservers()
        tapObservers()
        
    }
    
    // Observers
    func swipeObservers() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObservers() {
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case .right:
            label.text = "The right swipe was recognized"
        case .left:
            label.text = "The left swipe was recognized"
        case .up:
            label.text = "The up swipe was recognized"
        case .down:
            label.text = "The down swipe was recognized"
        default:
            break
        }
    }
    
    @objc func tripleTapAction() {
        label.text = "Triple tap was recognized"
    }
    
    @objc func doubleTapAction() {
        label.text = "Double tap was recognized"
    }
}
