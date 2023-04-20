//
//  ListadoLabel.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 11/04/23.
//

import UIKit

class ListadoLabel: UILabel {
    
    private struct Constantes {
        static let texto = "Listado"
        static let tamañoTexto: CGFloat = 30.0
        static let colorTexto: UIColor = .black
    }
    
    init() {
        super.init(frame: .zero)
        personalizarTituloLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func personalizarTituloLabel() {
        self.text = Constantes.texto
        self.font = UIFont.systemFont(ofSize: Constantes.tamañoTexto, weight: .semibold)
        self.textColor = Constantes.colorTexto
        self.textAlignment = .center
    }
}
