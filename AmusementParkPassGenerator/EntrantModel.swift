//
//  EntrantModel.swift
//  AmusementParkPassGenerator
//
//  Created by Bill Merickel on 9/6/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation

// Protocols

protocol Entrant {
    var areaAccess: AreaAccess { get }
    var rideAccess: RideAccess { get }
    var discountAccess: DiscountAccess? { get }
    var information: Information? { get }
    var accessGranted: Bool { get }
}

// Classes

class Guest: Entrant {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess?
    var information: Information?
    var guestType: GuestType
    var accessGranted: Bool = true

    required init(guestType: GuestType, DOB: DateOfBirth?) {
        self.guestType = guestType
            switch guestType {
            case .VIP: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: true); self.discountAccess = DiscountAccess(foodDiscount: 10, merchandiseDiscount: 20); self.information = nil
            case .Classic: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = nil; self.information = nil
            case .FreeChild: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = nil; self.information = Information(firstName: nil, lastName: nil, DOB: DOB as DateOfBirth!, streetAddress: nil, city: nil, state: nil, zipCode: nil)
            do {
                try checkForDate(self)
            } catch Errors.MissingDOB {
                print("Missing Date Of Birth!")
                self.accessGranted = false
                break
            } catch _ {
                fatalError("Something unknown went wrong. Sorry!")
            }
            
        }
    }
    
    // Class function that checks if it's your birthday
    class func checkForBirthday(guest: Entrant) {
        if let dateOfBirth = guest.information?.DOB {
            if dateOfBirth.day == day && dateOfBirth.month == month {
                print("Happy Birthday!! I hope you have an absolutely fantastic day at the park!")
            }
        }
    }
}

class HourlyEmployee: Entrant {
    var areaAccess: AreaAccess
    var rideAccess: RideAccess
    var discountAccess: DiscountAccess?
    var information: Information?
    var employeeType: HourlyEmployeeType
    var accessGranted: Bool = true
    
    required init(employeeType: HourlyEmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) {
        self.employeeType = employeeType
        switch employeeType {
        case .FoodServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: false, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = Information(firstName: "Bill", lastName: "Merickel", DOB: nil, streetAddress: "1111", city: "LA", state: "CA", zipCode: "92506")
        case .RideServices: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = Information(firstName: "Bill", lastName: "Merickel", DOB: nil, streetAddress: "1111", city: "LA", state: "CA", zipCode: "92506")
        case .Maintainence: self.areaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: false, maintainanceAreas: true, officeAreas: false); self.rideAccess = RideAccess(skipAllRides: false); self.discountAccess = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25); self.information = Information(firstName: firstName, lastName: lastName, DOB: nil, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        }
    }
}

class Manager: Entrant {
    var areaAccess: AreaAccess = AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintainanceAreas: true, officeAreas: true)
    var rideAccess: RideAccess = RideAccess(skipAllRides: true)
    var discountAccess: DiscountAccess? = DiscountAccess(foodDiscount: 15, merchandiseDiscount: 25)
    var information: Information?
    var accessGranted: Bool = true
    
    required init(information: Information) {
        self.information = information
    }
}
