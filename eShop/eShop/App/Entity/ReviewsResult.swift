//
//  ReviewsResult.swift
//  eShop
//
//  Created by Maksim Romanov on 01.08.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation

struct GetReviewsResult: Codable {
    let result: Int
    let reviews: [Review]
}
/*
 {
 "result": 1,
 "reviews": [
             {
               "user_name": "Вася",
               "review": "Отличный товар!"
             },
             {
               "user_name": "Коля",
               "review": "Некачественный товар"
             }
           ]
 }
*/

struct AddReviewResult: Codable {
    let result: Int
    let userMessage: String
}

/*
 {
   "result": 1,
   "userMessage": "Ваш отзыв был передан на модерацию"
 }
 */

struct RemoveReviewResult: Codable {
    let result: Int
}

/*
 {
   "result": 1,
 }
 */
