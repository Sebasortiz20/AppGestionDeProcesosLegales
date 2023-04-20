//
//  ConstruirSubvistaAzul.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 28/03/23.
//

import UIKit

class ConstruirSubvistaColorAzul {
    private struct Constantes {
        static let colorFondo = UIColor.cyan
    }
    
    static func crear() -> UIView {
        let view = UIView()
        view.backgroundColor = Constantes.colorFondo
        return view
    }
}
