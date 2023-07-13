//
//  ViewController.swift
//  RGBA3
//
//  Created by 本杉春奈 on 2023/07/07.
//

import UIKit



class ViewController: UIViewController {
    
    var rValue:CGFloat = (1.0)
    var gValue:CGFloat = (1.0)
    var bValue:CGFloat = (1.0)
    var aValue:CGFloat = (1.0)
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var alphaTextField: UITextField!
    
    @IBOutlet weak var redSliderFrame: UISlider!
    @IBOutlet weak var greenSliderFrame: UISlider!
    @IBOutlet weak var blueSliderFrame: UISlider!
    @IBOutlet weak var alphaSliderFrame: UISlider!
    
    let rgba = RGBA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let holdRedValue = UserDefaults.standard.float(forKey: "hold_red_value")
        let holdGreenValue = UserDefaults.standard.float(forKey: "hold_green_value")
        let holdBlueValue = UserDefaults.standard.float(forKey: "hold_blue_value")
        let holdAlphaValue = UserDefaults.standard.float(forKey: "hold_alpha_value")
        
        redTextField.isEnabled = false
        greenTextField.isEnabled = false
        blueTextField.isEnabled = false
        alphaTextField.isEnabled = false
        
        redTextField.text = String(format: "%.0f",holdRedValue)
        greenTextField.text = String(format: "%.0f",holdGreenValue)
        blueTextField.text = String(format: "%.0f",holdBlueValue)
        alphaTextField.text = String(format: "%.1f",holdAlphaValue/255)
        
        redSliderFrame.value = holdRedValue
        greenSliderFrame.value = holdGreenValue
        blueSliderFrame.value = holdBlueValue
        alphaSliderFrame.value = holdAlphaValue
        
        rValue = CGFloat(holdRedValue/255)
        gValue = CGFloat(holdGreenValue/255)
        bValue = CGFloat(holdBlueValue/255)
        aValue = CGFloat(holdAlphaValue/255)
        
        drawBackgroundColor()
    }
    
    @IBAction func redSlider(_ sender: UISlider){
//        let sliderValueR = UInt8(sender.value)
        rgba.R(tmp: sender.value)
        print(rgba.rValue)
//        rValue = CGFloat(sender.value/255)
        drawBackgroundColor()
        redTextField.text = String(rgba.haku)
        UserDefaults.standard.set(rgba.haku, forKey: "hold_red_value")
    }
    
    
    @IBAction func greenSlider(_ sender: UISlider) {
        let sliderValueG = UInt8(sender.value)
        gValue = CGFloat(sender.value/255)
        drawBackgroundColor()
        greenTextField.text = String(sliderValueG)
        UserDefaults.standard.set(sliderValueG, forKey: "hold_green_value")
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        let sliderValueB = UInt8(sender.value)
        bValue = CGFloat(sender.value/255)
        drawBackgroundColor()
        blueTextField.text = String(sliderValueB)
        UserDefaults.standard.set(sliderValueB, forKey: "hold_blue_value")
    }
    
    @IBAction func alphaSlider(_ sender: UISlider) {
        let sliderValueA = UInt8(sender.value)
        aValue = CGFloat(sender.value/255)
        drawBackgroundColor()
        alphaTextField.text = String(format: "%.1f",sender.value/255)
        UserDefaults.standard.set(sliderValueA, forKey: "hold_alpha_value")
    }
    
    func drawBackgroundColor() {
        view.backgroundColor = UIColor(red: rgba.rValue, green: gValue, blue: bValue, alpha:aValue)
    }
    
    @IBAction func clearButton(_ sender: UIButton){
        
        rValue = rgba.rValue
        redSliderFrame.setValue(Float(rValue)*255, animated: true)
        drawBackgroundColor()
        redTextField.text = String(format: "%.0f",redSliderFrame.value)
        UserDefaults.standard.set(redSliderFrame.value, forKey: "hold_red_value")
        
        gValue = rgba.gValue
        greenSliderFrame.setValue(Float(gValue)*255, animated: true)
        drawBackgroundColor()
        greenTextField.text = String(format: "%.0f",greenSliderFrame.value)
        UserDefaults.standard.set(greenSliderFrame.value, forKey: "hold_green_value")
        
        bValue = rgba.bValue
        blueSliderFrame.setValue(Float(bValue)*255, animated: true)
        drawBackgroundColor()
        blueTextField.text = String(format: "%.0f",blueSliderFrame.value)
        UserDefaults.standard.set(blueSliderFrame.value, forKey: "hold_blue_value")
        
        aValue = rgba.aValue
        alphaSliderFrame.setValue(Float(aValue)*255, animated: true)
        drawBackgroundColor()
        alphaTextField.text = String(format: "%.1f",alphaSliderFrame.value/255)
        UserDefaults.standard.set(alphaSliderFrame.value, forKey: "hold_alpha_value")
        
        
    }
    
}

