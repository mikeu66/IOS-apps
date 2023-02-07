//
//  ViewController.swift
//  WalterMichael-HW9
//
//  Created by Michael  Walter on 11/11/21.
//
// Project: WalterMichael-HW9
// EID: MJW3895
// Course: CS329E
// Built to run on iPod touch

import UIKit

class ViewController: UIViewController {
    
    var blockWidth: CGFloat!
    var blockHeight: CGFloat!
    var stopBool: Bool!
    var direction: String!
    let queue = DispatchQueue(label: "boxqueue", qos: .background)
    var block: UIView!
    
    override func viewDidLoad() {
        move()
        direction = "down"
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(recognizeTapGesture(recognizer:)))
        self.view.addGestureRecognizer(tap)
        
        blockWidth = view.safeAreaLayoutGuide.layoutFrame.width / 9
        blockHeight = view.safeAreaLayoutGuide.layoutFrame.height / 19
        block = UIView(frame: CGRect(x: blockWidth * 4,
                                     y: blockHeight * 9,
                                     width: blockWidth,
                                     height: blockHeight
                                    ))
        block.backgroundColor = UIColor.green
        view.addSubview(block)
    }
    
    @IBAction func recognizeTapGesture(recognizer: UITapGestureRecognizer){
        print("tap")
        self.block.backgroundColor = UIColor.green
        block.center.x = self.view.frame.width/2
        block.center.y = self.view.frame.height/2
        direction = "down"
        stopBool = false
        move()
    }
    
    @IBAction func recognizeSwipeGesture(recognizer: UISwipeGestureRecognizer){
        if recognizer.state == .ended {
            if let swipeGesture = recognizer as? UISwipeGestureRecognizer {
                if swipeGesture.direction == .right{
                    direction = "right"
                }
                if swipeGesture.direction == .left{
                    direction = "left"
                }
                if swipeGesture.direction == .down{
                    direction = "down"
                }
                if swipeGesture.direction == .up{
                    direction = "up"
                }
            }
        }
    }
    
    func move(){
        self.stopBool = false
        queue.async {
            while (self.stopBool == false){
                usleep(300000)
                DispatchQueue.main.async {
                    if (self.stopBool == false){
                        if self.direction == "right"{
                            self.block.center.x += self.blockWidth
                        }
                        if self.direction == "down"{
                            self.block.center.y += self.blockHeight
                        }
                        if self.direction == "left"{
                            self.block.center.x -= self.blockWidth
                        }
                        if self.direction == "up"{
                            self.block.center.y -= self.blockHeight
                        }
                        if (self.block.center.x >= self.view.safeAreaLayoutGuide.layoutFrame.width-self.blockWidth ||
                            self.block.center.y >= self.view.safeAreaLayoutGuide.layoutFrame.height ||
                            self.block.center.x <= self.blockWidth ||
                            self.block.center.y <= self.blockHeight){
                            self.block.backgroundColor = UIColor.red
                            self.stopBool = true
                        }
                    }
                }
            }
        }
    }
}

