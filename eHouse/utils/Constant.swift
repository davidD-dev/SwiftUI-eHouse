//
//  Constant.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import Foundation

struct K {
    
    // Flags
    struct UserFlags {
        // The user is logged in
        static let LOGGED_IN = "loggedIn"
        
        // The user has already seen the onboarding screen
        static let ONBOARDED = "onboarded"
        
        static let CURRENT_USER = "currentUser"
    }



    // Onboarding view images
    struct OnbImages {
        static let findPlace = "onb_find_place"
        static let like = "onb_like"
        static let match = "onb_match"
    }
    
    // Cities Images
    struct CitiesImages {
        static let boston = "img_boston"
        static let london = "img_london"
        static let newYork = "img_newyork"
        static let paris = "img_paris"
    }
    
    // Icons
    struct IconNames {
        static let clean = "ic_clean"
        static let entirePlace = "ic_entire_place"
        static let favorites = "ic_favorites"
        static let guest = "ic_guest"
        static let help = "ic_help"
        static let invite = "ic_invite"
        static let pet = "ic_pet"
        static let room = "ic_room"
        static let roommate = "ic_roommate"
        static let signUpCompletLine = "ic_signup_complete_line"
        static let smoke = "ic_smoke"
        static let success = "ic_success"
        static let tenant = "ic_tenant"
    }
    
    // Animations
    struct AnimationsNames {
        static let loadingHouse = "loading-house"
        static let error = "error"
    }
    
    // Firebase collections
    struct FirebaseCollections {
        static let USER_COLLECTION = "users"
        static let ROOM_COLLECTION = "rooms"
    }
    
    struct RoomatesAvatar {
        static let susie = "susie"
        static let sasha = "sasha"
        static let nyle = "nyle"
        static let max = "max"
        static let baseAvatar = "susie"
    }
    
    
    
    
}
