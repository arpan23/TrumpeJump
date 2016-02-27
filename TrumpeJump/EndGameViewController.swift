//
//  EndGameViewController.swift
//  TrumpeJump
//
//  Created by Robin Onsay on 2/27/16.
//  Copyright © 2016 trumpejump. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController, NSXMLParserDelegate {
    var strXMLData:[String] = []
    var linkXMLData:[NSURL] = []
    var xmlDict = [String:NSURL]()
    var currentElement:String = ""
    var passData:Bool=false
    var passName:Bool=false
    var parser = NSXMLParser()
    
    @IBOutlet weak var newsBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url:String="http://feeds.washingtonpost.com/rss/rss_election-2012"
        let urlToSend: NSURL = NSURL(string: url)!
        // Parse the XML
        parser = NSXMLParser(contentsOfURL: urlToSend)!
        parser.delegate = self
        
        let success:Bool = parser.parse()
        
        if success {
            print("parse success!")
            
            print(strXMLData)
            print(linkXMLData)
            
            var str = strXMLData[10]
            newsBtn.setTitle(str, forState: UIControlState.Normal)
//            lblNameData.text=strXMLData
            
        } else {
            print("parse failure!")
        }
        // Do any additional setup after loading the view.
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
    @IBAction func goBackHome(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateInitialViewController()!
        
        self.presentViewController(controller, animated: true, completion: nil)

    }
    
    //MARK: - Delegate funcs
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement=elementName;
        if(elementName=="item" || elementName=="title" || elementName=="link")
        {
//            if(elementName=="title"){
//                passName=true;
//            }
//            passData=true;
            passName = elementName=="title"
            passData = elementName=="link"
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement="";
        if(elementName=="item" || elementName=="title" || elementName=="link")
        {
            if(elementName=="title"){
                passName=false;
            }
            passData=false;
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if(passName){
            strXMLData.append(string)
        }
        
        if(passData)
        {
            linkXMLData.append(NSURL(string: string)!)
//            print(string)
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        NSLog("failure error: %@", parseError)
    }

}
