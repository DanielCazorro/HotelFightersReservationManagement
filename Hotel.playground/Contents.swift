/**Gestión de Reservas de Hotel Luchadores
 Descripción: Desarrolla un sistema para gestionar reservas de hotel para Goku y sus amigos.
*/

/**
 Modela las estructuras: Client (cliente), Reservation (reserva) y ReservationError
 (errores de la reserva).
 */

// FIXME: Si no es necesario, eliminar este Foundation
import Foundation

// Estructura Cliente

struct Client {
    
    let name: String
    let age: Int
    let height: Double
    
}

// Estructura Reserva

struct Reservation {
    
    var id: Int
    let hotelName: String
    let clientList: [Client]
    let stayInDays: Int
    let price: Double
    let breakfast: Bool

}

// Estructura Errores de la reserva

enum ReservationError: Error {
    
    case sameID
    case sameClient
    case noReservation
    
}

// ------------------------------

// FIXME: Check all var and let, because some of them should be private

var reservationList: [Reservation] = []
var idCounter = 0

class HotelReservationManager {
    
    
    func addReservation(clientList: [Client], stayInDays: Int, breakfast: Bool) {
        
        idCounter += 1
        let hotelName = "Namek"
        
        // Cálculo del precio total
        let GeneralPrice = 20.0
        var breakfastPrice: Double = 0.00
        if breakfast == true {breakfastPrice = 1.25 } else {breakfastPrice = 1}
        let finalPrice = Double(clientList.count) * GeneralPrice * Double(stayInDays) * breakfastPrice
        
        let reservationToAdd = Reservation(id: idCounter, hotelName: hotelName, clientList: clientList, stayInDays: stayInDays, price: finalPrice, breakfast: breakfast)
        
        reservationList.append(reservationToAdd)
        
        // verificar que el ID es único y que no está en ninguna otra reserva (que goku no pueda hacer dos reservas)
        
    }
    
    func cancelReservation(Reservation: Reservation) {
        
        reservationList.remove(at: Reservation.id)
        
    }
    
    func printListOfReservations () {
        print("Reservation List:",reservationList)
    }
    
}

// Testing

func testAddReservation() {
    // Verifica errores al añadir reservas duplicadas (por ID o si otro cliente ya está en alguna otra reserva) y que nuevas reservas sean añadidas correctamente.
    
   // assert(HotelReservationManager().reservationList.count == 0)
}

// Ejecutamos el test
testAddReservation()

func testCancelReservation() {
    // Verifica que las reservas se cancelen correctamente (borrándose del listado) y que cancelar una reserva no existente resulte en un error.
}

func testReservationPrice() {
    // Asegura que el sistema calcula los precios de forma consistente. Por ejemplo: si hago dos reservas con los mismos parámetros excepto el nombre de los clientes, me deberían dar el mismo precio.
}



// ---------------- Pruebas para eliminar ----------------

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

HotelReservationManager().addReservation(clientList: [Goku, Vegeta], stayInDays: 5, breakfast: true)
HotelReservationManager().addReservation(clientList: [Krillin], stayInDays: 10, breakfast: false)
HotelReservationManager().printListOfReservations()
//let firstReservation = Reservation(clientList: [Goku], stayInDays: 1, price: 0, breakfast: true)
//firstReservation.id
//let secondReservation = Reservation(clientList: [Vegeta, Krillin], stayInDays: 1, price: 0, breakfast: false)
//secondReservation.id
//secondReservation.breakfast

//HotelReservationManager().reservationList
//HotelReservationManager().addReservation(reservationToAdd: firstReservation)
//HotelReservationManager().printListOfReservations()

