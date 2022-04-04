//
//  OCP.swift
//  OCP
//
//  Created by Jeytery on 04.04.2022.
//

// Bad OCP example

enum _SOLID {
    case srp
    case ocp
    case lp
    case ps // 'is' is keyword in swift
    case di
    
    var fullName: String {
        switch self {
        case .srp:
            return "single responsobility"
        case .ocp:
            return "open/close"
        case .lp:
            return "liscov"
        case .ps:
            return "protocol segrigation"
        case .di:
            return "dependency injection"
        }
    }
    
    var someVariable1: String {
        switch self {
        case .srp:
            return "1"
        case .ocp:
            return "2"
        case .lp:
            return "3"
        case .ps:
            return "4"
        case .di:
            return "5"
        }
    }
    
    var someVariable2: String {
        switch self {
        case .srp:
            return "__1"
        case .ocp:
            return "__2"
        case .lp:
            return "__3"
        case .ps:
            return "__4"
        case .di:
            return "__5"
        }
    }
}

// from some point this is ok
// but let's imagine that we want to add some new case like 'some unusual clever koncept'' or 'suck'
// this move will break all the code we have here, because we need to add new switch cases

// first thing first we can add default to switches. Yeah, this is like one of ways to solve our OCP problem

// but here i have much more intersting method to create enums in OCP way

struct SOLID {
    let fullName: String
    let someVariable1: String
    let someVaridlbe2: String
    
    static let srp = SOLID(fullName: "single responsobility", someVariable1: "1", someVaridlbe2: "__1")
    static let ocp = SOLID(fullName: "open/close", someVariable1: "2", someVaridlbe2: "__2")
    static let lp  = SOLID(fullName: "liscov", someVariable1: "3", someVaridlbe2: "__3")
    static let ps  = SOLID(fullName: "protocol sengrigartion", someVariable1: "4", someVaridlbe2: "__4")
    static let di  = SOLID(fullName: "dependency injection", someVariable1: "5", someVaridlbe2: "__5")
    
    // we can add new variable without any problems
    static let suck  = SOLID(fullName: "some unusual clever koncept", someVariable1: "6", someVaridlbe2: "__6")
}

// in swift access static variables of class/struct can be reached by '.' without class/struct name
// so we can use this struct likewise enum even in systax part

let solidPrinciple: SOLID = .ocp
