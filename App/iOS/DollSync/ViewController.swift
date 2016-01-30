//
//  ViewController.swift
//  DollSync
//
//  Created by 文光石 on 2016/01/25.
//  Copyright © 2016年 Threees. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let konashi_name_wen = "konashi#4-1426"
    
    @IBOutlet weak var wordText: UITextField!
    
    var dsKonashi: DSKonashi!
    var dsVoice: DSVoice!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dsKonashi = DSKonashi()
        dsVoice = DSVoice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (self.wordText.isFirstResponder()) {
            self.wordText.resignFirstResponder()
        }
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }


    @IBAction func find(sender: AnyObject) {
        dsKonashi.find()
        //dsKonashi.findWithName(self.konashi_name_wen)
    }
    
    @IBAction func speak(sender: AnyObject) {
        let word = self.wordText.text
        self.dsVoice.speachWord(word!)
    }
}

