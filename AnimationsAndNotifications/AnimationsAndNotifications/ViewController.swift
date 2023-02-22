//
//  ViewController.swift
//  WalterMichael-HW8
//
//  Created by Michael  Walter on 11/5/21.
//
//authentication

import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate{
    @IBOutlet weak var button: UIButton!
    let imageUT = UIImage(named: "ut.png")
    let imageTower = UIImage(named: "uttower.png")
    var currentImage = UIImage()
    var otherImage = UIImage()
    var clicks = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        currentImage = imageTower!
        otherImage = imageUT!
        self.button.setImage(currentImage, for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        easeOut(Image1: currentImage, Image2: otherImage)
    }
    
    
    func easeIn(Image1: UIImage){
        self.button.alpha = 0
         UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.button.alpha = 1
                self.button.setImage(Image1, for: .normal)
            })
    }
    
    func easeOut(Image1: UIImage, Image2: UIImage){
        let notification = UNMutableNotificationContent()
        notification.title = "Click Count"
        notification.subtitle = "just now"
        notification.body = "You have clicked \(self.clicks+1) times"
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1",
                                            content: notification,
                                            trigger: notificationTrigger)
        
         UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.button.alpha = 0
                self.button.setImage(Image1, for: .normal)
                self.clicks += 1
                if (self.clicks % 4 == 0){
                    UNUserNotificationCenter.current().add(request) { (error) in
                        print("Request error: ",error as Any)
                    }
                }
            },
            completion :{ finished in
                self.easeIn(Image1: self.otherImage)
                //self.button.setImage(Image1, for: .normal)
                self.currentImage = Image2
                self.otherImage = Image1
                
            })
    }
}

    

