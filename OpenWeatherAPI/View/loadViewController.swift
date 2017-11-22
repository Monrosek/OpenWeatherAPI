//
//  loadViewController.swift
//  OpenWeatherAPI
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class loadViewController: UIViewController {

    var zip = Int()
    var openWeather:OpenWeather?
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading.startAnimating()
        API.getWeather(byZipcode: zip) {  (openWeather,error) in
            guard error == nil else {return}
            guard let openWeather = openWeather else {fatalError("bad open weather")}
            DispatchQueue.main.sync{
                self.openWeather = openWeather
                self.loading.stopAnimating()
                self.performSegue(withIdentifier: "launch", sender: self)

            }
        }
        
//        NetworkService.getWeather(zip: 11213) { (weatherData, error) in
//            guard error == nil else {return}
//            guard let weatherData = weatherData else {return}
//            DispatchQueue.main.sync {
//               self.openWeather = weatherData
//                self.performSegue(withIdentifier: "launch", sender: self)
//
//            }
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let NC = segue.destination as? UINavigationController else {return}
        guard let VC = NC.viewControllers.first as? RootViewController  else {return}
        if let forecast = openWeather {
            VC.viewModel = PageViewModel(forecast)
        }
    }
    

}
