import Cocoa

// The workflow defaults
let currency = "USD"
var from = "GCM"
var to = "MIA"

if CommandLine.arguments.count == 2 {
    let arguments = CommandLine
        .arguments[1]
        .components(separatedBy: " ")

    switch arguments.count {
    case 1:
        let args = arguments[0]
        if args.contains(",") {
            let splitArgs = args.components(separatedBy: ",")
            from = splitArgs[0]
            to = splitArgs[1]
        } else {
            to = args
        }

    case 2:
        from = arguments[0]
        to = arguments[1]

    default:
        break
    }
}

var components = URLComponents()
components.scheme = "https"
components.host = "google.com"
components.path = "/travel/flights"
components.queryItems = [
    URLQueryItem(name: "curr", value: currency),
    URLQueryItem(name: "q", value: "Flights to \(to) from \(from)")
]

if let url = components.url {
    NSWorkspace.shared.open(url)
}
