//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Genesis Mosquera on 11/30/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    
    @IBOutlet weak var crayonColor:UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaStepperLabel: UILabel!
    
    
    var crayonInfo: Crayon?
    var currentSliderValue: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCrayonUI()
        redSliderLabel.text = "Current Red Value Above is \(crayonInfo!.red)"
        redSlider.value = Float((crayonInfo?.red)!)
        redSlider.minimumValue = 0
        redSlider.maximumValue = 10
        greenSliderLabel.text = "Current Green Value Above is \(crayonInfo!.green)"
        greenSlider.value = Float((crayonInfo?.green)!)
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 10
        blueSliderLabel.text = "Current Blue Value Above is \(crayonInfo!.blue)"
        blueSlider.value = Float((crayonInfo?.blue)!)
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 10
    }
    
    @IBAction func redSliderChange( sender: UISlider) {
        //redSlider.value = sender.value
        currentSliderValue = Float(crayonInfo!.red)
        redSlider.value = currentSliderValue
        redSliderLabel.text = Int(sender.value).description
        
    }
    
    @IBAction func blueSliderChange( sender: UISlider) {
        currentSliderValue = Float(crayonInfo!.blue)
        blueSlider.value = currentSliderValue
        blueSliderLabel.text =
            Int(sender.value).description
    }
    
    @IBAction func greenSliderChange ( sender: UISlider) {
        currentSliderValue = Float(crayonInfo!.green)
        greenSlider.value = currentSliderValue
        greenSliderLabel.text = Int(sender.value).description
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        alphaStepperLabel.text = sender.value.description
    }

    
    private func updateCrayonUI() {
        guard let crayonInfo = crayonInfo else {
            fatalError("Cell is nil")
        }
        crayonColor.text = crayonInfo.name.uppercased()
        //        view.backgroundColor = UIColor.init(red: CGFloat(crayonInfo.red), green: CGFloat(crayonInfo.green), blue: CGFloat(crayonInfo.blue), alpha: 1)
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayonInfo.red/255), green: CGFloat(crayonInfo.green/255), blue: CGFloat(crayonInfo.blue/255), alpha: 1)
    }
    
}
