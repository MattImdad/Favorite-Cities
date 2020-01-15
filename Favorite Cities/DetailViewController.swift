//
//  DetailViewController.swift
//  Favorite Cities
//
//  Created by matt imdad on 1/10/20.
//  Copyright © 2020 matt imdad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var detailItem: City? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    func configureView() {
       // Update the user interface for the detail item
       if let City = self.detailItem {
          if cityTextField != nil {
             cityTextField.text = City.name
             stateTextField.text = City.state
             populationTextField.text = String(City.population)
             imageView.image = UIImage(data: City.image)
          }
       }
    }
    override func viewWillDisappear(_ animated: Bool) {
        if let City = self.detailItem {
           City.name = cityTextField.text!
           City.state = stateTextField.text!
           City.population = Int(populationTextField.text!)!
        }
    }
}

