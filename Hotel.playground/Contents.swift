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
    let hotelName: String
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
    
    
    func addReservation(clients: [Client], days: Int, breakfastOption: Bool) {
        
        var newID = 0
        
        let newReservation = Reservation(id: newID, hotelName: hotelName, clientList: clients, stayInDays: days, price: 5, breakfast: breakfastOption)
        
        reservationList.append(newReservation)
        
        newID += 1
        
        // verificar que el ID es único y que no está en ninguna otra reserva (que goku no pueda hacer dos reservas)
        
        //cálculo de precioa
    }
    
    func cancelReservation() {
        
    }
    
    func printListOfReservations () {
        print(reservationList)
    }
    
}


// Pruebas para eliminar

let Goku = Client(name: "Goku", age: 45, height: 1.95)
Goku.name
Goku.age
Goku.height
let Vegeta = Client(name: "Vegeta", age: 48, height: 1.80)
var people: [Any] = []
people.append(Goku)
people.append(Vegeta)
people

//let TeamHuman = Reservation(clientList: id: 0, hotelName: "Konoha", ["Goku","Vegetta","Piccolo"], stayInDays: 5, price: 25.50, breakfast: true)
let TeamHuman2 = Reservation(id: 1, hotelName: "Konoha", clientList: [Goku, Vegeta], stayInDays: 5, price: 5.25, breakfast: true)
TeamHuman2

HotelReservationManager().addReservation(clients: [Goku, Vegeta], days:5, breakfastOption:true)
HotelReservationManager().printListOfReservations()
