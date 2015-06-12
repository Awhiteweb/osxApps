import Foundation

struct Video {
    let id: Int
    let title: String
    let location: String
    var genre: String
    var group: String
    var episode: Int
    var season: Int
}

    let titles = [ String ]( arrayLiteral: "video", "id", "title", "location", "genre", "group", "episode", "season" )
    var videos = [Int: Video]()
    var element: String = ""
    var stringBuilder: String = ""
    var vId:Int = 0
    var vTitle: String = ""
    var vLocation: String = ""
    var vGenre: String = ""
    var vGroup: String = ""
    var vEpisode: Int = 0
    var vSeason: Int = 0
    var parser: NSXMLParser
    
    parser = NSXMLParser( contentsOfURL: NSURL(string: "http://localhost/~Alex/database.php") )!
    parser.parse()

    
    // start of element
    func parser( parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject] )
    {
        element = elementName
    }
    
    // string builder on element
    func parser(parser: NSXMLParser, foundCharacters string: String?)
    {
        switch element
        {
        case "id","title","location","genre","group","episode","season":
            stringBuilder += string!
        default:
            break
        }
    }
    
    // end of element
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        switch element
        {
        case "video":
            let video = Video( id: vId, title: vTitle, location: vLocation, genre: vGenre, group: vGroup, episode: vEpisode, season: vSeason )
            videos[vId] = video
        case "id":
            vId = stringBuilder.toInt()!
        case "title":
            vTitle = stringBuilder
        case "location":
            vLocation = stringBuilder
        case "genre":
            vGenre = stringBuilder
        case "group":
            vGroup = stringBuilder
        case "episode":
            if count(stringBuilder) < 1
            {
                vEpisode = 0
            }
            else
            {
                vEpisode = stringBuilder.toInt()!
            }
        case "season":
            if count(stringBuilder) < 1
            {
                vSeason = 0
            }
            else
            {
                vSeason = stringBuilder.toInt()!
            }
        default:
            break
        }
        stringBuilder = ""
        element = ""
    }