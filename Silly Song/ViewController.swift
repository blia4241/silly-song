//
//  ViewController.swift
//  Silly Song
//
//  Created by Brent Liang on 2/12/17.
//  Copyright © 2017 Brent Liang. All rights reserved.
//

import UIKit

func shortNameFromName (_ name: String) -> String {
    var shortName = name.lowercased()
    let vowelSet = CharacterSet.init(charactersIn: "aeiou")
    let range = shortName.rangeOfCharacter(from: vowelSet)
    if let range = range {
        shortName = shortName.substring(from: range.lowerBound)
    }
    print(shortName)
    return shortName
}

func lyricsForName (fullName: String) -> String {
    let lyricsOutput = [
        "\(fullName), \(fullName), Bo B\(shortNameFromName(fullName))",
        "Banana Fana Fo F\(shortNameFromName(fullName))",
        "Me My Mo M\(shortNameFromName(fullName))",
        "\(fullName)"].joined(separator: "\n")
    return lyricsOutput
}

// MARK: - UITextFieldDelegaet

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
        
    }

    
    @IBAction func displayLyrics(_ sender: Any) {
        if (nameField.text?.isEmpty)! {
            lyricsView.text = "Please enter your name!"
        }
        else {
            lyricsView.text = lyricsForName(fullName: nameField.text!)
            
        }
    
    }
    
}

