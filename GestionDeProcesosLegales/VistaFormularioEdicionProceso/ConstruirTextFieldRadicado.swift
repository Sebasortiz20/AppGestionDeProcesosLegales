//
//  ConstruirTextFieldRadicado.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import UIKit

class ConstruirTextFieldRadicado {
    
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 16.0
        static let texto = "Número de radicado"
        static let colorTexto: UIColor = .darkGray
        static let anchoBorde: CGFloat = 1.0
        static let colorBorde: UIColor = .lightGray
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
        textField.layer.borderWidth = Constantes.anchoBorde
        textField.layer.borderColor = Constantes.colorBorde.cgColor
        textField.layer.cornerRadius = Constantes.esquinasRedondeadas
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
    }
}
