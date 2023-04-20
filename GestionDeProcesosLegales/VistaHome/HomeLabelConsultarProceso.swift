//
//  HomeLabelConsultarRadicado.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

class HomeLabelConsultarProceso: UILabel {
    
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 22
        static let numeroLineas: Int = 2
        static let texto = "Consultar Directamente Un Proceso"
        static let colorTexto: UIColor = .black
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
        self.textColor = Constantes.colorTexto
        self.textAlignment = .center
        self.numberOfLines = Constantes.numeroLineas
    }
}
