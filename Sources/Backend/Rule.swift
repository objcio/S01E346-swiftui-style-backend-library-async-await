import Foundation

public protocol Rule {
    associatedtype R: Rule
    @RuleBuilder func rules() async throws -> R
}

protocol BuiltinRule {
    func execute(environment: EnvironmentValues) async throws -> Response?
}

extension BuiltinRule {
    public func rules() -> Never {
        fatalError()
    }
}

extension Rule {
    public func run(environment: EnvironmentValues) async throws -> Response? {
        if let b = self as? BuiltinRule {
            return try await b.execute(environment: environment)
        }
        let m = Mirror(reflecting: self)
        for child in m.children {
            guard let p = child.value as? DynamicProperty else { continue }
            p.install(environment)
        }
        return try await rules().run(environment: environment)
    }
}

extension Never: Rule {
    public func rules() -> some Rule {
        fatalError()
    }
}

extension Response: Rule, BuiltinRule {
    func execute(environment: EnvironmentValues) -> Response? {
        return self
    }
}

public protocol ToData {
    var toData: Data { get }
}

extension String: ToData {
    public var toData: Data {
        data(using: .utf8)!
    }
}

