//
//  KontakTableViewController.swift
//  KontakiOSAlamofire
//
//  Created by Jun  on 11/13/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit
//import liblary
import Alamofire
import SwiftyJSON


class KontakTableViewController: UITableViewController {
    var nameSelected:String?
    var emailSelected:String?
    var genderSelected:String?
    var idSelected:String?
    
    var kontak = [Kontak]()
    var arrRes = [[String: AnyObject]]()//array dictionary
    override func viewDidLoad() {
        super.viewDidLoad()

       //memanggil data json menggunakan alamofire
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrRes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKontak", for: indexPath) as! KontakTableViewCell

        // Configure the cell...
        var dict = arrRes[indexPath.row]
        cell.labelNama.text = dict["name"] as? String
        cell.labelEmail.text = dict["email"] as? String

        return cell
}

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    //mengecek data yang dikirim
    print("Row \(indexPath.row)selected")
    
    let task = arrRes[indexPath.row]
    //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        emailSelected = task["email"] as! String
    nameSelected = task["name"] as! String
    idSelected = task["id"] as! String
    genderSelected = task["gender"] as! String
    
    
    
    
    
    //memamnggil segue passDataDetail
    performSegue(withIdentifier: "segue", sender: self)
}
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //mengecek apakah segue nya ada atau  tidak`
    if segue.identifier == "segue"{
        //kondisi ketika segue nya ada
        //mengirimkan data ke detailViewController
//        let kirimData = segue.destination as! KontakViewController
        //mengirimkan data ke masing2 variable
        //mengirimkan nama wisata
        
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! KontakViewController
                let value = arrRes[indexPath.row]
                controller.passname = value["name"] as? String
                controller.passemail = value["email"] as! String
                controller.passid = value["id"] as? String
                controller.passgender = value["gender"] as! String
            }
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}
