//
//  KontakViewController.swift
//  KontakiOSAlamofire
//
//  Created by Jun  on 11/13/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class KontakViewController: UIViewController {

    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblgender: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblid: UILabel!
   
    var passname:String?
    var passemail:String?
    var  passgender:String?
    var passid:String?
    
    override func viewDidLoad() {
        lblid.text = passid!
        lblname.text = passname!
        lblemail.text = passemail!
        lblgender.text = passgender!
        super.viewDidLoad()

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
