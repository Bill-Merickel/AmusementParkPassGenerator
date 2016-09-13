//
//  SoundModel.swift
//  AmusementParkPassGenerator
//
//  Created by Bill Merickel on 9/11/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import AudioToolbox

// Here are the two sounds for the swiper
var grantedSound: SystemSoundID = 0
var deniedSound: SystemSoundID = 1

// Paths to sound files
var grantedSoundURL: NSURL {
    let pathToGrantedSound = NSBundle.mainBundle().pathForResource("AccessGranted", ofType: "wav")!
    return NSURL(fileURLWithPath: pathToGrantedSound)
}
var deniedSoundURL: NSURL {
    let pathToDeniedSound = NSBundle.mainBundle().pathForResource("AccessDenied", ofType: "wav")!
    return NSURL(fileURLWithPath: pathToDeniedSound)
}

// And functions to play those sounds
func playGrantedSound(url: NSURL) {
    AudioServicesCreateSystemSoundID(url, &grantedSound)
    AudioServicesPlaySystemSound(grantedSound)
}

func playDeniedSound(url: NSURL) {
    AudioServicesCreateSystemSoundID(url, &deniedSound)
    AudioServicesPlaySystemSound(deniedSound)
}