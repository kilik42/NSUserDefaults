//
//  Person.swift
//  newUserDefaults
//
//  Created by marvin evins on 4/24/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import Foundation


class Person: NSObject, NSCoding {
    
    var firstName: String!
    var lastName: String!
    
   
    init (first: String, last:String){
        firstName = first
        lastName = last 
    }
    
    override init(){
        
        
    }
    
    required convenience init? (coder aDecoder:NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        
    }
    
}