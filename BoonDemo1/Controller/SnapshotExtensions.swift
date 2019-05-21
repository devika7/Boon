//
//  SnapshotExtensions.swift
//  BoonDemo1
//
//  Created by Boon Invest on 5/5/19.
//  Copyright © 2019 Shreya Navelkar. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension QueryDocumentSnapshot{
    func decoded<T: Decodable>(as objectType: T.Type) throws -> T{
        let documentJson = data()
        let documentData = try JSONSerialization.data(withJSONObject: documentJson, options: [])
        let decodedObject = try JSONDecoder().decode(objectType, from: documentData)
        return decodedObject
    }
}
