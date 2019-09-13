//
//  load.swift
//  exchange
//
//  Created by Екатерина on 07/09/2019.
//  Copyright © 2019 alexander-evpak. All rights reserved.
//

import UIKit

class load: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var whois: String = ""
    var active: String = ""
    var left: String = ""
    var right: String = ""
    var leftnum: String = ""
    var rightnum: String = ""
    fileprivate var coins = [Coin(coin: "Рубль", name: "RUB"),
    Coin(coin: "Австралиский доллар", name: "AUD"),
    Coin(coin: "Бразильский реал", name: "BRL"),
    Coin(coin: "Евро", name: "EUR")]
    fileprivate let cellIdentifier = String(describing: CoinCell.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinCell")
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        //print(whois)
    }
}
extension load: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as! CoinCell
        cell.field1.adjustsFontSizeToFitWidth = true
        cell.field2.adjustsFontSizeToFitWidth = true
        cell.field1.text = coins[indexPath.row].coin
        cell.field2.text = coins[indexPath.row].name
        if whois == "leftpress"{
            if left ==  coins[indexPath.row].name{
                cell.setSelected(true, animated: true)
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                active = coins[indexPath.row].name
            }
        }
        if whois == "rightpress"{
            if right ==  coins[indexPath.row].name{
                cell.setSelected(true, animated: true)
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                active = coins[indexPath.row].name
            }
        }
        //cell.setup
        //cell.setupModel(model: coins[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //indexPath.accessoryType = UITableViewCell.AccessoryType.checkmark
        for i in 0...3{
            let indexPath = IndexPath(row: i, section: 0)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = UITableViewCell.AccessoryType.none
        }
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        active = coins[indexPath.row].name
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC: ViewController = segue.destination as! ViewController
        destinationVC.left = leftnum
        destinationVC.right = rightnum
        if whois == "leftpress"{
            //print(active)
            destinationVC.left_coin = active
            destinationVC.right_coin = right
            
        }
        else
        {
            //print(active)
            destinationVC.left_coin = left
            destinationVC.right_coin = active
        }
        
        //destinationVC.whois = segue.identifier ?? "default value"
        
        
    }
}
