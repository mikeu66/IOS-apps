//
//  ViewController.swift
//  WalterMichael-HW4
//
//  Created by Michael  Walter on 9/30/21.
//
// Project: WalterMichael-HW4
// EID: MJW3895
// Course: CS329E

import UIKit

public let operators = ["Add", "Subtract", "Multiply", "Divide"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    let CalcSegueIdentifier = "CalcSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = operators[row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CalcSegueIdentifier,
           let destination = segue.destination as? CalcViewController,
           let teamIndex = tableView.indexPathForSelectedRow?.row {
            destination.oper = operators[teamIndex]
            destination.teamIndex = teamIndex
        }
    }
}
