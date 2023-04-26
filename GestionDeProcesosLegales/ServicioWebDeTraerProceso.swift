//
//  ServicioWebDeTraerProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 24/04/23.
//

import Foundation

protocol ServicioWebDeTraerProcesoProtocol {
    func obtenerProcesos(casoExito: @escaping ([ProcesoDominio]) -> (), casoError: @escaping (ErrorDeServicioWeb) -> ())
}

enum ErrorDeServicioWeb: Error {
    case noSePudoHacerLaPeticion
    case códigoDeEstadoInesperado
    case datosNulosInesperados
    case errorDeDescodificación
}

class ServicioWebDeTraerProceso {
    
}

extension ServicioWebDeTraerProceso: ServicioWebDeTraerProcesoProtocol {
    
    func obtenerProcesos(casoExito: @escaping ([ProcesoDominio]) -> (), casoError: @escaping (ErrorDeServicioWeb) -> ()) { /// se hace el llamado al servidor web                     ////  clase servicios web
        let configuracion = URLSessionConfiguration.default
        let session = URLSession(configuration: configuracion)
        
        let solicitud = obtenerSolicitud()
        
        let tarea = session.dataTask(with: solicitud) {[weak self] data, respuesta, error in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.procesarRespuesta(data: data, respuesta: respuesta, error: error, casoExito: casoExito, casoError: casoError)
            }
        }
        tarea.resume()
    }
    
    func procesarRespuesta(data: Data?, respuesta: URLResponse?, error: Error?, casoExito: ([ProcesoDominio]) -> (), casoError: (ErrorDeServicioWeb) -> ()) {
        if let error  = error {
            print("Ocurrio un error extraordinario en la peticion: " + error.localizedDescription)
            casoError(.noSePudoHacerLaPeticion)
            return
        }
        if let respuesta = respuesta as? HTTPURLResponse, respuesta.statusCode != 200 {
            print("Obtuve algun error en la respuesta obtenida")
            casoError(.códigoDeEstadoInesperado)
            return
        }
        guard let data = data else {
            print("Se esperaba que los datos fueran distintos de nulo")
            casoError(.datosNulosInesperados)
            return
        }
        let decodificador = JSONDecoder()
        do {
            let respuestaDecodificada = try decodificador.decode([RespuestaConsultaAPIProcesos].self, from: data)
            let respuestaConvertida = MapaAPIProcesoAProcesoDominio.convertir(respuestaDecodificada)
            casoExito(respuestaConvertida)
        } catch {
            print("Hubo un error decodificando la respuesta")
            casoError(.errorDeDescodificación)
        }
    }
    
    func obtenerSolicitud() -> URLRequest {
        let numeroRadicacion = "05001233300020160102100"
        let soloActivos = "true"
        let urlString = "https://consultaprocesos.ramajudicial.gov.co:448/api/v2/Procesos/Consulta/NumeroRadicacion?numero=\(numeroRadicacion)&SoloActivos=\(soloActivos)&pagina=1"
        guard let url = URL(string: urlString) else {
            print("la URl no es valida")
            fatalError("La URL no es válida")
        }
        var solicitud = URLRequest(url: url)
        solicitud.httpMethod = "GET"
        return solicitud
    }
 }
