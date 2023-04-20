//
//  ConstruirLabelJuezACargo.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 28/03/23.
//

import UIKit

class ConstruirLabelJuezACargo {
    
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 20.0
        static let texto = "Juez a cargo"
        static let colorTexto: UIColor = .black
    }
    
    static func crear() -> UILabel {
        let label = UILabel()
        configurar(label)
        return label
    }
    
    private static func configurar(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: Constantes.tamañoDeFuente, weight: .regular)
        label.textColor = Constantes.colorTexto
        label.textAlignment = .left
        label.text = Constantes.texto
    }
}
