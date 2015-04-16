//
//  TextUIViewController.swift
//  Psychologist
//
//  Created by Joan Coyne on 4/16/15.
//  Copyright (c) 2015 Mzinga. All rights reserved.
//

import UIKit

class TextUIViewController: UIViewController {
  
  
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }
    
}
