//
//  DetallesConstructor.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

class DetallesConstructor {
    static func construya() -> UIViewController {
        let cerebro = DetallesCerebro()
        let viewController = DetallesVistaControlador(cerebro: cerebro)
        return viewController
    }
}
