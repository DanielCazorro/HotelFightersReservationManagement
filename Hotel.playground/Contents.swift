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

var reservationList: [Reservation] = []
var idCounter = 0


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
        // TODO:
        
        /// Añade la reserva al listado de reservas.
        reservationList.append(reservationToAdd)
        
        ///Devuelve la reserva
        //TODO: 
    }
    
    ///Crea un método para cancelar una reserva
    func cancelReservation(Reservation: Reservation) {
        
        reservationList.remove(at: Reservation.id)
        
    }
    
    func printListOfReservations () {
        print("Reservation List:",reservationList)
    }
    
}

// Testing
/*
HotelReservationManager().addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
HotelReservationManager().addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
HotelReservationManager().addReservation(clientList: [Krillin], stayInDays: 4, breakfast: false)
let Reservation1 = reservationList[0]
let Reservation2 = reservationList[1]
let Reservation3 = reservationList[2]
*/
//let Reservation1 = reservationList[0]
//let Reservation2 = reservationList[1]

func testAddReservation() {
    /// Verifica errores al añadir reservas duplicadas (por ID o si otro cliente ya está en alguna otra reserva) y que nuevas reservas sean añadidas correctamente.
    /*
    HotelReservationManager().addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
    HotelReservationManager().addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
    
    let Reservation1 = reservationList[0]
    let Reservation2 = reservationList[1]
     */
    assert(Reservation1.id != Reservation2.id)
    
    print(Reservation1.id)
    print(Reservation2.id)
   // assert(HotelReservationManager().reservationList.count == 0)
}

// Ejecutamos el test
//testAddReservation()

func testCancelReservation() {
    // Verifica que las reservas se cancelen correctamente (borrándose del listado) y que cancelar una reserva no existente resulte en un error.
}

func testReservationPrice() {
    /// Asegura que el sistema calcula los precios de forma consistente. Por ejemplo: si hago dos reservas con los mismos parámetros excepto el nombre de los clientes, me deberían dar el mismo precio.
    /*
    HotelReservationManager().addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
    HotelReservationManager().addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
    HotelReservationManager().addReservation(clientList: [Krillin], stayInDays: 4, breakfast: false)
    
    let Reservation1 = reservationList[0]
    let Reservation2 = reservationList[1]
    let Reservation3 = reservationList[3]
    */
    assert(Reservation1.price == Reservation2.price)
    assert(Reservation1.price != Reservation3.price)
    
    print(Reservation1.price)
    print(Reservation2.price)
    print(Reservation3.price)
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



reservationList


HotelReservationManager().addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
HotelReservationManager().addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
HotelReservationManager().addReservation(clientList: [Krillin], stayInDays: 4, breakfast: false)
let Reservation1 = reservationList[0]
let Reservation2 = reservationList[1]
let Reservation3 = reservationList[2]

HotelReservationManager().printListOfReservations()
HotelReservationManager().cancelReservation(Reservation: Reservation1)
print("*---------*")
HotelReservationManager().printListOfReservations()
reservationList
//HotelReservationManager().addReservation(clientList: [Goku, Vegeta], stayInDays: 5, breakfast: true)
//HotelReservationManager().addReservation(clientList: [Krillin], stayInDays: 10, breakfast: false)
//HotelReservationManager().printListOfReservations()
//let firstReservation = Reservation(clientList: [Goku], stayInDays: 1, price: 0, breakfast: true)
//firstReservation.id
//let secondReservation = Reservation(clientList: [Vegeta, Krillin], stayInDays: 1, price: 0, breakfast: false)
//secondReservation.id
//secondReservation.breakfast

//HotelReservationManager().reservationList
//HotelReservationManager().addReservation(reservationToAdd: firstReservation)
//HotelReservationManager().printListOfReservations()
// MARK: - Test -

testAddReservation()
testReservationPrice()
