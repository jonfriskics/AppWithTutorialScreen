//
//  RootViewController.swift
//  AppWithTutorialScreen
//
//  Created by Jon Friskics on 1/3/15.
//  Copyright (c) 2015 Jon Friskics. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellowColor()
        
        let showTutorial = UIButton.buttonWithType(UIButtonType.System) as UIButton
        showTutorial.frame = CGRectMake(0, 200, CGRectGetWidth(view.bounds), 30)
        showTutorial.setTitle("Show Tutorial", forState: UIControlState.Normal)
        showTutorial.addTarget(self, action: "buttonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(showTutorial)
    }
    
    func buttonPressed() -> Void {
        let tutorialVC = TutorialViewController()
        presentViewController(tutorialVC, animated: true, completion: nil)
    }
    
}
