//
//  View2CalculadoraViewController.swift
//  NavBarActualizado
//
//  Created by Angel  Blanco on 1/12/21.
//

import UIKit

class View2CalculadoraViewController: UIViewController {

    
    var calculoOption: String = "";
    
    @IBOutlet weak var valor1: UITextField!
    @IBOutlet weak var valor2: UITextField!
    @IBOutlet weak var quehara: UILabel!
    @IBOutlet weak var txt_result: UILabel!
    
    var result: Int?
    var value1: Int?
    var value2: Int?
    var num1: String?
    var num2: String?
    var res: String?
    
    
    // 1 = VALOR 1
    // 2 = VALOR 2
    // 3 = OPERACION
    // 4 = RESULTADO
    var cuenta: Dictionary<Int, String> = [:]

    
    var cuentasTotal: Dictionary<Int, Dictionary<Int, String>> = [:]
    let cuentaPrueba1: Dictionary<Int, String> = [ 1 : "33", 2: "10", 3: "Multiplica", 4 : "330"]
    
    
    
    var aux = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calcular"
        quehara.text = calculoOption;
        cuentasTotal.updateValue(cuentaPrueba1, forKey: aux)
        // Do any additional setup after loading the view.
        
    }

    
    
    @IBAction func hacerCuenta(_ sender: Any) {
        num1 = valor1.text;
        num2 = valor2.text;
        value1 = Int(num1!)
        value2 = Int(num2!)
        
        cuenta.updateValue(num1!, forKey: 1)
        cuenta.updateValue(num2!, forKey: 2)
        cuenta.updateValue(quehara.text!, forKey: 3)
        
        guard let num1 = Int(valor1.text ?? ""), let num2 = Int(valor2.text ?? "")
        else {
            txt_result.text = "Los valores introducidos no son numeros."
            return
        }
        
        
      
        
        
        if quehara.text == "Suma" {
            result = value1! + value2!
            res = String(result!)
            txt_result.text = res
            cuenta.updateValue(res!, forKey: 4)

        } else if quehara.text == "Resta" {
            result = value1! - value2!
            res = String(result!)
            txt_result.text = res
            cuenta.updateValue(res!, forKey: 4)
        } else if quehara.text == "Multiplica" {
            result = value1! * value2!
            res = String(result!)
            cuenta.updateValue(res!, forKey: 4)
            txt_result.text = res
        } else if quehara.text == "Divide" {
            result = value1! / value2!
            res = String(result!)
            txt_result.text = res
            cuenta.updateValue(res!, forKey: 4)
        }
        aux = aux + 1;
        addCuenta();
        
        
    }
    
    func addCuenta() {
        cuentasTotal.updateValue(cuenta, forKey: aux)
        print(cuentasTotal)
        print(cuenta)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let allData = segue.destination as! Vista3TableViewController
        
        allData.cuentaRealizada = cuentasTotal
        
        
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
