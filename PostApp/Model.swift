//
//  Model.swift
//  PostApp
//
//  Created by Valentin on 25.05.2021.
//

import UIKit

struct Response: Decodable {
    let data: ResponseData?
}

struct ResponseData: Decodable {
   let items: [Item]?
   let cursor: String?
}

struct Item: Decodable {
    let id: String
    let isCreatedByPage: Bool?
    let status: String
    let type: String
    let isCommentable: Bool
    let author: Author?
    let contents: [Content]?
}

struct Content: Decodable {
    let data: ContentData?
    let type: String?
}

struct ContentData: Decodable {
    let value: String?
    let extraLarge, original: ExtraLarge?
    let duration: Double?
    let url: String?
}

enum ContentType: String, Decodable {
    case video = "VIDEO"
    case text = "TEXT"
    case audio = "AUDIO"
    case tags = "TAGS"
    case image = "IMAGE"
    case imageGif = "IMAGE-GIF"
}

struct ExtraLarge: Decodable {
    let url: String
}

struct PreviewImageData: Decodable {
    let extraSmall, medium: ExtraSmall
}

struct ExtraSmall: Decodable {
    let url: String
}



struct Author: Decodable {
    let name: String
    let photo: Photo?
    let gender: String
}

struct Photo: Decodable {
    let id: String?
    let data: PhotoOriginal
}

struct PhotoOriginal: Decodable {
    let original: LinkJpg
}

struct LinkJpg: Decodable {
    let url: String
}
