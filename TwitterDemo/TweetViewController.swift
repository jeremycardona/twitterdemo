//
//  TweetViewController.swift
//  TwitterDemo
//
//  Created by Gabriela A. Renta on 2/22/16.
//  Copyright © 2016 Jeremy Cardona. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    var tweets: [Tweet]!
    override func viewDidLoad() {
        super.viewDidLoad()
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            for tweet in tweets{
                print(tweet.text)
            }
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
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
