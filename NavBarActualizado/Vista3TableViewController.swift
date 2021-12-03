//
//  Vista3TableViewController.swift
//  NavBarActualizado
//
//  Created by Angel  Blanco on 1/12/21.
//

import UIKit

class Vista3TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //SIN PERSISTENCIA DE DATOS
    var arrayValor1 = [22, 10, 3, 5,4]
    var arrayValor2 = [20, 15, 2, 10, 5]
    var arrayAccion = ["+", "-", "/", "x", "+"]
    var arrayResul = [42, -5, 1, 50, 9]
    
    @IBOutlet weak var miTabla: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayValor1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = miTabla.dequeueReusableCell(withIdentifier: "Celda") as! CeldaTableViewCell
        celda.lbl_valor1.text = String(arrayValor1[indexPath.row])
        celda.lbl_valor2.text = String(arrayValor2[indexPath.row])
        celda.lbl_accion.text = arrayAccion[indexPath.row]
        celda.lbl_res.text = String(arrayResul[indexPath.row])
        return celda
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cuentas Realizadas"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "No hay mas cuentas guardadas."
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let optBorrar = UIContextualAction(style: .normal, title: "Borrar") {_,_,_ in
            self.arrayValor1.remove(at: indexPath.row)
            self.arrayValor2.remove(at: indexPath.row)
            self.arrayAccion.remove(at: indexPath.row)
            self.arrayResul.remove(at: indexPath.row)
            self.miTabla.deleteRows(at: [indexPath], with: .fade)
        }
        
        optBorrar.image = UIImage(systemName: "trash")
        optBorrar.backgroundColor = UIColor.red
        
        let optEditar = UIContextualAction(style: .normal, title: "Revertir") {_,_,_ in
            
            
            if self.arrayAccion[indexPath.row] == "+" {
                self.arrayAccion[indexPath.row] = "-"
                self.arrayResul[indexPath.row] = self.arrayValor1[indexPath.row]-self.arrayValor2[indexPath.row]
            } else if self.arrayAccion[indexPath.row] == "-" {
                self.arrayAccion[indexPath.row] = "+"
                self.arrayResul[indexPath.row] = self.arrayValor1[indexPath.row]+self.arrayValor2[indexPath.row]
            } else if self.arrayAccion[indexPath.row] == "x" {
                self.arrayAccion[indexPath.row] = "/"
                self.arrayResul[indexPath.row] = self.arrayValor1[indexPath.row]/self.arrayValor2[indexPath.row]
            } else if self.arrayAccion[indexPath.row] == "/" {
                self.arrayAccion[indexPath.row] = "x"
                self.arrayResul[indexPath.row] = self.arrayValor1[indexPath.row]*self.arrayValor2[indexPath.row]
            }
            self.miTabla.reloadData()
        }
        optEditar.backgroundColor = UIColor.yellow
        
        
        
        let configurarBotones = UISwipeActionsConfiguration(actions: [optBorrar, optEditar])
        
        return configurarBotones
    }
    
    
    

    var cuentaRealizada: Dictionary<Int, Dictionary<Int,String>> = [:]
    
    
    override func viewDidLoad() {
        title = "Mis cuentas"
        super.viewDidLoad()
        print(cuentaRealizada)
        // Do any additional setup after loading the view.
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
