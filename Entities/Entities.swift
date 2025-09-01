import Foundation

struct Color {
    let id: Int
    let name: String
    let rgb: String
    let isTrans: String
    let numParts: Int
    let numSets: Int
    let y1: Int
    let y2: Int
}

struct Element {
    let elementId: Int
    let partNum: String
    let colorId: Int
    let designId: Int
}

struct Inventory {
    let id: Int
    let version: Int
    let setNum: String
}

struct InventoryMinifig {
    let inventoryId: Int
    let figNum: String
    let quantity: Int
}

struct InventoryPart {
    let inventoryId: Int
    let partNum: String
    let colorId: Int
    let quantity: Int
    let isSpare: String
    let imgUrl: String
}

struct InventorySet {
    let inventoryId: Int
    let setNum: String
    let quantity: Int
}

struct Minifig {
    let figNum: String
    let name: String
    let numParts: Int
    let imgUrl: String
}

struct PartCategory {
    let id: Int
    let name: String
}

struct PartRelationship {
    let relType: String
    let childPartNum: String
    let parentPartNum: String
}

struct Part {
    let partNum: String
    let name: String
    let partCatId: Int
    let partMaterial: String
}

struct Set {
    let setNum: String
    let name: String
    let year: Int
    let themeId: Int
    let numParts: Int
    let imgUrl: String
}

struct Theme {
    let id: Int
    let name: String
    let parentId: Int
}
