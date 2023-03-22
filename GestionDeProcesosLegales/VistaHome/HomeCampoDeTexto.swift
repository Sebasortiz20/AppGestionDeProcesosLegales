//
//  HomeCampoDeTextoRadicado.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

class HomeCampoDeTexto: UITextField {
        
        private struct Constantes {
            struct CampoDeTexto {
                static let tamañoDeFuente: CGFloat = 18.0
                static let textoPlaceholder = "Radicado"
            }
        }
        
        init() {
            super.init(frame: .zero)
            iniciarCampoDeTexto()
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
        
        private func iniciarCampoDeTexto() {
            self.backgroundColor = .white
            self.borderStyle = .roundedRect
            self.font = UIFont.systemFont(ofSize: Constantes.CampoDeTexto.tamañoDeFuente)
            self.placeholder = Constantes.CampoDeTexto.textoPlaceholder
            self.keyboardType = .numberPad
        }
}
