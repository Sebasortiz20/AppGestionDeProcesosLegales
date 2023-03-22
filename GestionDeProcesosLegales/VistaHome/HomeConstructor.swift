//
//  HomeConstructor.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

class HomeConstructor {
    static func construya() -> UIViewController {
        let cerebro = HomeCerebro()
        let viewController = HomeVistaControlador(cerebro: cerebro)
        return viewController
    }
}
