//
//  DetailViewController.swift
//  DITMap
//
//  Created by D7703_11 on 2017. 9. 14..
//  Copyright © 2017년 LeeHyeonHo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleName: String = ""
    
    @IBOutlet weak var imageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch titleName {
        case "DIT 동의과학대학교":
            imageview.image = UIImage(named: "unnamed.png")
            print("DIt")
        case "부산시민공원":
            imageview.image = UIImage(named: "aa.jpeg")
            print("시민공원")
        default:
            print("default : \(titleName)")
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
