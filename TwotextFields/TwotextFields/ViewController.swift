//
//  ViewController.swift
//  TwotextFields
//
//  Created by Abhishek Kumar on 20/03/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: variables & constants
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    let notificationCenter = NotificationCenter.default

    @IBAction func set(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            setText(textfield1, label: label1)
            textfield2.becomeFirstResponder()
        case 2:
            setText(textfield2, label: label2)
        default:
            print("Button Not Found")
        }
    }
    
    
    @IBAction func erase(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            deleteText(textfield1, label: label1)
        case 2:
            deleteText(textfield2, label: label2)
        default:
            print("Button Not Found")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield1.tag = 1
        textfield2.tag = 2
        textfield1.becomeFirstResponder()
    }
    
    func setText(_ textfield: UITextField, label: UILabel) {
        label.text = textfield.text
    }
    
    func deleteText(_ textfield: UITextField, label: UILabel) {
        label.text = nil
        textfield.text = nil
        textfield.resignFirstResponder()
    }
}



// MARK: Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1: print("First Textfield")
        case 2: print("Second Textfield")
        default:
            print("Not Any Textfield")
        }
        print("Text Field Should Clear")
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1: print("First Textfield")
        case 2: print("Second Textfield")
        default:
            print("Not Any Textfield")
        }
        print("textFieldShouldBeginEditing")
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1: print("First Textfield")
        case 2: print("Second Textfield")
        default:
            print("Not Any Textfield")
        }
        print("textFieldShouldBeginEditing")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch textField.tag {
        case 1:
            setText(textField, label: label1)
            textfield2.becomeFirstResponder()
        case 2:
            setText(textField, label: label2)
        default:
            print("No textfield found")
        }
        print("textFieldShouldReturn")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1: print("First Textfield")
        case 2: print("Second Textfield")
        default:
            print("Not Any Textfield")
        }
        print("Text Field Did Begin Editing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1: print("First Textfield")
        case 2: print("Second Textfield")
        default:
            print("Not Any Textfield")
        }
        print("Text Field Did End Editing")
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField.tag {
        case 1: print("First Textfield")
        case 2: print("Second Textfield")
        default:
            print("Not Any Textfield")
        }
        print("Text Field Did Change Selection")
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField.tag {
        case 1: print("First Textfield")
        case 2: print("Second Textfield")
        default:
            print("Not Any Textfield")
        }
        print("textFieldDidEndEditing with reason")
    }
    
    
    func textField(_ textFieldToChange: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty || textFieldToChange.tag == 1 {
        return true
      }

      let characterSetAllowed = CharacterSet.punctuationCharacters
      if let rangeOfCharactersAllowed = string.rangeOfCharacter(from: characterSetAllowed, options: .caseInsensitive) {
        let validCharacterCount = string.distance(from: rangeOfCharactersAllowed.lowerBound, to: rangeOfCharactersAllowed.upperBound)
        return validCharacterCount == string.count
      } else  {
        return false
      }
    }
    
}

