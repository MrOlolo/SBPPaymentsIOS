//
//  ViewController.swift
//  SBPWidget
//
//  Created by Nikolay Hordynchuk on 03/22/2021.
//  Copyright (c) 2021 Nikolay Hordynchuk. All rights reserved.
//

import SBPPayment
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        showSBP()
    }
  
    @IBAction func showSBP() {
        SBPWidgetModule().show(on: self) { result in
            switch result {
            case .success: break
//        print(scheme ?? "widget has been closed")
            case .failure: break
//        print(error)
            }
        }
    }
    
    @IBAction func showCustomSBP() {
        SBPWidgetModule().show(on: self, backgroundColor: 0xFF293232, textColor: 0xFFFFFFFF) { result in
            switch result {
            case .success(let scheme):
                print(scheme ?? "widget has been closed")
            case .failure(let error):
                print(error)
            }
        }
    }
}
