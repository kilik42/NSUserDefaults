//
//  ViewController.swift
//  newUserDefaults
//
//  Created by marvin evins on 4/24/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var favEditor: UILabel!
    
    
    var people = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String
        {
           favEditor.text = "Favorite Color: \(color)"
        } else{
            favEditor.text = "Pick a color!"
        }
        
        
        let personA = Person(first: "Wing", last: "chun")
        let personB = Person(first: "gaga", last: "lady")
        let personC = Person(first: "justin", last: "timberlake")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "peoople")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func red(sender: AnyObject) {
        favEditor.text = "Favorite Color: Red"
        NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    @IBAction func yellow(sender: AnyObject) {
        
        favEditor.text = "Favorite Color: Yellow"
         NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "color")
         NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    @IBAction func blue(sender: AnyObject) {
        
        favEditor.text = "Favorite Color: Blue"
         NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
         NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData{
            
            
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                
                for person in peopleArray {
                    print (person.firstName)
                }
            }
        }

    }
    
}

