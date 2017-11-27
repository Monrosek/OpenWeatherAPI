//
//  pageViewModel
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class PageViewModel: NSObject {
    
    var zip = Int()
    var pageData: [String] = []
    var forecast:OpenWeather? {
        didSet {
          //  pageData.append("Temperature")
        }
    }
    
    init(_ zip: Int) {
        self.zip = zip
    }
    
    init(_ forecast:OpenWeather) {
        self.forecast = forecast
        pageData.append("Temperature")
        pageData.append("Humidity")
        pageData.append("Wind")
    }
}

typealias PageControllerFunc = PageViewModel
extension PageControllerFunc: UIPageViewControllerDataSource {
    
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> PageView? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        switch pageData[index] {
        case "Temperature":
            let PageView = storyboard.instantiateViewController(withIdentifier: "PageView") as! PageView
            PageView.pageID = self.pageData[index]
            print("temp: \(self.forecast?.main?.temp ?? 0.0)")
            let temp = self.forecast?.main?.temp ?? 0.0
            PageView.view.backgroundColor = UIColor.orange
            PageView.dataLabel?.text = String(format: "%.0f", temp * (9/5) - 459.67)
            PageView.cityLabel?.text = self.forecast?.name ?? ""
            PageView.icon.image = #imageLiteral(resourceName: "temperature")
            PageView.metricLabel.text = "℉"
            return PageView
        case "Wind":
            let PageView = storyboard.instantiateViewController(withIdentifier: "PageView") as! PageView
            PageView.pageID = self.pageData[index]
            PageView.view.backgroundColor = UIColor(0x669999)
            if let wind = self.forecast?.wind?.speed {
                PageView.dataLabel?.text = String(Int(wind))
            }
            PageView.dataLabel.layer.zPosition = 5
            PageView.icon.image = #imageLiteral(resourceName: "winds")
            PageView.icon.layer.zPosition = -5
            PageView.cityLabel?.text = self.forecast?.name ?? ""
            PageView.metricLabel.text = "MPH"

            return PageView
        case "Humidity":
            let PageView = storyboard.instantiateViewController(withIdentifier: "PageView") as! PageView
            PageView.pageID = self.pageData[index]
            PageView.view.backgroundColor = UIColor(0x3399ff)
            PageView.icon.image = #imageLiteral(resourceName: "humidity")
            PageView.dataLabel?.text = String(self.forecast?.main?.humidity ?? 0)
            PageView.cityLabel?.text = self.forecast?.name ?? ""
            PageView.metricLabel.text = "%"

            
            return PageView
        default: return nil
        }
    }
    
    func indexOfViewController(_ viewController: PageView) -> Int {
        return pageData.index(of: viewController.pageID) ?? NSNotFound
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! PageView)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! PageView)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

