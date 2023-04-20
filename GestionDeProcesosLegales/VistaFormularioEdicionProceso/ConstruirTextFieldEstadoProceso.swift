//
//  ConstruirTextFieldEstadoProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import UIKit

class ConstruirTextFieldEstadoProceso {
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 16.0
        static let texto = "Estado del proceso"
        static let colorTexto: UIColor = .darkGray
        static let bordeAncho: CGFloat = 1.0
        static let bordeColor: UIColor = .lightGray
        static let esquinasRedondeadas: CGFloat = 8.0
    }
    
    static func crear() -> UITextField {
        let textField = UITextField()
        configurar(textField: textField)
        return textField
    }
    
    private static func configurar(textField: UITextField) {
        textField.placeholder = Constantes.texto
        textField.font = UIFont.systemFont(ofSize: Constantes.tamañoDeFuente, weight: .bold)
        textField.textColor = Constantes.colorTexto
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = Constantes.bordeAncho
        textField.layer.borderColor = Constantes.bordeColor.cgColor
        textField.layer.cornerRadius = Constantes.esquinasRedondeadas
        textField.clearButtonMode = .whileEditing
    }
}
