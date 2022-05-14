//
//  ContentProvider.swift
//  TopShelf
//
//  Created by Vitor Gledison Oliveira de Souza on 13/05/22.
//

import TVServices

class ContentProvider: TVTopShelfContentProvider {

    override func loadTopShelfContent(completionHandler: @escaping (TVTopShelfContent?) -> Void) {
        let itemOne = TVTopShelfCarouselItem(identifier: "itemOne")
        itemOne.setImageURL(Bundle.main.url(forResource: "sectionedMartians", withExtension: "png"), for: .screenScale1x)
        itemOne.duration = 5.0
        itemOne.contextTitle = "Featured Movie"
        itemOne.summary = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        itemOne.namedAttributes = [
            TVTopShelfNamedAttribute(name: "BUILD", values: ["prod", "dev"]),
            TVTopShelfNamedAttribute(name: "VERSION", values: ["1.0.0", "1.0.1"]),
        ]
        itemOne.playAction = URL(string: "tvOSDemo://movie/itemOne/play").map { TVTopShelfAction(url: $0) }
        itemOne.displayAction = URL(string: "tvOSDemo://movie/itemOne").map { TVTopShelfAction(url: $0) }
        itemOne.genre = "tecnologia"
        
        let itemTwo = TVTopShelfCarouselItem(identifier: "itemTwo")
        itemTwo.setImageURL(Bundle.main.url(forResource: "comet", withExtension: "png"), for: .screenScale1x)
        itemTwo.duration = 5.0
        itemTwo.summary = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        itemTwo.namedAttributes = [
            TVTopShelfNamedAttribute(name: "BUILD", values: ["prod", "dev"]),
            TVTopShelfNamedAttribute(name: "VERSION", values: ["1.0.0", "1.0.1"]),
        ]
        itemTwo.playAction = URL(string: "tvOSDemo://movie/itemTwo/play").map { TVTopShelfAction(url: $0) }
        itemTwo.displayAction = URL(string: "tvOSDemo://movie/itemTwo").map { TVTopShelfAction(url: $0) }
        itemTwo.genre = "tecnologia"
                
        let content = TVTopShelfCarouselContent(style: .details, items: [itemOne, itemTwo])
        completionHandler(content);
    }

}

