import Foundation

extension Rule {
    public func path(_ component: String) -> some Rule {
        Path(expectedPathComponent: component, content: self)
    }
}

struct Path<Content: Rule>: BuiltinRule, Rule {
    var expectedPathComponent: String
    var content: Content

    func execute(environment: EnvironmentValues) async throws -> Response? {
        guard let c = environment.remainingPath.first, c == expectedPathComponent else { return nil }
        var copy = environment
        copy.remainingPath.removeFirst()
        return try await content.run(environment: copy)
    }
}
