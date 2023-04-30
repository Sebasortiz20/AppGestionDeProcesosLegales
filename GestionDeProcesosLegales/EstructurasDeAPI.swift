// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let radicado = try? JSONDecoder().decode(Radicado.self, from: jsonData)

import Foundation

// MARK: - Radicado
struct Radicado: Codable {
    let tipoConsulta: String
    let procesos: [Proceso]
    let parametros: Parametros
    let paginacion: Paginacion
}

// MARK: - Paginacion
struct Paginacion: Codable {
    let cantidadRegistros, registrosPagina, cantidadPaginas, pagina: Int
    let paginas: JSONNull?
}

// MARK: - Parametros
struct Parametros: Codable {
    let numero: String
    let nombre, tipoPersona, idSujeto, ponente: JSONNull?
    let claseProceso, codificacionDespacho: JSONNull?
    let soloActivos: Bool
}

// MARK: - Proceso
struct Proceso: Codable {
    let idProceso, idConexion: Int
    let llaveProceso, fechaProceso: String
    let fechaUltimaActuacion: String?
    let despacho, departamento, sujetosProcesales: String
    let esPrivado: Bool
    let cantFilas: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
           hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
