//
//  HomeCampoDeTextoRadicado.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

class HomeCampoDeTexto: UITextField {
    private struct Constantes {
        static let tamañoDeFuente: CGFloat = 18.0
        static let textoPlaceholder = "Radicado"
        static let colorDeFondo: UIColor = .white
    }
    
    init() {
        super.init(frame: .zero)
        iniciarCampoDeTexto()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func iniciarCampoDeTexto() {
        self.backgroundColor = Constantes.colorDeFondo
        self.borderStyle = .roundedRect
        self.font = UIFont.systemFont(ofSize: Constantes.tamañoDeFuente)
        self.placeholder = Constantes.textoPlaceholder
        self.keyboardType = .numberPad
    }
}
