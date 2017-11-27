//
//  PageViewController.swift
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController?
    var viewModel: PageViewModel?
    
    override func viewDidLoad() {
        
        API.getWeatherModel() { (pageModel,error) in
            guard error == nil else {return}
            guard let pageModel = pageModel else {return}
            DispatchQueue.main.sync {
                self.viewModel = pageModel
                self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
                self.pageViewController!.delegate = self
                let startingViewController: PageView = (self.viewModel?.viewControllerAtIndex(0, storyboard: self.storyboard!))!
                let viewControllers = [startingViewController]
                self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
                self.pageViewController!.dataSource = self.viewModel
                self.addChildViewController(self.pageViewController!)
                self.view.addSubview(self.pageViewController!.view)
                var pageViewRect = self.view.bounds
                if UIDevice.current.userInterfaceIdiom == .pad {
                    pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
                }
                self.pageViewController!.view.frame = pageViewRect
                self.pageViewController!.didMove(toParentViewController: self)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


