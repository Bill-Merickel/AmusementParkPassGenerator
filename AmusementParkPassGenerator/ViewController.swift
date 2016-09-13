//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Bill Merickel on 9/6/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Here are some demo entrants
    let employee = HourlyEmployee(employeeType: .FoodServices, firstName: "Bill", lastName: "Merickel", streetAddress: "1234 Random Avenue", city: "Random City", state: "CA", zipCode: "92506")
    let guest = Guest(guestType: .FreeChild, DOB: DateOfBirth(day: 12, month: 9, year: 2002))
    let anotherGuest = Guest(guestType: .VIP, DOB: nil)
    // let finalGuest = Guest(guestType: .FreeChild, DOB: nil)
    let manager = Manager(information: Information(firstName: "Bill", lastName: "Merickel", DOB: nil, streetAddress: "9999 Random Dr.", city: "LA", state: "CA", zipCode: "92506"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Some methods below are commented out, but uncomment them to try the scanner with different entrants.
        // swipeForRides(finalGuest)
        // swipeForAreas(employee)
        swipeForRides(guest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // There are different swipe methods for different park assets
    func swipeForRides(entrant: Entrant) {
        if entrant.accessGranted == true {
            playGrantedSound(grantedSoundURL)
            if entrant.rideAccess.skipAllRides {
                print("Access GRANTED: allowed to skip rides")
            } else {
                print("Access GRANTED")
            }
        } else {
            playDeniedSound(deniedSoundURL)
            print("Access DENIED")
        }
        
        Guest.checkForBirthday(entrant)
    }
    
    func swipeForAreas(entrant: Entrant) {
        if entrant.accessGranted {
            playGrantedSound(grantedSoundURL)
            if entrant.areaAccess.kitchenAreas {
                print("Kitchen: GRANTED")
            }
            if entrant.areaAccess.rideControlAreas {
                print("Ride Control: GRANTED")
            }
            if entrant.areaAccess.maintainanceAreas {
                print("Maintainence Areas: GRANTED")
            }
            if entrant.areaAccess.amusementAreas {
                print("Amusement Areas: GRANTED")
            }
            if entrant.areaAccess.officeAreas {
                print("Office Areas: GRANTED")
            }
        } else {
            playDeniedSound(deniedSoundURL)
            print("Access: DENIED")
        }
        
        Guest.checkForBirthday(entrant)
    }
    
    func swipeForDiscounts(entrant: Entrant) {
        if let discount = entrant.discountAccess {
            playGrantedSound(grantedSoundURL)
            print("\(discount.foodDiscount) discount on food, \(discount.merchandiseDiscount) discount on merchandise.")
        } else {
            playDeniedSound(deniedSoundURL)
            print("Sorry, no discounts.")
        }
        
        Guest.checkForBirthday(entrant)
    }


}

