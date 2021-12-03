//
//  View3AltaViewController.swift
//  NavBarActualizado
//
//  Created by Angel  Blanco on 26/11/21.
//

import UIKit
import Foundation

class View3AltaViewController: UIViewController {
    
    var realName = ""
    var subname = ""
    var email = ""
    var username = ""
    
   

    @IBOutlet weak var btn_Siguiente: UIButton!
    @IBOutlet weak var btn_Anterior: UIButton!
    @IBOutlet weak var lbl_RealName: UILabel!
    @IBOutlet weak var lbl_Email: UILabel!
    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_SubName: UILabel!
    @IBOutlet weak var infoState: UILabel!
    
    
    // NAME 1
    // SUBNAME 2
    // EMAIL 3
    // USER NAME 4
    var aux: Int!=4

    let arrayUser1: Dictionary<Int, String> = [ 1 : "Pedro", 2: "Herrera", 3: "pedro.herrera@gmail.com", 4 : "Pedro123"];
    let arrayUser2: Dictionary<Int, String> = [1 : "Manuel", 2: "Rodriguez", 3: "manuel.rodriguez@gmail.com", 4: "Manu99"];
    let arrayUser3: Dictionary<Int, String> = [1 : "Antonio", 2: "Carrera", 3: "antonio.carrera@gmail.com", 4 : "Razer222"];
    
    var arrayActualizado: Dictionary <Int, Dictionary<Int, String>> = [:]
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Listado de Usuarios"
        
        lbl_RealName.text = realName
        lbl_SubName.text = subname
        lbl_UserName.text = username
        lbl_Email.text = email
        
       
        
        crearSuperDiccionario();
        
        if aux == arrayActualizado.count{
            btn_Siguiente.isEnabled = false;
        } else {
            btn_Siguiente.isEnabled = true;
        }
        infoState.text = "User \(aux!) of \(arrayActualizado.count)"
    
    }
    
   
    func crearSuperDiccionario() {
        let arrayUser = [1 : realName, 2: subname, 3: email, 4 : username]
        
        arrayActualizado.updateValue(arrayUser1, forKey: 1)
        arrayActualizado.updateValue(arrayUser2, forKey: 2)
        arrayActualizado.updateValue(arrayUser3, forKey: 3)
        arrayActualizado.updateValue(arrayUser, forKey: arrayActualizado.count+1)
    }
    
    

    
    
    @IBAction func verAnterior(_ sender: Any) {
        aux = aux - 1;
        
        if aux > 1 {
            btn_Anterior.isEnabled = true;
            btn_Siguiente.isEnabled = true;
            poneNombre(numberArray: aux);
            poneApellido(numberArray: aux);
            poneEmail(numberArray: aux);
            poneUserName(numberArray: aux);
            infoState.text = "User \(aux!) of \(arrayActualizado.count)"
        }
        if aux <= 1 {
            btn_Anterior.isEnabled = false;
            poneNombre(numberArray: aux);
            poneApellido(numberArray: aux);
            poneEmail(numberArray: aux);
            poneUserName(numberArray: aux);
            infoState.text = "User \(aux!) of \(arrayActualizado.count)"
        }
    }
    
    
    
    @IBAction func verSiguiente(_ sender: Any) {
        aux = aux + 1;
        
        
        if aux < arrayActualizado.count {
            btn_Siguiente.isEnabled = true;
            btn_Anterior.isEnabled = true;
            poneNombre(numberArray: aux);
            poneApellido(numberArray: aux);
            poneEmail(numberArray: aux);
            poneUserName(numberArray: aux);
            infoState.text = "User \(aux!) of \(arrayActualizado.count)"
        }
        if aux == arrayActualizado.count {
            btn_Siguiente.isEnabled = false;
            poneNombre(numberArray: aux);
            poneApellido(numberArray: aux);
            poneEmail(numberArray: aux);
            poneUserName(numberArray: aux);
            infoState.text = "User \(aux!) of \(arrayActualizado.count)"
        }
    }
    
    func poneNombre(numberArray : Int!) {
        let arrayElegido = arrayActualizado[numberArray]
        let nombreAMostrar : String! = arrayElegido![1]
        lbl_RealName.text = nombreAMostrar!
    }
    
    func poneApellido(numberArray : Int) {
        let arrayElegido1: Dictionary<Int, String>!  = arrayActualizado[numberArray]
        let apellidoAMostrar: String! = arrayElegido1[2]
        lbl_SubName.text = apellidoAMostrar
    }
    
    func poneUserName(numberArray : Int) {
        let arrayElegido2: Dictionary<Int, String>!  = arrayActualizado[numberArray]
        let userNameAMostrar: String! = arrayElegido2![4]
        lbl_UserName.text = userNameAMostrar
    }
    func poneEmail(numberArray : Int) {
        let arrayElegido3: Dictionary<Int, String>!  = arrayActualizado[numberArray]
        let emailAMostrar: String! = arrayElegido3[3]
        lbl_Email.text = emailAMostrar
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
