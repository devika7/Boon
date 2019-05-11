//
//  QueryDocumentSnapshot.swift
//  BoonDemo1
//
//  Created by Boon Invest on 5/5/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import Foundation
import  FirebaseFirestore

class QueryDocumentSnapshot {
    func decoded<Type: Decodable>() -> Type{
        let jsonData = try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = JSONDecoder.decode(Type.self, from: jsonData)
        return object
    }
}
