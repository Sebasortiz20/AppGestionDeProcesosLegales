//
//  FormularioEdicionProcesoConstructor.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 18/04/23.
//

import UIKit

class FormularioEdicionProcesoConstructor {
    static func construya() -> UIViewController {
        let cerebro = FormularioEdicionProcesoCerebro()
        let viewController = FormularioEdicionProcesoViewController(cerebro: cerebro)
        return viewController
    }
}
