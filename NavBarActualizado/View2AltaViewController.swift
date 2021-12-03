//
//  View2AltaViewController.swift
//  NavBarActualizado
//
//  Created by Angel  Blanco on 26/11/21.
//

import UIKit

class View2AltaViewController: UIViewController {

    @IBOutlet weak var txt_NombreUser: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_SubName: UITextField!
    @IBOutlet weak var txt_RealName: UITextField!
    
    let ud = UserDefaults.standard
    
    var arrayUsers = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crear Usuarios"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addUser") {
            let viewListado = segue.destination as! View3AltaViewController
            
            
            viewListado.username = txt_NombreUser.text!
            viewListado.subname = txt_SubName.text!
            viewListado.realName = txt_RealName.text!
            viewListado.email = txt_email.text!
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
