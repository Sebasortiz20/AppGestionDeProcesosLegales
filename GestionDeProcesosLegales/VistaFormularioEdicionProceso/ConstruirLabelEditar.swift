//
//  ConstruirLabelEditar.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 25/04/23.
//

import UIKit

class ConstruirLabelEditar {
    
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 25
        static let texto = "Editar"
        static let colorTexto: UIColor = .black
    }
    
    static func crear() -> UILabel {
        let label = UILabel()
        configurar(label)
        return label
    }
    
    static func configurar(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: Constantes.tamañoDeFuente, weight: .bold)
        label.textColor = Constantes.colorTexto
        label.textAlignment = .left
        label.text = Constantes.texto
    }
}
