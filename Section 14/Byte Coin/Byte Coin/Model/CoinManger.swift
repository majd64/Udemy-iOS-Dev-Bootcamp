import Foundation

class CoinManger{
    var delegate: coinMangerDelegate?
    func getPrice(in currency: String){
        let url: String = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)?apikey=B35E3483-4D64-45D4-9CD0-BC95AF0EC044"
        performRequest(with: url)
    }
    
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    if let price:Double = self.parseJSON(safeData){
                        self.delegate?.didUpdatePrice(self, price: price)
                    }
                }
            }
            
            task.resume()
            
        }
    }
    
    
    func parseJSON(_ data: Data) -> Double?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(priceData.self, from: data)
            let price = decodedData.rate
            
            return price
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}


protocol coinMangerDelegate{
    func didUpdatePrice(_ coinManger: CoinManger, price: Double)
    func didFailWithError(error: Error)
}
