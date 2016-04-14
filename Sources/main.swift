import Foundation

extension String {
    func replace(a: Character, with: Character) -> String {
        let replaced = String(self.characters.split(separator: a)
        .joined(separator: [with]))
        return replaced
    }
}

class AAMain {
    func run() {
        // The first element is the application name, which we don't care about in
        // this case.
        let args = Array(Process.arguments.dropFirst())
        guard args.count > 0 else {
            print("Please supply strings to be used for the name")
            return
        }

        print(AAMain.rename(withArguments: args))
    }

    static func rename(withArguments args: [String]) -> String {
        //TODO: support suffix argument
        var name = ""
        for x in args { name += x }
        return AAMain.rename(name: name)
    }

    static func rename(name: String, ofType suffix: String = "md") -> String {
        var renamed = name

        if name.contains(" ") {
            renamed = name.replace(a: " ", with: "-")
        }
        if suffix.contains(".") {
            return "\(renamed)\(suffix)"
        }
        return "\(renamed).\(suffix)"
    }
}

let a = AAMain()
a.run()
