//
//  EntrantEnumsAndErrors.swift
//  AmusementParkPassGenerator
//
//  Created by Bill Merickel on 9/18/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation

// Entrant enums

enum GuestType {
    case Classic
    case VIP
    case FreeChild
}

enum HourlyEmployeeType {
    case FoodServices
    case RideServices
    case Maintainence
}

// Errors
enum Errors: ErrorType {
    case MissingDOB
}