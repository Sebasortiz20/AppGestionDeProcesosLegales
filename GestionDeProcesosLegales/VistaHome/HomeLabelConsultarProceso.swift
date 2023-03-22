//
//  HomeLabelConsultarRadicado.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

class HomeLabelConsultarProceso: UILabel {
    
    private struct Constantes {
            static let tamañoDeFuente: CGFloat = 28.0
            static let numeroLineas: Int = 2
            static let texto = "Consultar Directamente Un Proceso"
    }
    
    init() {
        super.init(frame: .zero)
        iniciarLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func iniciarLabel() {
        self.text = Constantes.texto
        self.font = UIFont.boldSystemFont(ofSize: Constantes.tamañoDeFuente)
        self.textColor = .black
        self.textAlignment = .center
        self.numberOfLines = Constantes.numeroLineas
    }
}
