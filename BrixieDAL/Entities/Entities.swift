import Foundation
internal import GRDB

struct Color: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
    static let databaseTableName = "colors"

    var id: Int64?
    let name: String
    let rgb: String
    let isTrans: String
    let numParts: Int
    let numSets: Int
    let y1: Int
    let y2: Int

    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}

struct Element: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
    static let databaseTableName = "elements"

    var elementId: Int64?
    let partNum: String
    let colorId: Int64
    let designId: Int

    mutating func didInsert(_ inserted: InsertionSuccess) {
        elementId = inserted.rowID
    }
}

struct Inventory: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
    static let databaseTableName = "inventory"

    var id: Int64?
    let version: Int
    let setNum: String

    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}

struct InventoryMinifig: Codable, FetchableRecord, PersistableRecord, TableRecord {
    static let databaseTableName = "inventory_minifigs"

    let inventoryId: Int64
    let figNum: String
    let quantity: Int
}

struct InventoryPart: Codable, FetchableRecord, PersistableRecord, TableRecord {
    static let databaseTableName = "inventory_parts"

    let inventoryId: Int64
    let partNum: String
    let colorId: Int64
    let quantity: Int
    let isSpare: String
    let imgUrl: String
}

struct InventorySet: Codable, FetchableRecord, PersistableRecord, TableRecord {
    static let databaseTableName = "inventory_sets"

    let inventoryId: Int64
    let setNum: String
    let quantity: Int
}

struct Minifig: Codable, FetchableRecord, PersistableRecord, TableRecord {
    static let databaseTableName = "minifigs"

    let figNum: String
    let name: String
    let numParts: Int
    let imgUrl: String
}

struct PartCategory: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
    static let databaseTableName = "part_categories"

    var id: Int64?
    let name: String

    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}

struct PartRelationship: Codable, FetchableRecord, PersistableRecord, TableRecord {
    static let databaseTableName = "part_relationships"

    let relType: String
    let childPartNum: String
    let parentPartNum: String
}

struct Part: Codable, FetchableRecord, PersistableRecord, TableRecord {
    static let databaseTableName = "parts"

    let partNum: String
    let name: String
    let partCatId: Int64
    let partMaterial: String
}

struct Set: Codable, FetchableRecord, PersistableRecord, TableRecord {
    static let databaseTableName = "sets"

    let setNum: String
    let name: String
    let year: Int
    let themeId: Int64
    let numParts: Int
    let imgUrl: String
}

struct Theme: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
    static let databaseTableName = "themes"

    var id: Int64?
    let name: String
    let parentId: Int64

    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
}
