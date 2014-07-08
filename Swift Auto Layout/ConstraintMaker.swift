//
//  ConstraintMaker.swift
//  Swift Auto Layout
//
//  Created by Daniel Zhang (張道博) on 7/7/14.
//  Copyright (c) 2014 Daniel Zhang (張道博). All rights reserv2ed.
//

import Foundation
import UIKit

operator infix + { precedence 150 }

@infix func + (tuple:(UIView, NSLayoutAttribute),
    c:CGFloat) -> (UIView, NSLayoutAttribute, CGFloat) {
        return (tuple.0, tuple.1, c)
}

operator infix => {}

@infix func => (lhs:(UIView, NSLayoutAttribute),
    rhs:(UIView, NSLayoutAttribute, CGFloat)) {
        rhs.0.addConstraint(NSLayoutConstraint(
            item:lhs.0,
            attribute:lhs.1,
            relatedBy:.Equal,
            toItem:rhs.0,
            attribute:rhs.1,
            multiplier:1,
            constant:rhs.2 ))
}

func centerX (v:UIView) -> (UIView, NSLayoutAttribute) { return (v, .CenterX) }
func centerY (v:UIView) -> (UIView, NSLayoutAttribute) { return (v, .CenterY) }
func top (v:UIView) -> (UIView, NSLayoutAttribute) { return (v, .Top) }
func bottom (v:UIView) -> (UIView, NSLayoutAttribute) { return (v, .Bottom) }

