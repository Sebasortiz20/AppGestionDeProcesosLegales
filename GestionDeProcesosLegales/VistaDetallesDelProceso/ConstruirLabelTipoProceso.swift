//
//  ConstruirLabelTipoProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 28/03/23.
//

import UIKit

class ConstruirLabelTipoProceso {
    
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 20.0
        static let texto = "Tipo de proceso"
    }
    
    static func crear() -> UILabel {
        let label = UILabel()
        configurar(label: label)
        return label
    }
    
    static func configurar(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: Constantes.tamañoDeFuente, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.text = Constantes.texto
    }
}
