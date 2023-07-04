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
 
    var id: Int = 0
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
    let breakfast: Bool
    
}

// Estructura Errores de la reserva

enum ReservationError: Error {
    
    case sameID
    case sameClient
    case noReservation
    
}

// ------------------------------

class HotelReservationManager {
    
    let hotelName = "Namek"
    var reservationList: [Any] = []
    
    
    func addReservation(Reservation: Reservation) {
        
        var newID = 0
        
        reservationList.append(Reservation)
        print(reservationList)
        
        newID += 1
        
        // verificar que el ID es único y que no está en ninguna otra reserva (que goku no pueda hacer dos reservas)
        
        //cálculo de precioa
    }
    
    func cancelReservation(Reservation: Reservation) {
        
        reservationList.remove(at: Reservation.id)
        
    }
    
    func printListOfReservations () {
        print(reservationList)
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

// Pruebas para eliminar

let Goku = Client(name: "Goku", age: 45, height: 1.95)
Goku.name
Goku.age
Goku.height
let Vegeta = Client(name: "Vegeta", age: 48, height: 1.80)
var people: [Client] = []
people.append(Goku)
people.append(Vegeta)
people

//let TeamHuman = Reservation(clientList: id: 0, hotelName: "Konoha", ["Goku","Vegetta","Piccolo"], stayInDays: 5, price: 25.50, breakfast: true)
//let TeamHuman2 = Reservation(id: 1, hotelName: "Konoha", clientList: [Goku, Vegeta], stayInDays: 5, price: 5.25, breakfast: true)
//TeamHuman2
let TeamHuman3 = Reservation(clientList: people, stayInDays: 5, price: 0, breakfast: true)

HotelReservationManager().addReservation(Reservation: TeamHuman3)
HotelReservationManager().printListOfReservations()


