//
//  ViewController.swift
//  WalterMichael-HW5
//
//  Created by Michael  Walter on 10/6/21.
//
//  Project: WalterMichael-HW3
//  EID: MJW3895
//  Course: CS329E

import UIKit

protocol TableChanger{
    func addToTable(pizza: Pizza)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableChanger {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var barButton: UIBarButtonItem!
    var pizzaList = [Pizza]()
    @IBOutlet weak var crustLabel2: UILabel!
    
    let textCellIdentifier = "TextCell"
    let OrderSegueIdentifier = "OrderSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        cell.textLabel?.numberOfLines = 5;
        let row = indexPath.row
        var newMess = ""
        newMess += pizzaList[row].pSize
        newMess += "\n\t"+pizzaList[row].crust
        newMess += "\n\t"+pizzaList[row].cheese
        newMess += "\n\t"+pizzaList[row].meat
        newMess += "\n\t"+pizzaList[row].veggies
        cell.textLabel?.text = newMess
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == OrderSegueIdentifier,
            let nextVC = segue.destination as? OrderViewController {
                nextVC.delegate = self
        }
    }
    
    func addToTable(pizza: Pizza){
        pizzaList.append(pizza)
    }
}
