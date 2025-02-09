//
//  WeatherManager.swift
//  Clima
//
//  Created by Nam on 2/9/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6cba410b246fea6ffa10e631d2fbbbae&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"   //  유저로부터 입력받은 도시명을 추가한 새로운 URL
        print(urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        print("Print me!")
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) {(data, response, error) in  // 클로져로 구현
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            // 4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        } catch {
            print(error)
        }
    }
    
//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error!)
//            return
//        }
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString!)
//        }
//        
//    }
}
