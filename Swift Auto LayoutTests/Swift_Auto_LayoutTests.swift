//
//  Swift_Auto_LayoutTests.swift
//  Swift Auto LayoutTests
//
//  Created by Daniel Zhang (張道博) on 7/4/14.
//  Copyright (c) 2014 Daniel Zhang (張道博). All rights reserved.
//

import XCTest
import UIKit
import Swift_Auto_Layout

class Swift_Auto_LayoutTests: XCTestCase {

    var vc:ViewController = ViewController()
    var constraintsDefaultMethod:[AnyObject] = []
    var constraintsMathMethod:[AnyObject] = []

    override func setUp() {
        super.setUp()

        let storyboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        self.vc = storyboard.instantiateViewControllerWithIdentifier("TestVC") as ViewController
        self.vc.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_1_ConstraintsDefaultMethod() {
        self.vc.useMathMethod = false
        self.vc.viewDidLoad()
        XCTAssert(self.vc.isViewLoaded())
        NSLayoutConstraint.deactivateConstraints(self.vc.view.constraints())
        XCTAssert(self.vc.view.constraints().count == 0)
        self.constraintsDefaultMethod = self.vc.view.constraints()
        self.vc.viewDidLoad()
        XCTAssert(self.vc.view.constraints().count == 6)
    }

    func test_2_ConstraintsMathMethod() {
        self.vc.useMathMethod = true
        self.vc.viewDidLoad()
        XCTAssert(self.vc.isViewLoaded())
        NSLayoutConstraint.deactivateConstraints(self.vc.view.constraints())
        XCTAssert(self.vc.view.constraints().count == 0)
        self.constraintsMathMethod = self.vc.view.constraints()
        self.vc.viewDidLoad()
        XCTAssert(self.vc.view.constraints().count == 6)
    }
}
