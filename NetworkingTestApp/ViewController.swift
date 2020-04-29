//
//  ViewController.swift
//  NetworkingTestApp
//
//  Created by Majdi Felah on 16/04/2020.
//  Copyright © 2020 Majdi Felah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let session = URLSession()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let httpClient = HttpClient(session: session)
        
    }

    func get(){
        
    }
}
