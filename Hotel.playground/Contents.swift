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

// FIXME: Check all var and let, because some of them should be private

private var reservationList: [Reservation] = []
private var idCounter = 0


class HotelReservationManager {
    
    /// Crea método para añadir una reserva
    func addReservation(clientList: [Client], stayInDays: Int, breakfast: Bool) {
        
        idCounter += 1
        let hotelName = "Namek"
        
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
                ReservationError.sameID
            }
        }
        
        /// Verificar que el cliente (nombre) no está repetido
        //TODO:
        
        /// Añade la reserva al listado de reservas.
        reservationList.append(reservationToAdd)
        
        ///Devuelve la reserva
        //TODO:
    }
    
    ///Crea un método para cancelar una reserva
    func cancelReservation(Reservation: Reservation) {
        
        reservationList.remove(at: Reservation.id)
    }
    
    /// Crea un método (o propiedad de solo lectura) para obtener un listado de todas las reservas actuales
    func printListOfReservations () -> Array<Reservation> {
        
        return reservationList
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
    
    assert(Reservation1.price == Reservation2.price)
    assert(Reservation1.price != Reservation3.price)
    
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


HotelReservationManager().addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
HotelReservationManager().addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
HotelReservationManager().addReservation(clientList: [Krillin], stayInDays: 4, breakfast: false)
let Reservation1 = reservationList[0]
let Reservation2 = reservationList[1]
let Reservation3 = reservationList[2]

HotelReservationManager().printListOfReservations()
HotelReservationManager().cancelReservation(Reservation: Reservation1)

HotelReservationManager().printListOfReservations()
reservationList

// MARK: - Test -

testAddReservation()
testReservationPrice()
