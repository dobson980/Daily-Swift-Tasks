# Ghibli
A tabbed SwiftUI explorer for Studio Ghibli films, characters, and personalized favorites.

## Overview
**Ghibli** showcases how to coordinate multiple SwiftUI screens with shared view models, async/await networking, and persistent user preferences. It leans heavily on structured concurrency and observable objects so data flows cleanly between the films list, detail view, search tab, and favorites experience.

![ghibli](https://github.com/user-attachments/assets/b57c5651-d93e-4ae2-9d09-548c2eeac2eb)

## Features
- 🔁 **Shared `@Observable` view models** power every tab, eliminating duplicate network calls and keeping favorites in sync.
- 🌐 **Async/await networking** via `GhibliService` abstracts the live API from previews and tests.
- ⌛ **Reusable `LoadState`** enum drives consistent loading, success, and error UIs without boolean soup.
- 🔍 **Debounced film search** demonstrates cooperative cancellation and `Task.sleep`-based throttling.
- 👥 **Parallel character fetching** uses `withThrowingTaskGroup` to load related people fast while surfacing typed errors.
- ❤️ **Favorites persistence** showcases a tiny storage abstraction that can swap between `UserDefaults` and sample data.
- 🧪 **Unit tests** (built with the Swift [Testing](https://github.com/apple/swift-testing) package) validate debouncing, cancellation, and error handling scenarios.

## Code Breakdown
### 🏗️ Centralized film loading
```swift
@Observable
class FilmsViewModel {
    var films: [Film] = []
    var state: LoadState<[Film]> = .idle

    func fetch() async {
        guard !state.isLoading || state.error != nil else { return }
        state = .loading
        films = try await service.fetchFilms()
        state = .loaded(films)
    }
}
```
`FilmsViewModel` is created once in `ContentView` and injected into the Films, Favorites, and Search tabs. The guard statement prevents overlapping requests but still allows retries, and the `LoadState` exposes enough context for SwiftUI to render the proper placeholder.

### 🔍 Debounced search pipeline
```swift
func fetch(for searchTerm: String) async {
    currentSearchTerm = searchTerm
    guard !searchTerm.isEmpty else { state = .idle; return }
    state = .loading

    try? await Task.sleep(for: .milliseconds(500))
    guard !Task.isCancelled else { return }

    do {
        let films = try await service.searchFilm(for: searchTerm)
        state = .loaded(films)
    } catch {
        setError(error, for: searchTerm)
    }
}
```
`SearchFilmsViewModel` showcases cooperative cancellation and debouncing without external dependencies. Every keystroke restarts the `.task(id:)` modifier inside `SearchScreen`, and this method ensures only the latest query updates UI state.

### 👥 Parallel character fetches
```swift
let people = try await withThrowingTaskGroup(of: Person.self) { group in
    for url in film.people {
        group.addTask { try await service.fetchPerson(from: url) }
    }

    var results: [Person] = []
    for try await person in group { results.append(person) }
    return results
}
```
`FilmDetailViewModel` fetches each related character concurrently. Structured concurrency means if any child task throws, the entire group bubbles up a typed `FilmApiError`, so the detail screen can present something friendly instead of partial data.

### 🧰 Persistence abstraction
```swift
protocol FavoritesStorageService {
    func load() -> Set<String>
    func save(favoriteIDs: Set<String>)
}
```
`FavoritesViewModel` depends on this tiny protocol. In production the app uses `DefaultsFavoritesStorageService`, while previews/tests can swap in `SampleDefaultsFavoritesStorageService` for deterministic data.

## Project Structure
| Path | Purpose |
| --- | --- |
| `Ghibli/App/GhibliApp.swift` | App entry point that applies the persisted appearance theme. |
| `Ghibli/Model/` | Codable representations for `Film`, `Person`, `LoadState`, and sample data helpers. |
| `Ghibli/Services/` | Networking (`GhibliApiService`, `SampleFilmService`) and persistence abstractions. |
| `Ghibli/ViewModel/` | `@Observable` classes powering films, favorites, search, and detail flows. |
| `Ghibli/Views/` | SwiftUI screens (Tabs, Films, Search, Favorites, Settings) plus reusable subviews. |
| `GhibliTests/` | Unit tests covering debouncing, cancellation, and load-state transitions. |
| `GhibliUITests/` | Launch and smoke UI tests ready for future automation. |

## Technologies Used
- SwiftUI + Observable macro (`@Observable`)
- Async/Await (`Task`, `withThrowingTaskGroup`, `Task.sleep`)
- `URLSession` networking with typed error handling
- `@AppStorage` and custom view modifiers for appearance overrides
- Swift Testing package for modern async-friendly unit tests

## How to Run
1. Open **Ghibli/Ghibli.xcodeproj** (or the workspace) in Xcode 16+.
2. Select the **Ghibli** scheme and choose an iOS simulator (iPhone 15 Pro works well).
3. Press **Cmd + R** to build & run. The app eagerly loads films, so you can switch between Films, Favorites, Search, and Settings immediately.
4. (Optional) Swap the `GhibliService` injection inside previews with `SampleFilmService` to iterate offline.

## Notes
- Replace the placeholder screenshot above with a real capture from the simulator once available (`Cmd + S` in the Preview window works great).
- The search debounce duration (500ms) is intentionally aggressive to make the asynchronous behavior obvious; tweak `SearchFilmsViewModel.fetch` to experiment with other UX trade-offs.
- Unit tests rely on the Swift Testing package; run them via the **Test** action (Cmd + U) to quickly validate debouncing logic.

---
🚀 *Part of the Daily Swift Tasks learning journey!*
