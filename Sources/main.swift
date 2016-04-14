import Foundation
import String

extension String {
    func replace(a: Character, with: Character) -> String {
        let replaced = String(self.characters.split(separator: a)
            .joined(separator: [with]))
        return replaced
    }
    
    
}

class AAMain {
    func run() {
        let args = Process.arguments
        guard args.count > 1 else {
            print("Please supply strings to be used for the name")
            return
        }
        print(AAMain.use(arguments: args))
    }
    
    // Used some code from: https://github.com/apple/swift-corelibs-foundation/blob/master/Tools/plutil/main.swift#L68
    static func parse(arguments args: [String]) -> (name: String, suffix: String){
        var name = ""
        var suffix = ""
        var iterator = args.makeIterator()
        while let arg = iterator.next() {
            
            if arg == "--suffix" || arg.contains("--suffix") {
                suffix += arg
            } else {
                name += "\(arg)"
            }
            
        }        
        suffix.replace(string: "--suffix", with: "")
        suffix = suffix.trimmingCharacters(in: .whitespacesAndNewlines())
        return (name, suffix)
    }
    
    
    static func use(arguments argv: [String]) -> String {
        // The first element is the application name, which we don't care about in
        // this case.
        let args = Array(argv.dropFirst())
        let input = AAMain.parse(arguments: args)
        return AAMain.rename(name: input.name, ofType: input.suffix)
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
