//
//  HomeStackView.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 17/03/23.
//

import UIKit

class HomeStackView: UIStackView {
    
    init() {
        super.init(frame: .zero)
        iniciarStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func iniciarStackView() {
        self.backgroundColor = .cyan
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .equalCentering
    }
}

