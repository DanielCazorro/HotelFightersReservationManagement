/**Gestión de Reservas de Hotel Luchadores
 Descripción: Desarrolla un sistema para gestionar reservas de hotel para Goku y sus amigos.
*/

/**
 Modela las estructuras: Client (cliente), Reservation (reserva) y ReservationError
 (errores de la reserva).
 */

// Estructura Cliente

struct Client: Equatable, Hashable {
    
    let name: String
    let age: Int
    let height: Double
    
}

let Goku = Client(name: "Goku", age: 45, height: 1.95)
Goku.name
Goku.age
Goku.height
let Vegeta = Client(name: "Vegeta", age: 48, height: 1.80)

var people: [Any] = []

people.append(Goku)

people.append(Vegeta)

people
