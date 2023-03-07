import XCTest
import Backend

struct GreetingKey: EnvironmentKey {
    static var defaultValue: String = "Hello"
}

extension EnvironmentValues {
    var greeting: String {
        get { self[GreetingKey.self] }
        set { self[GreetingKey.self] = newValue }
    }
}

struct Greeting: Rule {
    @Environment(\.greeting) var greeting
    func rules() -> some Rule {
        greeting
    }
}

struct Home: Rule {
    func rules() -> some Rule {
        Greeting().path("greeting")
    }
}

final class EnvironmentTests: XCTestCase {
    func testUsers() throws {
//        XCTAssertEqual(try await Greeting().run(environment: .init(request: .init(path: "/"))), Response(body: "Hello".toData))
//
//        let rule = Greeting().environment(\.greeting, "Overridden")
//        XCTAssertEqual(try await rule.run(environment: .init(request: .init(path: "/"))), Response(body: "Overridden".toData))
//
//        let rule2 = Home().environment(\.greeting, "Overridden")
//        XCTAssertEqual(try await rule2.run(environment: .init(request: .init(path: "/greeting"))), Response(body: "Overridden".toData))

    }
}
