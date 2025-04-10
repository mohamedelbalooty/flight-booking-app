✈️ Flight Booking App

A Flutter application that allows users to search for flights, view available options, and book a flight. Built using Clean Architecture, Bloc, and Dio for API integration.

## 📱 Screenshots

| Search Flight | Available Flights | Booking |
|---------------|-------------------|---------|
| ![Search](screenshots/search.png) | ![Flights](screenshots/flights.png) | ![Booking](screenshots/booking.png) |

---


---

## 🚀 Features

- **Search Flight:** Select departure, destination, and date.
- **Flight Results:** View available flights with airline, number, time, and price.
- **Booking Page:** Confirm selected flight and enter passenger details.
- **Error & Empty States:** Proper feedback for no results or failed API calls.
- **Clean Architecture:** Applied with separation of concerns (Data, Domain, Presentation).
- **State Management:** Using BLoC & Cubit.
- **Localization:** Supports Easy Localization.
- **Dependency Injection:** Using `get_it`.
- **Testing:**
    - ✅ Unit tests (repository, datasource)
    - ✅ Cubit test
    - ✅ Widget tests (reusable components)
    - ✅ API calls mocked using `http_mock_adapter`

---

## 📦 Project Structure

```bash
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── navigation/
│   └── utils/
├── features/
│   └── booking_flight/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── service_locator.dart
└── main.dart
```

---
## 🧪 Testing

### ✅ What’s covered?

- flight_data_source_test.dart – API service logic
- flights_repository_impl_test.dart – Repository logic
- available_flights_cubit_test.dart – Bloc behavior
- search_flight_page_test.dart – UI widget test

Shared widget tests (e.g., flight_card_widget_test.dart)

✅ Note: http_mock_adapter is used to mock API responses for testing.

⚠️ API Note for Reviewers

Due to the mock API not working currently, the app uses a temporary method:

getSearchedFlightsLocal(); // Mocked data returned after delay

API logic is implemented and tested using http_mock_adapter

You can switch to getSearchedFlights() when API becomes available

This still fulfills the task requirement to show state management and API integration readiness

📅 Date Format for API

To call the API, use the format: yyyy-MM-dd

DateFormat('yyyy-MM-dd').format(selectedDate);

## 📧 Note to Reviewer

I previously asked about UI scope, but after reading the requirement again, I realized the expectations are clear. I have implemented:

Full UI for all required screens

API call logic (even if mocked)

All layers with test coverage

Thank you 🙏

