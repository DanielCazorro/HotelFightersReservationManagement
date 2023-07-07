// MARK: - Gestión de Reservas de Hotel Luchadores-

// Descripción: Desarrolla un sistema para gestionar reservas de hotel para Goku y sus amigos.

// MARK: - Estructuras -

// Modela las estructuras: Client (cliente), Reservation (reserva) y ReservationError (errores de la reserva).

// FIXME: Si no es necesario, eliminar este Foundation
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
        
        // verificar que el ID es único y que no está en ninguna otra reserva (que goku no pueda hacer dos reservas). Lanzar error si no es así
        /// Verificar que el ID es único
        for reservation in reservationList {
            if reservation.id == idCounter {
                throw ReservationError.sameID
            }
        }
        
        /// Verificar que el cliente (nombre) no está repetido
        for reservation in reservationList {
            for client in reservation.clientList {
                for nextClient in clientList {
                    if client.name == nextClient.name {
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
    func cancelReservation(Reservation: Reservation) throws {
        
        reservationList.remove(at: Reservation.id)
        
    }
    
    
    /// Crea un método (o propiedad de solo lectura) para obtener un listado de todas las reservas actuales
    func printListOfReservations () -> Array<Reservation> {
        
        return hotelReservationManager.reservationList
        //print("Reservation List:",reservationList)
    }
    
}
// MARK: - Testing -

/// Verifica errores al añadir reservas duplicadas (por ID o si otro cliente ya está en alguna otra reserva) y que nuevas reservas sean añadidas correctamente.
func testAddReservation() {
    
     assert(Reservation1.id != Reservation2.id)

}

/// Verifica que las reservas se cancelen correctamente (borrándose del listado) y que cancelar una reserva no existente resulte en un error.
func testCancelReservation() {

}

/// Asegura que el sistema calcula los precios de forma consistente. Por ejemplo: si hago dos reservas con los mismos parámetros excepto el nombre de los clientes, me deberían dar el mismo precio.
func testReservationPrice() {
    
    //assert(Reservation1.price == Reservation2.price)
    //assert(Reservation1.price != Reservation3.price)
    
}


// MARK: - Pruebas para eliminar -

let Goku = Client(name: "Goku", age: 45, height: 1.95)
Goku.name
Goku.age
Goku.height
let Vegeta = Client(name: "Vegeta", age: 48, height: 1.80)
Vegeta.name
Vegeta.age
Vegeta.height
let Krillin = Client(name: "Krillin", age: 45, height: 1.65)
Krillin.name
Krillin.age
Krillin.height

let hotelReservationManager = HotelReservationManager()

try hotelReservationManager.addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
try hotelReservationManager.addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
try hotelReservationManager.addReservation(clientList: [Krillin], stayInDays: 4, breakfast: false)

let Reservation1 = hotelReservationManager.reservationList[0]
let Reservation2 = hotelReservationManager.reservationList[1]
let Reservation3 = hotelReservationManager.reservationList[2]
hotelReservationManager.reservationList

try hotelReservationManager.cancelReservation(Reservation: Reservation1)
hotelReservationManager.printListOfReservations()
// MARK: - Test -

testAddReservation()
testReservationPrice()
