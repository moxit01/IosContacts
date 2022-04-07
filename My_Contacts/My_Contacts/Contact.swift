//
//  Contact.swift
//  My_Contacts
//
//  Created by Moxit Shah on 04/04/22.
//

import Foundation

class Contact{
    var name: String = ""
    var lastName: String = ""
    var number: String = "9999999999"
    //var photo: String
    
    init(name: String){
        self.name=name
    }
    
    init(name: String, lastName: String, number: String){
        self.name=name
        self.lastName=lastName
        self.number=number
    }
    
    convenience init(random: Bool){
        if random{
            
        
            let randomName = [
        "Moxit",
        "Harsh",
        "Mehul",
        "Meet",
        "Mihir",
        "Parth",
        "Tithi",
        "Palna",
        "Devansh",
        "Jay",
        "Elon"
        ]
        
            let randomLastName = [
            "Shah",
            "Tuwar",
            "Desai",
            "Patel",
            "Panchal",
            "Musk",
            "Mehta",
            "Bodiwala",
            "Ajmera",
            "Vora",
            "Rami"
        ]
            
            let randomNum = [
            "1234567890",
            "2345678901",
            "3456789012",
            "4567890123",
            "5678901234",
            "6789012345",
            "7890123456",
            "8901234567",
            "9012345678",
            "0123456789",
            "9293847289"
        ]
        
            self.init(name: randomName.randomElement()!, lastName: randomLastName.randomElement()!, number: randomNum.randomElement()!)
        }else{
            self.init(name: "nil")
        }
    }
}
