//
//  OrderViewController.swift
//  WalterMichael-HW5
//
//  Created by Michael  Walter on 10/6/21.
//
//  Project: WalterMichael-HW5
//  EID: MJW3895
//  Course: CS329E

import UIKit

public class Pizza{
    var pSize = "none"
    var crust = "none"
    var cheese = "none"
    var meat = "none"
    var veggies = "None"
}

class OrderViewController: UIViewController {
    @IBOutlet weak var segCtrl: UISegmentedControl!
    @IBOutlet weak var crustButton: UIButton!
    @IBOutlet weak var cheeseButton: UIButton!
    @IBOutlet weak var meatButton: UIButton!
    @IBOutlet weak var veggieButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var crustLabel: UILabel!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var meatLabel: UILabel!
    @IBOutlet weak var veggieLabel: UILabel!
    
    var delegate: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let pizza1 = Pizza()
    
    @IBAction func sizeSeg(_ sender: Any) {
        switch segCtrl.selectedSegmentIndex {
        case 0:
            pizza1.pSize = "small"
        case 1:
            pizza1.pSize = "medium"
        case 2:
            pizza1.pSize = "large"
        default:
            pizza1.pSize = "error"
        }
    }
    
    @IBAction func crustButtonPressed(_ sender: Any) {
        
        let controller = UIAlertController(
                title: "Select crust",
                message: "Choose a crust type:",
                preferredStyle: .alert)
            controller.addAction(UIAlertAction(
                                    title: "Thin crust",
                                    style: .cancel,
                                    handler: {(action) in self.pizza1.crust = "thin crust"}))
            controller.addAction(UIAlertAction(
                                    title: "Thick crust",
                                    style: .default,
                                    handler: {(action) in self.pizza1.crust = "thick crust"}))
            present(controller, animated: true, completion: nil)
    }
    
    @IBAction func veggieButtonPressed(_ sender: Any) {
        let controller = UIAlertController(
            title: "Select veggies",
            message: "Choose your veggies:",
            preferredStyle: .actionSheet)
        
        let mushAction = UIAlertAction(
            title: "Mushroom",
            style: .default,
            handler: {(action) in self.pizza1.veggies = "mushroom"})
        controller.addAction(mushAction)
    
        let onionAction = UIAlertAction(
            title: "Onion",
            style: .default,
            handler: {(action) in self.pizza1.veggies = "onion"})
        controller.addAction(onionAction)
        
        let greenAction = UIAlertAction(
            title: "Green Olive",
            style: .default,
            handler: {(action) in self.pizza1.veggies = "green olive"})
        controller.addAction(greenAction)
        
        let blackAction = UIAlertAction(
            title: "Black Olive",
            style: .default,
            handler: {(action) in self.pizza1.veggies = "black olive"})
        controller.addAction(blackAction)
        
        let noneAction = UIAlertAction(
            title: "None",
            style: .default,
            handler: {(action) in self.pizza1.veggies = "none"})
        controller.addAction(noneAction)
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func cheeseButtonPressed(_ sender: Any) {
        let controller = UIAlertController(
            title: "Select cheese",
            message: "Choose your cheese type:",
            preferredStyle: .actionSheet)
        
        let regAction = UIAlertAction(
            title: "Regular cheese",
            style: .default,
            handler: {(action) in self.pizza1.cheese = "regular cheese"})
        controller.addAction(regAction)
    
        let noAction = UIAlertAction(
            title: "No cheese",
            style: .default,
            handler: {(action) in self.pizza1.cheese = "no cheese"})
        controller.addAction(noAction)
        
        let doubleAction = UIAlertAction(
            title: "Double cheese",
            style: .default,
            handler: {(action) in self.pizza1.cheese = "double cheese"})
        controller.addAction(doubleAction)
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func meatButtonPressed(_ sender: Any) {
        let controller = UIAlertController(
            title: "Select meat",
            message: "Choose your cheese type:",
            preferredStyle: .actionSheet)
        
        let pepAction = UIAlertAction(
            title: "Pepperoni",
            style: .default,
            handler: {(action) in self.pizza1.meat = "pepperoni"})
        controller.addAction(pepAction)
    
        let sausAction = UIAlertAction(
            title: "Sausage",
            style: .default,
            handler: {(action) in self.pizza1.meat = "sausage"})
        controller.addAction(sausAction)
        
        let bacAction = UIAlertAction(
            title: "Canadian Bacon",
            style: .default,
            handler: {(action) in self.pizza1.meat = "canadian bacon"})
        controller.addAction(bacAction)
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func doneButttonPressed(_ sender: Any) {
        var mess = ""
        if (pizza1.pSize == "none" || pizza1.crust == "none" || pizza1.cheese == "none" || pizza1.meat == "none" || pizza1.veggies == "None"){
            if (pizza1.pSize == "none") {
                mess += "Please select a pizza size. \n"
                }
            if (pizza1.crust == "none") {
                mess += "Please select a crust. \n"
                }
            if (pizza1.cheese == "none") {
                mess += "Please select cheese. \n"
                }
            if (pizza1.meat == "none") {
                mess += "Please select meat. \n"
                }
            if (pizza1.veggies == "None") {
                mess += "Please select veggies. \n"
                }
            let controller = UIAlertController(
                title: "Missing ingredient",
                message: mess,
                preferredStyle: .alert)
            controller.addAction(UIAlertAction(
                                    title: "OK",
                                    style: .default,
                                    handler: nil))
            
            present(controller, animated: true, completion: nil)
        }
        sizeLabel.text = "One "+pizza1.pSize+" pizza with:"
        crustLabel.text = pizza1.crust
        cheeseLabel.text = pizza1.cheese
        meatLabel.text = pizza1.meat
        veggieLabel.text = pizza1.veggies
        
        let otherVC = delegate as! TableChanger
        otherVC.addToTable(pizza: pizza1)
    }
}
        
