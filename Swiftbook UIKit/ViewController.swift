//
//  ViewController.swift
//  Swiftbook UIKit
//
//  Created by Павел Яковенко on 11.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 30
        
        resultLabel.text = String(slider.value)
    }

    
    @IBAction func changedSlider(_ sender: UISlider) {
        
        resultLabel.text = String(round(sender.value))
    }
    
    
    @IBAction func done(_ sender: UIButton) {
        let name = textField.text
        resultLabel.text = name
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
    let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full

        let dateValue = dateFormatter.string(from: sender.date)

        resultLabel.text = dateValue
    }
    
    

    
}

