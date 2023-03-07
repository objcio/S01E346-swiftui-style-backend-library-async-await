import XCTest
import Backend

struct Profile: Rule {
    var id: Int
    func rules() -> some Rule {
        "User Profile \(id)"
    }
}

struct Users: Rule {
    func rules() -> some Rule {
        PathReader { comp in
            if let id = Int(comp) {
                Profile(id: id)
            } else {
                "Not found"
            }
        }
        "User Index"
    }
}

struct Root: Rule {
    func rules() -> some Rule {
        Users().path("users")
        "Index"
    }
}

final class BackendTests: XCTestCase {
    func testUsers() throws {
//        XCTAssertEqual(Users().run(environment: .init(request: .init(path: "/"))), Response(body: "User Index".toData))
//
//        XCTAssertEqual(Root().run(environment: .init(request: .init(path: "/"))), Response(body: "Index".toData))
//
//        XCTAssertEqual(Root().run(environment: .init(request: .init(path: "/users"))), Response(body: "User Index".toData))
//
//        XCTAssertEqual(Root().run(environment: .init(request: .init(path: "/users/1"))), Response(body: "User Profile 1".toData))
//
//        XCTAssertEqual(Root().run(environment: .init(request: .init(path: "/users/foo"))), Response(body: "Not found".toData))
    }
}
