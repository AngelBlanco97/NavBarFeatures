//
//  CeldaTableViewCell.swift
//  NavBarActualizado
//
//  Created by Angel  Blanco on 3/12/21.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_valor1: UILabel!
    @IBOutlet weak var lbl_res: UILabel!
    @IBOutlet weak var lbl_valor2: UILabel!
    @IBOutlet weak var lbl_accion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
