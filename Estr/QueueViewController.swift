//
//  QueueViewController.swift
//  Estr
//
//  Created by auston salvana on 2015-11-07.
//  Copyright © 2015 ARJHack. All rights reserved.
//

import UIKit

class QueueViewController: UIViewController {

    @IBOutlet weak var queueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let session = NSURLSession.sharedSession()
        let urlString = "http://192.75.243.32:3000/fish"
        let url = NSURL(string: urlString)
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            do {
                if let myData = data, let jsonResult = try NSJSONSerialization.JSONObjectWithData(myData, options: []) as? NSDictionary {
                    print(jsonResult)
                }
            } catch {
                print(error)
            }
        })
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
