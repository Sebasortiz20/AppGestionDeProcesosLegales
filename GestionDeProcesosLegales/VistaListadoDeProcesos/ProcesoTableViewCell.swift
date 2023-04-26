//
//  ProcesoTableViewCell.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 5/04/23.
//

import UIKit

protocol ProcesoTableViewCellProtocol where Self: UITableViewCell {
    func asignarRadicadoAlProceso(_ radicado: String)
    func asignarTipoDeProcesoAlProceso(_ tipoDeProceso: String)
}

class ProcesoTableViewCell: UITableViewCell {
    
    let radicadoLabel = UILabel()
    let tipoDeProcesoLabel = UILabel()
    
    var proceso: ProcesoDominio?
    
    private struct Constantes {
        static let texto = "Radicado:"
        static let tamañoFuenteRadicado: CGFloat = 18.0
        static let tamañoFuenteId: CGFloat = 16.0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configurarCelda()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configurarCelda() {
        agregarElementosEnLaCelda()
        personalizarRadicadoLabel()
        personalizarTipoDeProcesoLabel()
        posicionarRadicadoLabel()
        posicionarTipoDeProcesoLabel()
    }
    
    func agregarElementosEnLaCelda() {
        addSubview(radicadoLabel)
        addSubview(tipoDeProcesoLabel)
    }
    
    func personalizarRadicadoLabel() {
        radicadoLabel.font = UIFont.boldSystemFont(ofSize: Constantes.tamañoFuenteRadicado)
        radicadoLabel.text = Constantes.texto
    }
    
    func personalizarTipoDeProcesoLabel() {
        tipoDeProcesoLabel.font = UIFont.systemFont(ofSize: Constantes.tamañoFuenteId)
    }
    
    func posicionarRadicadoLabel() {
        radicadoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            radicadoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            radicadoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    
    func posicionarTipoDeProcesoLabel() {
        tipoDeProcesoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tipoDeProcesoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tipoDeProcesoLabel.topAnchor.constraint(equalTo: radicadoLabel.bottomAnchor, constant: 8),
            tipoDeProcesoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

extension ProcesoTableViewCell: ProcesoTableViewCellProtocol {
    func asignarRadicadoAlProceso(_ radicado: String) {
        radicadoLabel.text = "Radicado: \(radicado)"
    }
    
    func asignarTipoDeProcesoAlProceso(_ tipoDeProceso: String) {
        tipoDeProcesoLabel.text = "TipoDeProceso: \(tipoDeProceso)"
    }
}
