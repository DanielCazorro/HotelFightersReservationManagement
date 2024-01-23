# Hotel-Fighters-Reservation-Management

Este proyecto consiste en un sistema para gestionar reservas de hotel para Goku y sus amigos en el planeta Namek.

## Descripción del proyecto 

El programa principal se encuentra en la rama `Main`, específicamente en el archivo `Contents.swift`, y puede ejecutarse como un playground de Xcode en el archivo `Hotel.playground`.

La aplicación es un sistema básico que gestiona una lista de reservas en la que puedes añadir `(func addReservation)`, cancelar `(func cancelReservation)` y consultar `(func printListOfReservations)` las reservas existentes.

## Estructuras

### Cliente
struct Client {
    let name: String
    let age: Int
    let height: Double
}

### Reserva

struct Reservation {
    var id: Int
    let hotelName: String
    let clientList: [Client]
    let stayInDays: Int
    let price: Double
    let breakfast: Bool
}

### Errores de Reserva

Enumera los posibles errores que pueden ocurrir durante el proceso de reserva.

enum ReservationError: Error {
    case sameID
    case sameClient
    case noReservation
}

## Clase HotelReservationManager

Gestiona las operaciones de reserva y cancelación en el hotel.

### Métodos
- addReservation: Añade una nueva reserva al sistema.
- cancelReservation: Cancela una reserva existente.
- printListOfReservations: Obtiene una lista de todas las reservas actuales.

## Pruebas

Se han incluido pruebas para verificar la funcionalidad del sistema, como la adición de reservas, la cancelación y la consistencia en los precios.

// Crear una instancia del gestor de reservas
let hotelManager = HotelReservationManager()

// Crear clientes
let Goku = Client(name: "Goku", age: 42, height: 1.75)
let Vegeta = Client(name: "Vegeta", age: 46, height: 1.64)

// Añadir reservas
let reservation1 = try hotelManager.addReservation(clientList: [Goku], stayInDays: 3, breakfast: true)
let reservation2 = try hotelManager.addReservation(clientList: [Vegeta], stayInDays: 4, breakfast: false)

// Cancelar reserva
try hotelManager.cancelReservation(reservationIdToRemove: 1)

// Realizar pruebas
testAddReservation()
testCancelReservation()
testReservationPrice()

// Imprimir lista de reservas
hotelManager.printListOfReservations()

## Contribuciones

Si encuentras algún problema o tienes sugerencias de mejora, ¡no dudes en abrir un problema o enviar una solicitud de extracción!
