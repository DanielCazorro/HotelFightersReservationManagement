/**Gestión de Reservas de Hotel Luchadores
 Descripción: Desarrolla un sistema para gestionar reservas de hotel para Goku y sus amigos.
*/

/**
 Modela las estructuras: Client (cliente), Reservation (reserva) y ReservationError
 (errores de la reserva).
 */

// FIXME: Si no es necesario, eliminar este Foundation
import Foundation

var newID = 0
// Estructura Cliente

struct Client {
    
    let name: String
    let age: Int
    let height: Double
    
}

// Estructura Reserva

struct Reservation {
    
    var id: Int = newID
    /**
     The ID coud be a var that add 1 every time that one reservation is made
     somthing like: var idNumber = 0 // and at the end of func addreservation
     idNumber += 1
     */
    let hotelName: String = "Namek"
    /**
    Maybe we can set here the hotel name. If not, try to set it down, where we change id
     */
    let clientList: [Client]
    let stayInDays: Int
    let price: Double
    func priceTotal() -> Double {
        return Double(clientList.count * 20 * stayInDays)

    }
    
    let breakfast: Bool
    var breakfastPrice = 1
    if breakfast == true {breakfasPrice = 1.25}
}

// Estructura Errores de la reserva

enum ReservationError: Error {
    
    case sameID
    case sameClient
    case noReservation
    
}

// ------------------------------

class HotelReservationManager {
    
    var reservationList: [Any] = []
    
    
    func addReservation(reservationToAdd: Reservation) {
        
        
        let basePrice = 20
        var priceToAdd = reservationToAdd.clientList.count * basePrice * reservationToAdd.stayInDays
        
        
        reservationList.append(reservationToAdd)
        print(reservationList)
        
        newID += 1
        
        // verificar que el ID es único y que no está en ninguna otra reserva (que goku no pueda hacer dos reservas)
        
        //cálculo de precioa
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
    
    assert(HotelReservationManager().reservationList.count == 0)
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

let firstReservation = Reservation(clientList: [Goku], stayInDays: 1, price: 0, breakfast: true)
firstReservation.id
let secondReservation = Reservation(clientList: [Vegeta, Krillin], stayInDays: 1, price: 0, breakfast: false)
secondReservation.id
secondReservation.breakfast

HotelReservationManager().reservationList
HotelReservationManager().addReservation(reservationToAdd: firstReservation)
HotelReservationManager().printListOfReservations()
