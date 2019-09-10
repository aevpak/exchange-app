//
//  ViewController.swift
//  exchange
//
//  Created by Екатерина on 07/09/2019.
//  Copyright © 2019 alexander-evpak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftnum: UITextField!
    
    @IBOutlet weak var rightnum: UITextField!
    
    @IBOutlet weak var leftcoinname: UILabel!
    
    @IBOutlet weak var rightcoinname: UILabel!
    struct record: Decodable{
        var Date: String?
        var PreviousDate: String?
        var PreviousURL: String?
        var Timestamp: String?
        var Valute: Coins?
    }
    struct Coins: Decodable{
        var AUD: inform?
        var AZN: inform?
        var GBP: inform?
        var AMD: inform?
        var BYN: inform?
        var BGN: inform?
        var BRL: inform?
        var HUF: inform?
        var HKD: inform?
        var DKK: inform?
        var USD: inform?
        var EUR: inform?
        var INR: inform?
        var KZT: inform?
        var CAD: inform?
        var KGS: inform?
        var CNY: inform?
        var MDL: inform?
        var NOK: inform?
        var PLN: inform?
        var RON: inform?
        var XDR: inform?
        var SGD: inform?
        var TJS: inform?
        var TRY: inform?
        var TMT: inform?
        var UZS: inform?
        var UAH: inform?
        var CZK: inform?
        var SEK: inform?
        var CHF: inform?
        var ZAR: inform?
        var KRW: inform?
        var JPY: inform?
    }
    struct inform: Decodable{
        var ID: String
        var NumCode: String
        var CharCode: String
        var Nominal: Int
        var Name: String
        var Value: Float
        var Previous: Float
    }
    func updatefields(who: String){
        if who == "left" {
            switch self.left_coin {
            case "BRL":
                do {switch self.right_coin {
                case "BRL":
                    do {   self.leftnum.text = self.left
                        self.rightnum.text = self.left
                    }
                case "EUR":
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! / eurval * brlval)
                    }
                case "AUD":
                    
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! / audval * brlval)
                    }
                    
                default:
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! * brlval )
                    }
                    }
                }
            case "EUR":
                do {switch self.right_coin {
                case "BRL":
                    do {   self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! * eurval / brlval)
                    }
                case "EUR":
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = self.left
                    }
                case "AUD":
                    
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! / audval * eurval)
                    }
                    
                default:
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! * eurval )
                    }
                    }
                }
            case "AUD":
                do {switch self.right_coin {
                case "BRL":
                    do {   self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! * audval / brlval)
                    }
                case "EUR":
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! * audval / eurval)
                    }
                case "AUD":
                    
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = self.left
                    }
                    
                default:
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! * audval )
                    }
                    }
                }
            default:
                do {switch self.right_coin {
                case "BRL":
                    do {   self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! / brlval)
                    }
                case "EUR":
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! / eurval)
                    }
                case "AUD":
                    
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = String(Float(self.left)! / audval)
                    }
                    
                default:
                    do {
                        self.leftnum.text = self.left
                        self.rightnum.text = self.left
                    }
                    }
                }
            }
            
        } else {
            switch self.left_coin {
            case "BRL":
                do {switch self.right_coin {
                case "BRL":
                    do {   self.leftnum.text = self.left
                        self.rightnum.text = self.left
                    }
                case "EUR":
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! * eurval / brlval)
                    }
                case "AUD":
                    
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! * audval / brlval)
                    }
                    
                default:
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! / brlval )
                    }
                    }
                }
            case "EUR":
                do {switch self.right_coin {
                case "BRL":
                    do {   self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! / eurval * brlval)
                    }
                case "EUR":
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = self.right
                    }
                case "AUD":
                    
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! * audval / eurval)
                    }
                    
                default:
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! / eurval )
                    }
                    }
                }
            case "AUD":
                do {switch self.right_coin {
                case "BRL":
                    do {   self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! / audval * brlval)
                    }
                case "EUR":
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! / audval * eurval)
                    }
                case "AUD":
                    
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = self.right
                    }
                    
                default:
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! / audval )
                    }
                    }
                }
            default:
                do {switch self.right_coin {
                case "BRL":
                    do {   self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! * brlval)
                    }
                case "EUR":
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! * eurval)
                    }
                case "AUD":
                    
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = String(Float(self.right)! * audval)
                    }
                    
                default:
                    do {
                        self.rightnum.text = self.right
                        self.leftnum.text = self.right
                    }
                    }
                }
            }
            
            
        }
        
    }
    var left_coin: String = "BRL"
    var right_coin: String = "EUR"
    var left: String = "100"
    var right: String = "100"
    var eurval: Float = 72.33
    var brlval: Float = 16.1391
    var audval: Float = 44.9874
    @objc func enterPressedl(){
        if leftnum.text?.count == 0 {
            leftnum.text = "0"
        }
        if rightnum.text?.count == 0 {
            rightnum.text = "0"
        }
        let digitSet = CharacterSet.decimalDigits
        var i = 0
        for ch in leftnum.text!.unicodeScalars {
            
            if  digitSet.contains(ch) == false {
                var buf:String = leftnum.text!
                var c:Character
                c = buf.remove(at: (buf.index(buf.startIndex, offsetBy:i)))
                i=i-1
                leftnum.text = buf
            }
            i = i+1
        }
        i = 0
        for ch in rightnum.text!.unicodeScalars {
            
            if  digitSet.contains(ch) == false {
                var buf:String = rightnum.text!
                var c:Character
                c = buf.remove(at: (buf.index(buf.startIndex, offsetBy:i)))
                i=i-1
                rightnum.text = buf
            }
            i = i+1
        }
        left = String(leftnum.text!)
        right = String(rightnum.text!)
        updatefields(who: "left")
        leftnum.resignFirstResponder()
    }
    @objc func enterPressedr(){
        left = String(leftnum.text!)
        right = String(rightnum.text!)
        updatefields(who: "right")
        rightnum.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        leftnum.addTarget(self, action: #selector(enterPressedl), for: .editingDidEndOnExit)
        rightnum.addTarget(self, action: #selector(enterPressedr), for: .editingDidEndOnExit)
        
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }
            do{
                let information = try JSONDecoder().decode(record.self, from: data)
                DispatchQueue.main.async {
                self.eurval = information.Valute?.EUR?.Value ?? 1.0
                self.audval = information.Valute?.AUD?.Value ?? 1.0
                self.brlval = information.Valute?.BRL?.Value ?? 1.0
                self.leftcoinname.text = self.left_coin
                self.rightcoinname.text = self.right_coin
                self.updatefields(who: "left")
                }
                 //leftnum.text = String(Float(rightnum.text) * information.Value?.)
                
            } catch let error{
                print(error)
            }
            }.resume()
        
       
        
        //print("\(left_coin) - \(right_coin)")
        
        // Do any additional setup after loading the view.
        //self.field1.text = "hello!"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "leftpress" || segue.identifier == "rightpress"{
            let destinationVC: load = segue.destination as! load
        
            destinationVC.whois = segue.identifier ?? "default value"
            destinationVC.left = leftcoinname.text ?? "default value"
            destinationVC.right = rightcoinname.text ?? "default value"
            destinationVC.leftnum = leftnum.text ?? "default value"
            destinationVC.rightnum = rightnum.text ?? "default value"
        }
        
    }
    

}

