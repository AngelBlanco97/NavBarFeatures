//
//  View1CalculadoraViewController.swift
//  NavBarActualizado
//
//  Created by Angel  Blanco on 1/12/21.
//

import UIKit

class View1CalculadoraViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var opciones = ["Suma","Resta","Multiplica","Divide"]
    var decision: String!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return opciones[row]
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        decision = opciones[row]
        print(decision!)
    }
    
    @IBOutlet weak var calculoPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculoPicker.dataSource = self;
        calculoPicker.delegate = self;
        title = "Calculadora"

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addCalculate") {
            let viewCalculate = segue.destination as! View2CalculadoraViewController
            
            viewCalculate.calculoOption = decision;
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
