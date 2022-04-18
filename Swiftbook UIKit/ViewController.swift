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
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchLabel: UILabel!
    
    let elements = ["UISegmentedControl", "UILabel", "UISlider", "UIDoneButton", "UIPicker", "UISwitch", "Показать все"]
    
    var selectedElement: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 30
        
        resultLabel.text = String(slider.value)
        
        choiceUIElement()
        createToolbar()
    }
    
    
    func createToolbar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButtonPicker = UIBarButtonItem(title: "done",
                                           style: .plain,
                                           target: self,
                                           action: #selector(dismisKeyboard))

        toolbar.setItems([doneButtonPicker], animated:  true)
        toolbar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolbar
    }
    
    @objc func dismisKeyboard(){
        view.endEditing(true)
    }
    
    
    func choiceUIElement(){
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        textField.inputView = elementPicker
    }
    
    func hideAllElements(){
        segmentedControl.isHidden = true
        resultLabel.isHidden = true
        slider.isHidden = true
        doneButton.isHidden = true
        datePicker.isHidden = true
        switchLabel.isHidden = true
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
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        segmentedControl.isHidden = !segmentedControl.isHidden
        resultLabel.isHidden = !resultLabel.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        doneButton.isHidden = !doneButton.isHidden
        datePicker.isHidden = !datePicker.isHidden
        
        if sender.isOn {
            switchLabel.text = "Скрыть все элементы"
        } else {
            switchLabel.text = "Отобразить все элементы"
        }
    }
    
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return elements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return elements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = elements[row]
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElements()
            segmentedControl.isHidden = false
        case 1:
            hideAllElements()
            resultLabel.isHidden = false
        case 2:
            hideAllElements()
            slider.isHidden = false
        case 3:
            hideAllElements()
            doneButton.isHidden = false
        case 4:
            hideAllElements()
            datePicker.isHidden = false
        case 5:
            hideAllElements()
            switchLabel.isHidden = false
        case 6:
            hideAllElements()
            segmentedControl.isHidden = false
            resultLabel.isHidden = false
            slider.isHidden = false
            doneButton.isHidden = false
            datePicker.isHidden = false
            switchLabel.isHidden = false
        default:
            break
        }
    }
}
