//
//  ListadoDeProcesosConstructor.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 29/03/23.
//

import UIKit

class ListadoDeProcesosConstructor {
    static func construya() -> UIViewController {
        let cerebro = ListadoDeProcesosCerebro()
        let viewController = ListadoDeProcesosViewController(cerebro: cerebro)
        return viewController
    }
}
