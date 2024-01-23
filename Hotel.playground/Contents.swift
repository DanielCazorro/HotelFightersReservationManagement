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
    
    // Contador de ID para asegurar identificadores únicos
    private var idCounter = 0
    let hotelName = "Namek"
    private(set) var reservationList: [Reservation] = []
    
    /// Crea método para añadir una reserva
    func addReservation(clientList: [Client], stayInDays: Int, breakfast: Bool) throws -> Reservation {
        
        // Incrementa el contador de identificación
        idCounter += 1
        
        /// Cálculo del precio total
        let GeneralPrice = 20.0
        let breakfastPrice: Double = breakfast ? 1.25 : 1
        
        let finalPrice = Double(clientList.count) * GeneralPrice * Double(stayInDays) * breakfastPrice
        
        // Crea la reserva
        let reservationToAdd = Reservation(id: idCounter, hotelName: hotelName, clientList: clientList, stayInDays: stayInDays, price: finalPrice, breakfast: breakfast)
        
        /// Verificar que el ID es único
        for reservation in reservationList {
            if reservation.id == idCounter {
                print("El ID de reserva \(idCounter) ya está siendo utilizado.")
                throw ReservationError.sameID
            }
        }
        
        /// Verificar que el cliente (nombre) no está repetido
        for reservation in reservationList {
            for client in reservation.clientList {
                for nextClient in clientList {
                    if client.name == nextClient.name {
                        print("El cliente \(client.name) ya se encuentra en otra reserva.")
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
        
        // Busca la reserva con el ID especificado
        guard let numberIndex = reservationList.firstIndex(where: {$0.id == id}) else {
            print("No es posible cancelar la reserva, ya que no existe en la base de datos.")
            throw ReservationError.noReservation
        }
        // Remueve la reserva del listado
        reservationList.remove(at: numberIndex)
    }
    
    /// Crea un método (o propiedad de solo lectura) para obtener un listado de todas las reservas actuales
    func printListOfReservations () -> Array<Reservation> {
        
        // Devuelve la lista de reservas
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
        let ReservationFail2: () = try hotelManager.cancelReservation(reservationIdToRemove: 3)
    } catch {
        print(ReservationError.noReservation)
    }
}

/// Asegura que el sistema calcula los precios de forma consistente. Por ejemplo: si hago dos reservas con los mismos parámetros excepto el nombre de los clientes, me deberían dar el mismo precio.
func testReservationPrice() {
    
    // Verifica que las reservas 1 y 2 tengan el mismo precio
    assert(Reservation1.price == Reservation2.price)
    
    // Verifica que las reservas 1 y 4 tengan precios diferentes
    assert(Reservation1.price != Reservation4.price)
    
    // Verifica que las reservas 2 y 4 tengan precios diferentes
    assert(Reservation2.price != Reservation4.price)
    
    // Intenta agregar una reserva adicional con los mismos parámetros, excepto el cliente Goku
    do {
        let Reservation5 = try hotelManager.addReservation(clientList: [Vegeta], stayInDays: 3, breakfast: true)
        // Verifica que la nueva reserva tenga el mismo precio que la reserva 1
        assert(Reservation1.price == Reservation5.price)
    } catch ReservationError.sameClient {
        // Debería fallar ya que Goku ya está en la reserva 1
        print("Error al agregar Reservation5: El cliente ya está en otra reserva.")
    } catch {
        assertionFailure("Se esperaba un error de cliente duplicado")
    }
    
}

// MARK: - Test -

testAddReservation()
testCancelReservation()
testReservationPrice()

hotelManager.printListOfReservations()
