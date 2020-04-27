//
//  Networking.swift
//  FlyMeToTheMoon
//
//  Created by Omar Alibrahim on 4/11/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

class Networking
{
    
    static func createItem<T:Codable>(_ item: T, inCollection COLLECTION_NAME: String, success: @escaping()-> Void)
    {
        let encoded = try! FirestoreEncoder().encode(item)
        Firestore
            .firestore()
            .collection(COLLECTION_NAME)
            .document()
            .setData(encoded) { (error) in
                if error == nil{
                    // ✅
                    print("Added ")
                    DispatchQueue.main.async {
                        success()
                    }
                }
                else{
                    // ❌
                    print("Error encountered", error)
                }
        }
    }
    
    
    
    static func getListOf<T: Codable>(COLLECTION_NAME: String, success: @escaping([T])-> Void)
    {
        Firestore.firestore().collection(COLLECTION_NAME).getDocuments { (snapshot, error) in
            if error == nil{
                // there is no error
                if snapshot != nil {
                    // There is data
                    let items = try! FirebaseDecoder().decode([T].self, from: snapshot?.documents.map{$0.data() as Any})
                    DispatchQueue.main.async {
                        success(items)
                    }
                }
            }
        }
    }
    
   
}
