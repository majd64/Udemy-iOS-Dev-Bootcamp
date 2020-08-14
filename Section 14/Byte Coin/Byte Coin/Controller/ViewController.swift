import UIKit
import Foundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, coinMangerDelegate {
    @IBOutlet weak var priceLabel: UILabel!
    
    var currencySelected:String?
    
    func didUpdatePrice(_ coinManger: CoinManger, price: Double) {
        
        print("did update price: \(price)")
        DispatchQueue.main.async {
            let priceString:String = "\(String(format: "%.2f", price)) \(self.currencySelected ?? "USD")"
            self.priceLabel.text = priceString
        }
        
    }
    
   
    
    func didFailWithError(error: Error) {
        print("error")
    }
    
    
    let coinManger = CoinManger()
    let fiatCurrencies: [String] = ["USD", "CAD", "EUR"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fiatCurrencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow component: Int) -> Int {
        return fiatCurrencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fiatCurrencies[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencySelected = fiatCurrencies[row]
        coinManger.getPrice(in: fiatCurrencies[row])
        
    }
    
    
    
    
    
    @IBOutlet weak var fiatPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fiatPicker.delegate = self
        fiatPicker.dataSource = self
        
        coinManger.delegate = self
        coinManger.getPrice(in: fiatCurrencies[0])
        
        // Do any additional setup after loading the view.
    }


}

