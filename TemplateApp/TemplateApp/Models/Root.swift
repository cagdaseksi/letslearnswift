//
//  Entity.swift
//  TemplateApp
//
//  Created by MAC on 17.10.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

class Root {
    
    var topCategory = [Entity]()
    var category = [Entity]()
    var subCategory = [EntitySubCategory]()
    var language = [Language]()
    var question = [Question]()
    var setting = UserHandle(Volume : 0.4, IsWrite: true)
    var myDictionary: [Int: [Int]] = [Int: [Int]]() // [:]
    var myInt = [Int]()
    var dashboardEntity = [EntityDasboard]()
    
}

// question id tutarak user.defaultsda her ünitenın yüzde kaçı yapıldığı yazsın. bitirilenlerin 100%/100 olanların yanında kupa olsun. tableviewda hiç olmayanlarda ikon olsun mesela başla iconu gibi burası opsiyıonel.

struct UserHandle: Codable {
    var Volume: Double
    var IsWrite: Bool // text 0r write segment control
    init(Volume: Double, IsWrite:Bool) {
        self.Volume = Volume
        self.IsWrite = IsWrite
    }
    
}

class EntityDasboard {
    var title: String
    var id: Int
    var value: Int
    var valuetotal: Int
    var key: String
    var shortDescription: String
    var icon: String
    //init(name: String, category: EntityType, image: String, id: Int) {
    init(title: String, id: Int, value: Int,valuetotal: Int,key: String,shortDescription: String, icon: String) {
        self.title = title
        self.id = id
        self.value = value
        self.valuetotal = valuetotal
        self.key = key
        self.shortDescription = shortDescription
        self.icon = icon
    }
}


class EntitySubCategory {
    var name: String
    var id: Int
    var count: Int
    var description: String
    var shortDescription: String
    var url: String
    var icon: Data?
    //init(name: String, category: EntityType, image: String, id: Int) {
    init(name: String, id: Int, count: Int,shortDescription: String, description: String, url: String, icon: Data?) {
        self.name = name
        //self.category = category
        //self.image = image
        self.id = id
        self.count = count
        self.shortDescription = shortDescription
        self.description = description
        self.url = url
        self.icon = icon
    }
}

class Entity {
    var name: String
    var id: Int
    var description: String
    var shortDescription: String
    var url: String
    var icon: Data?
    //init(name: String, category: EntityType, image: String, id: Int) {
    init(name: String, id: Int, shortDescription: String, description: String, url: String, icon: Data?) {
        self.name = name
        //self.category = category
        //self.image = image
        self.id = id
        self.shortDescription = shortDescription
        self.description = description
        self.url = url
        self.icon = icon
    }
}

class Main {
    var topCategoryId: Int = Int()
    var categoryId: Int = Int()
    var subCategoryId: Int = Int()
    var FromId: Int = Int()
    var ToId: Int = Int()
    var LanguageId: Int = Int()
}

class Language {
    
    var id: Int
    var FromId: Int
    var ToId: Int
    var FromTitle: String
    var ToTitle: String
    var FromFlag: String
    var ToFlag: String
    
    init(id: Int, FromId: Int, ToId: Int,FromTitle: String, ToTitle: String, FromFlag: String, ToFlag: String) {
        self.id = id
        self.FromId = FromId
        self.ToId = ToId
        self.FromFlag = FromFlag
        self.ToFlag = ToFlag
        self.FromTitle = FromTitle
        self.ToTitle = ToTitle
    }
}

class Question {
    
    var SubCategoryId: Int
    var QuestionId: Int
    var FromQuestionDetailId: Int
    var ToQuestionDetailId: Int
    var FromTitle: String
    var ToTitle: String
    var FromVoice: String
    var ToVoice: String
    var FromLanguageId: Int
    var FromLanguageTitle: String
    var ToLanguageId: Int
    var ToLanguageTitle: String
    var FromTitleAnswerShortYour: String // kısa cevap
    var FromTitleAnswerShortCorrect: String //correct
    var Status: Bool // doğru yanlış cvp
    var FromLanguageCode: String
    var ToLanguageCode: String
    var FromTitleAnswerYour: String // verilen cevap
    
    init(SubCategoryId: Int, QuestionId: Int, FromQuestionDetailId: Int,ToQuestionDetailId: Int, FromTitle: String, ToTitle: String, FromVoice: String, ToVoice: String, FromLanguageId: Int, FromLanguageTitle: String, ToLanguageId: Int, ToLanguageTitle: String, FromTitleAnswerShortYour: String, FromTitleAnswerShortCorrect: String, Status: Bool, FromLanguageCode: String, ToLanguageCode: String, FromTitleAnswerYour: String) {
        self.SubCategoryId = SubCategoryId
        self.QuestionId = QuestionId
        self.FromQuestionDetailId = FromQuestionDetailId
        self.ToQuestionDetailId = ToQuestionDetailId
        self.FromTitle = FromTitle
        self.ToTitle = ToTitle
        self.FromVoice = FromVoice
        self.ToVoice = ToVoice
        self.FromLanguageId = FromLanguageId
        self.FromLanguageTitle = FromLanguageTitle
        self.ToLanguageId = ToLanguageId
        self.ToLanguageTitle = ToLanguageTitle
        self.FromTitleAnswerShortYour = FromTitleAnswerShortYour
        self.FromTitleAnswerShortCorrect = FromTitleAnswerShortCorrect
        self.Status = Status
        self.FromLanguageCode = FromLanguageCode
        self.ToLanguageCode = ToLanguageCode
        self.FromTitleAnswerYour = FromTitleAnswerYour
    }
}
