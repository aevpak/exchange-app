//
//  values.swift
//  exchange
//
//  Created by Екатерина on 07/09/2019.
//  Copyright © 2019 alexander-evpak. All rights reserved.
//

import UIKit
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
class values: UIViewController {

    @IBOutlet weak var field1: UILabel!
    @IBOutlet weak var field2: UILabel!
    @IBOutlet weak var field3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }
            do{
            let information = try JSONDecoder().decode(record.self, from: data)
               
                let eurval = information.Valute?.EUR?.Value
                let eurname = information.Valute?.EUR?.Name
                let audval = information.Valute?.AUD?.Value
                let audname = information.Valute?.AUD?.Name
                let brlval = information.Valute?.BRL?.Value
                let brlname = information.Valute?.BRL?.Name
                DispatchQueue.main.async {
                    self.field1.adjustsFontSizeToFitWidth = true
                    self.field2.adjustsFontSizeToFitWidth = true
                    self.field3.adjustsFontSizeToFitWidth = true
                    self.field1.text = "\(eurname!): \(eurval!) руб."
                    self.field2.text = "\(brlname!): \(brlval!) руб."
                    self.field3.text = "\(audname!): \(audval!) руб."
                }
            } catch let error{
                print(error)
            }
        }.resume()
    }
    
}
