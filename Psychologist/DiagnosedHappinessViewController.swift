//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Joan Coyne on 4/16/15.
//  Copyright (c) 2015 Mzinga. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
        
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get {return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []}
        set {defaults.setObject(newValue, forKey:History.DefaultsKey) }
    }

    
   
    private struct History {
        static let SequeIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SequeIdentifier :
                if let tvc = segue.destinationViewController as? TextUIViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller:UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}
