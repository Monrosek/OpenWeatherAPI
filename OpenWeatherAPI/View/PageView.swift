//
//  PageView.swift
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class PageView: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    var pageID: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.typeLabel!.text = pageID
    }
    
    
}


