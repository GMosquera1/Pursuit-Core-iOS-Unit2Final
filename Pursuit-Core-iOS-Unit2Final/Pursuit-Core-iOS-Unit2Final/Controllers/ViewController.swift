//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var crayons = Crayon.allTheCrayons {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
        let CrayonDetailViewController = segue.destination as?
            CrayonDetailViewController else { return }
        let crayonInfo = crayons[indexPath.row]
        CrayonDetailViewController.crayonInfo = crayonInfo    
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
        let crayonInfo = crayons[indexPath.row]
        //let color = crayonInfo.hex
       //let background = UIColor(named: color)
        cell.textLabel?.text = crayonInfo.name
        cell.detailTextLabel?.text = crayonInfo.hex
        //cell.contentView.backgroundColor = background
        //cell.backgroundColor = UIColor(named: crayonInfo.hex)
//        cell.contentView.backgroundColor? = UIColor(displayP3Red: CGFloat(crayonInfo.red)/255, green: CGFloat(crayonInfo.green)/255, blue: CGFloat(crayonInfo.blue)/255, alpha: 1)
//        cell.backgroundColor? = UIColor(displayP3Red: CGFloat(crayonInfo.red), green: CGFloat(crayonInfo.green)/255, blue: CGFloat(crayonInfo.blue)/255, alpha: 1)
        cell.contentView.backgroundColor = UIColor(displayP3Red: CGFloat(crayonInfo.red/255), green: CGFloat(crayonInfo.green/255), blue: CGFloat(crayonInfo.blue/255), alpha: 1)
    
        
        return cell
    }
}


