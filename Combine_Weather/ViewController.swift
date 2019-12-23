//
//  ViewController.swift
//  Combine_Weather
//
//  Created by Eng Angelo E Saber on 12/22/19.
//  Copyright © 2019 Eng Angelo E Saber. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private var webservice = NewtorkLayer()
    private var cancellable : AnyCancellable?
    @IBOutlet weak var tempLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellable = self.webservice.fetchWeather()
            .catch{ _ in  Just(Main.mainPlaceHolder)
        }
            
        .map { "\(String(describing: $0.temp))"}
        .assign(to: \.text, on: self.tempLabel)
        
        
        self.cancellable?.cancel()
        
        
    }
    
    
}

