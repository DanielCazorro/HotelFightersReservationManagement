// MARK: - Gestión de Reservas de Hotel Luchadores-

// Descripción: Desarrolla un sistema para gestionar reservas de hotel para Goku y sus amigos.

// MARK: - Estructuras -

// Modela las estructuras: Client (cliente), Reservation (reserva) y ReservationError (errores de la reserva).

import Foundation

/// Estructura Cliente
struct Client {
    let name: String
    let age: Int
    let height: Double
}

/// Estructura Reserva
struct Reservation {
    var id: Int
    let hotelName: String
    let clientList: [Client]
    let stayInDays: Int
    let price: Double
    let breakfast: Bool
}

/// Estructura Errores de la reserva
enum ReservationError: Error {
    case sameID
    case sameClient
    case noReservation
}

// MARK: - Class -

class HotelReservationManager {
    
    private var idCounter = 0
    let hotelName = "Namek"
    private(set) var reservationList: [Reservation] = []
    
    /// Crea método para añadir una reserva
    func addReservation(clientList: [Client], stayInDays: Int, breakfast: Bool) throws -> Reservation {
        
        idCounter += 1
        
        /// Cálculo del precio total
        let GeneralPrice = 20.0
        var breakfastPrice: Double = 0.00
        if breakfast == true {breakfastPrice = 1.25 } else {breakfastPrice = 1}
        let finalPrice = Double(clientList.count) * GeneralPrice * Double(stayInDays) * breakfastPrice
        
        let reservationToAdd = Reservation(id: idCounter, hotelName: hotelName, clientList: clientList, stayInDays: stayInDays, price: finalPrice, breakfast: breakfast)
        
        /// Verificar que el ID es único
        for reservation in reservationList {
            if reservation.id == idCounter {
                print("El ID de reserva debe ser único. Este ya está siendo utilizado.")
                throw ReservationError.sameID
            }
        }
        
        /// Verificar que el cliente (nombre) no está repetido
        for reservation in reservationList {
            for client in reservation.clientList {
                for nextClient in clientList {
                    if client.name == nextClient.name {
                        print("El cliente ya se encuentra en otra reserva.")
                        throw ReservationError.sameClient
                    }
                }
            }
        }
        
        /// Añade la reserva al listado de reservas.
        reservationList.append(reservationToAdd)
        
        ///Devuelve la reserva
        return reservationToAdd
    }
    
    ///Crea un método para cancelar una reserva
    func cancelReservation(reservationIdToRemove id: Int) throws {
        
        guard let numberIndex = reservationList.firstIndex(where: {$0.id == id}) else {
            print("No es posible cancelar la reserva, ya que no existe en la base de datos.")
            throw ReservationError.noReservation
        }

        reservationList.remove(at: numberIndex)
        
    }
    
    /// Crea un método (o propiedad de solo lectura) para obtener un listado de todas las reservas actuales
    func printListOfReservations () -> Array<Reservation> {
        
        return hotelManager.reservationList
        
    }
    
}

// MARK: - Testing -

let hotelManager = HotelReservationManager()

let Goku = Client(name: "Goku", age: 42, height: 1.75)
let Vegeta = Client(name: "Vegeta", age: 46, height: 1.64)
let Krillin = Client(name: "Krillin", age: 42, height: 1.53)
let Frieza = Client(name: "Frieza", age: 43, height: 1.58)
let Gohan = Client(name: "Gohan", age: 27, height: 1.76)

let Reservation1 = try hotelManager.addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
let Reservation2 = try hotelManager.addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
let Reservation3 = try hotelManager.addReservation(clientList: [Krillin], stayInDays: 4, breakfast: false)
let Reservation4 = try hotelManager.addReservation(clientList: [Frieza, Gohan], stayInDays: 2, breakfast: false)


/// Verifica errores al añadir reservas duplicadas (por ID o si otro cliente ya está en alguna otra reserva) y que nuevas reservas sean añadidas correctamente.
func testAddReservation() {
    
    
    
    assert(Reservation1.id == 1)
    assert(Reservation1.id != Reservation2.id)
    assert(Reservation2.id != Reservation3.id)
    assert(Reservation3.id == 3)
    
    do {
        let ReservationFail1 = try hotelManager.addReservation(clientList: [Goku], stayInDays: 1, breakfast: false)
    } catch {
        print(ReservationError.sameClient)
    }

}


try hotelManager.cancelReservation(reservationIdToRemove: 3)

/// Verifica que las reservas se cancelen correctamente (borrándose del listado) y que cancelar una reserva no existente resulte en un error.
func testCancelReservation() {
    
    assert(hotelManager.reservationList.count == 3)
    
    do {
        let ReservationFail2 = try hotelManager.cancelReservation(reservationIdToRemove: 3)
    } catch {
        print(ReservationError.noReservation)
    }
}

/// Asegura que el sistema calcula los precios de forma consistente. Por ejemplo: si hago dos reservas con los mismos parámetros excepto el nombre de los clientes, me deberían dar el mismo precio.
func testReservationPrice() {
    
    assert(Reservation1.price == Reservation2.price)
    assert(Reservation1.price != Reservation4.price)
    
}


// MARK: - Pruebas para eliminar -


// MARK: - Test -

testAddReservation()
testCancelReservation()
testReservationPrice()

hotelManager.printListOfReservations()
