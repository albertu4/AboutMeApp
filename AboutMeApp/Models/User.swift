//
//  User.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getPersonInfo() -> User {
        User(
            login: "User",
            password: "123",
            person: Person(
                name: "Mikhail",
                surname: "Ivanov",
                dateOfBirth: "27.01.1992",
                currentLocation: "Yakutsk",
                education: "MSTUCA",
                job: "ATC",
                hobbies: ["Running", "Playing the guitar", "Traveling"],
                pictures: [
                    UIImage(named: "winter")!,
                    UIImage(named: "nature")!,
                    UIImage(named: "foods")!
                ]
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let dateOfBirth: String
    let currentLocation: String
    let education: String
    let job: String
    let hobbies: [String]
    let pictures: [UIImage]
}
