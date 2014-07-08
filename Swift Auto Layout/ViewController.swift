//
//  ViewController.swift
//  Swift Auto Layout
//
//  Created by Daniel Zhang (張道博) on 7/4/14.
//  Copyright (c) 2014 Daniel Zhang (張道博). All rights reserved.
//

import UIKit

// Want to have an auto layout constraint added by:
//
//   centerX(A) => centerX(B) + 24
//
// where A and B are views.

class ViewController: UIViewController {

    @IBOutlet var centeredButton: UIButton
    @IBOutlet var topButton: UIButton
    @IBOutlet var bottomButton: UIButton
    var useMathMethod = false

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.useMathMethod { self.addConstraintsMathMethod() }
        else { self.addConstraintsDefaultMethod() }
    }

    func addConstraintsDefaultMethod() {
        NSLayoutConstraint.deactivateConstraints(self.view.constraints())

        // Add constraints programmatically one-by-one:
        self.view.addConstraint(NSLayoutConstraint(
            item:self.centeredButton, attribute:.CenterX,
            relatedBy:.Equal, toItem:self.view,
            attribute:.CenterX, multiplier:1, constant:0))
        self.view.addConstraint(NSLayoutConstraint(
            item:self.centeredButton, attribute:.CenterY,
            relatedBy:.Equal, toItem:self.view,
            attribute:.CenterY, multiplier:1, constant:0))

        self.view.addConstraint(NSLayoutConstraint(
            item:self.topButton, attribute:.CenterX,
            relatedBy:.Equal, toItem:self.view,
            attribute:.CenterX, multiplier:1, constant:0))
        self.view.addConstraint(NSLayoutConstraint(
            item:self.topButton, attribute:.CenterY,
            relatedBy:.Equal, toItem:self.view,
            attribute:.Top, multiplier:1, constant:self.view.center.y/2))

        self.view.addConstraint(NSLayoutConstraint(
            item:self.bottomButton, attribute:.CenterX,
            relatedBy:.Equal, toItem:self.view,
            attribute:.CenterX, multiplier:1, constant:0))
        self.view.addConstraint(NSLayoutConstraint(
            item:self.bottomButton, attribute:.CenterY,
            relatedBy:.Equal, toItem:self.view,
            attribute:.Bottom,multiplier:1, constant:-self.view.center.y/2))
    }


    func addConstraintsMathMethod() {
        NSLayoutConstraint.deactivateConstraints(self.view.constraints())

        // Add constraints mathematically with a little help of functions on
        // overloaded operators so that the form corresponds to y = mx+b.
        centerX(self.centeredButton) => centerX(self.view) + 0
        centerY(self.centeredButton) => centerY(self.view) + 0

        centerY(self.topButton) => top(self.view) + CGFloat(self.view.center.y/2)
        centerX(self.topButton) => centerX(self.view) + 0

        centerY(self.bottomButton) => bottom(self.view) + -CGFloat(self.view.center.y/2)
        centerX(self.bottomButton) => centerX(self.view) + 0
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

