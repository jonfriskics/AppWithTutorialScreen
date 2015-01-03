//
//  TutorialViewController.swift
//  AppWithTutorialScreen
//
//  Created by Jon Friskics on 1/3/15.
//  Copyright (c) 2015 Jon Friskics. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIPageViewControllerDataSource {
    
    lazy var pageViewController: UIPageViewController = {
        return UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
    }()
    
    var vcs = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGrayColor()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let vc1 = SinglePageViewController()
        vc1.view.backgroundColor = UIColor.redColor()
        vc1.index = 0
        
        let vc2 = SinglePageViewController()
        vc2.view.backgroundColor = UIColor.greenColor()
        vc2.index = 1
        
        let vc3 = SinglePageViewController()
        vc3.view.backgroundColor = UIColor.blueColor()
        vc3.index = 2
        
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(0, 200, CGRectGetWidth(view.bounds), 30)
        button.setTitle("dismiss tutorial", forState: UIControlState.Normal)
        button.addTarget(self, action: "dismissTutorial", forControlEvents: UIControlEvents.TouchUpInside)
        vc3.view.addSubview(button)
        
        vcs = [vc1, vc2, vc3]
        
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
        
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([vc1], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    
    func dismissTutorial() -> Void {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let currentVC = viewController as SinglePageViewController
        var index = currentVC.index

        println("after \(index) color \(currentVC.view.backgroundColor)")

        if(currentVC.index == vcs.count-1) {
            return nil
        }
        
        index++
        
        return vcs[index] as SinglePageViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let currentVC = viewController as SinglePageViewController
        var index = currentVC.index

        println("before \(index) color \(currentVC.view.backgroundColor)")

        if(currentVC.index == 0) {
            return nil
        }
        
        index--
        
        return vcs[index] as SinglePageViewController
    }
}
