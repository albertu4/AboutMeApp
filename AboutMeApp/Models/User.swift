//
//  User.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getPersonInfo() -> User {
        User(
            login: "User",
            password: "123",
            person: Person(
                name: "Peter",
                surname: "Parker",
                userStatus: "Remember, with great power comes great responsibility",
                dateOfBirth: "10.08.2001",
                relationShip: "In relationship",
                currentLocation: "New - York",
                education: "Empire State University",
                job: "Daily Bugle",
                photo: "peterParker",
                picture: "spiderManLogo"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let userStatus: String
    let dateOfBirth: String
    let relationShip: String
    let currentLocation: String
    let education: String
    let job: String
    let photo: String
    let picture: String
}
