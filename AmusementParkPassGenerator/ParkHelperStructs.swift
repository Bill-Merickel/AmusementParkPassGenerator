//
//  ParkHelperStructs.swift
//  AmusementParkPassGenerator
//
//  Created by Bill Merickel on 9/18/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation

// Helper structs

struct AreaAccess {
    var amusementAreas: Bool
    var kitchenAreas: Bool
    var rideControlAreas: Bool
    var maintainanceAreas: Bool
    var officeAreas: Bool
}

struct RideAccess {
    let accessAllRides: Bool = true
    var skipAllRides: Bool
}

struct DiscountAccess {
    var foodDiscount: Int?
    var merchandiseDiscount: Int?
}

struct Information {
    var firstName: String?
    var lastName: String?
    var DOB: DateOfBirth?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    
    init(firstName: String?, lastName: String?, DOB: DateOfBirth?, streetAddress: String?, city: String?, state: String?, zipCode: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.DOB = DOB
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

// Checks the DOB property and throws and an error if missing

func checkForDate(guest: Guest) throws {
    if guest.information?.DOB == nil {
        throw Errors.MissingDOB
    }
}

// Date Information

struct DateOfBirth {
    let day: Int
    let month: Int
    let year: Int
}

let date = NSDate()
let calendar = NSCalendar.currentCalendar()
let components = calendar.components([.Day , .Month], fromDate: date)

let month = components.month
let day = components.day

