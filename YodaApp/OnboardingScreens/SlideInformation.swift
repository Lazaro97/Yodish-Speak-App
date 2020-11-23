//
//  SlideInformation.swift
//  YodaApp
//
//  Created by Lazaro Ambrosio on 11/22/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import Foundation

struct Slide {
    let imageName: String
    let title: String
    let description: String

    static let collection: [Slide] = [
     Slide(imageName: "HappyYoda", title: "Welcome to YodishTranslator", description: "Convert from English to Yoda speak. Yoda is a fictional character from the Movie star wars."),
     Slide(imageName: "MedidateYoda", title: "YodishTranslator Purpose ", description: "YodishTranslator rearranges sentences into an Object Subject Verb structure. Just type in normal sentences in English and Yodish translator will rearrange it in OSV structure and send it back to you!"),
     Slide(imageName: "ShyYoda", title: "YodishTranslator API", description: "Yoda translation API is public. To maintain our service level we ratelimit the number of API calls. For public API calls this is 60 API calls a day with distribution of 5 calls an hour.")
    ]
}
