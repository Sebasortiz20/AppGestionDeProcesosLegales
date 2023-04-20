//
//  ConstruirSubvistaAzul.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import UIKit

class ConstruirSubvistaAzul {
    private struct Constantes {
        static let colorFondo = UIColor.cyan
    }
    
    static func crear() -> UIView {
        let view = UIView()
        view.backgroundColor = Constantes.colorFondo
        return view
    }
}
