//
//  AgregarProcesoConstructor.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 25/04/23.
//

import UIKit

class AgregarProcesoConstructor {
    static func construya() -> UIViewController {
        let cerebro = AgregarProcesoCerebro()
        let viewController = AgregarProcesoViewController(cerebro: cerebro)
        return viewController
    }
}
