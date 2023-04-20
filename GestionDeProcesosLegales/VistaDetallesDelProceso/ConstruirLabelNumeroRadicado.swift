//
//  ConstruirLabelNumeroRadicado.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 28/03/23.
//

import UIKit

class ConstruirLabelNumeroRadicado {
    
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 30.0
        static let texto = "Número de radicado"
        static let colorTexto: UIColor = .black
    }
    
    static func crear() -> UILabel {
        let label = UILabel()
        configurar(label: label)
        return label
    }
    
    private static func configurar(label: UILabel) {
        label.font = UIFont.systemFont(ofSize: Constantes.tamañoDeFuente, weight: .bold)
        label.textColor = Constantes.colorTexto
        label.textAlignment = .center
        label.text = Constantes.texto
    }
}
