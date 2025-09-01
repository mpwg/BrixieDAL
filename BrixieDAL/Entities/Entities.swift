
import Foundation
import GRDB

// Generated GRDB entities for Brix.sqlite
// Each struct maps to a table in the database and conforms to
// Codable + FetchableRecord + PersistableRecord so it can be used
// with GRDB high-level APIs.

// MARK: - Inventories
public struct Inventory: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
	public static let databaseTableName = "inventories"

	public var id: Int64?
	public var version: Int64?
	public var setNum: String?

	enum CodingKeys: String, CodingKey {
		case id, version
		case setNum = "set_num"
	}

	enum Columns {
		static let id = Column("id")
		static let version = Column("version")
		static let setNum = Column("set_num")
	}

	// Primary key
	public static var primaryKey: [String] { ["id"] }

	// Capture inserted rowID
	public mutating func didInsert(with rowID: Int64, for column: String?) {
		self.id = rowID
	}
}

// MARK: - Inventory Minifigs
public struct InventoryMinifig: Codable, FetchableRecord, PersistableRecord, TableRecord {
	public static let databaseTableName = "inventory_minifigs"

	public var inventoryId: Int64?
	public var figNum: String?
	public var quantity: Int64?

	enum CodingKeys: String, CodingKey {
		case inventoryId = "inventory_id"
		case figNum = "fig_num"
		case quantity
	}

	enum Columns {
		static let inventoryId = Column("inventory_id")
		static let figNum = Column("fig_num")
		static let quantity = Column("quantity")
	}
}

// MARK: - Inventory Parts
public struct InventoryPart: Codable, FetchableRecord, PersistableRecord, TableRecord {
	public static let databaseTableName = "inventory_parts"

	public var inventoryId: Int64?
	public var partNum: String?
	public var colorId: Int64?
	public var quantity: Int64?
	public var isSpare: String?
	public var imgUrl: String?

	enum CodingKeys: String, CodingKey {
		case inventoryId = "inventory_id"
		case partNum = "part_num"
		case colorId = "color_id"
		case quantity
		case isSpare = "is_spare"
		case imgUrl = "img_url"
	}

	enum Columns {
		static let inventoryId = Column("inventory_id")
		static let partNum = Column("part_num")
		static let colorId = Column("color_id")
		static let quantity = Column("quantity")
		static let isSpare = Column("is_spare")
		static let imgUrl = Column("img_url")
	}
}

// MARK: - Inventory Sets
public struct InventorySet: Codable, FetchableRecord, PersistableRecord, TableRecord {
	public static let databaseTableName = "inventory_sets"

	public var inventoryId: Int64?
	public var setNum: String?
	public var quantity: Int64?

	enum CodingKeys: String, CodingKey {
		case inventoryId = "inventory_id"
		case setNum = "set_num"
		case quantity
	}

	enum Columns {
		static let inventoryId = Column("inventory_id")
		static let setNum = Column("set_num")
		static let quantity = Column("quantity")
	}
}

// MARK: - Minifigs
public struct Minifig: Codable, FetchableRecord, PersistableRecord, TableRecord {
	public static let databaseTableName = "minifigs"

	public var figNum: String?
	public var name: String?
	public var numParts: Int64?
	public var imgUrl: String?

	enum CodingKeys: String, CodingKey {
		case figNum = "fig_num"
		case name
		case numParts = "num_parts"
		case imgUrl = "img_url"
	}

	enum Columns {
		static let figNum = Column("fig_num")
		static let name = Column("name")
		static let numParts = Column("num_parts")
		static let imgUrl = Column("img_url")
	}
}

// MARK: - Part Categories
public struct PartCategory: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
	public static let databaseTableName = "part_categories"

	public var id: Int64?
	public var name: String?

	enum CodingKeys: String, CodingKey {
		case id, name
	}

	enum Columns {
		static let id = Column("id")
		static let name = Column("name")
	}

	// Primary key
	public static var primaryKey: [String] { ["id"] }

	public mutating func didInsert(with rowID: Int64, for column: String?) {
		self.id = rowID
	}
}

// MARK: - Part Relationships
public struct PartRelationship: Codable, FetchableRecord, PersistableRecord, TableRecord {
	public static let databaseTableName = "part_relationships"

	public var relType: String?
	public var childPartNum: String?
	public var parentPartNum: String?

	enum CodingKeys: String, CodingKey {
		case relType = "rel_type"
		case childPartNum = "child_part_num"
		case parentPartNum = "parent_part_num"
	}

	enum Columns {
		static let relType = Column("rel_type")
		static let childPartNum = Column("child_part_num")
		static let parentPartNum = Column("parent_part_num")
	}
}

// MARK: - Parts
public struct Part: Codable, FetchableRecord, PersistableRecord, TableRecord {
	public static let databaseTableName = "parts"

	public var partNum: String?
	public var name: String?
	public var partCatId: Int64?
	public var partMaterial: String?

	enum CodingKeys: String, CodingKey {
		case partNum = "part_num"
		case name
		case partCatId = "part_cat_id"
		case partMaterial = "part_material"
	}

	enum Columns {
		static let partNum = Column("part_num")
		static let name = Column("name")
		static let partCatId = Column("part_cat_id")
		static let partMaterial = Column("part_material")
	}
}

// MARK: - Elements
public struct Element: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
	public static let databaseTableName = "elements"

	public var elementId: Int64?
	public var partNum: String?
	public var colorId: Int64?
	public var designId: Int64?

	enum CodingKeys: String, CodingKey {
		case elementId = "element_id"
		case partNum = "part_num"
		case colorId = "color_id"
		case designId = "design_id"
	}

	enum Columns {
		static let elementId = Column("element_id")
		static let partNum = Column("part_num")
		static let colorId = Column("color_id")
		static let designId = Column("design_id")
	}

	// Primary key
	public static var primaryKey: [String] { ["element_id"] }

	public mutating func didInsert(with rowID: Int64, for column: String?) {
		self.elementId = rowID
	}

}

// MARK: - Colors
public struct Color: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
	public static let databaseTableName = "colors"

	public var id: Int64?
	public var name: String?
	public var rgb: String?
	public var isTrans: String?
	public var numParts: Int64?
	public var numSets: Int64?
	public var y1: Int64?
	public var y2: Int64?

	enum CodingKeys: String, CodingKey {
		case id, name, rgb
		case isTrans = "is_trans"
		case numParts = "num_parts"
		case numSets = "num_sets"
		case y1, y2
	}

	enum Columns {
		static let id = Column("id")
		static let name = Column("name")
		static let rgb = Column("rgb")
		static let isTrans = Column("is_trans")
		static let numParts = Column("num_parts")
		static let numSets = Column("num_sets")
		static let y1 = Column("y1")
		static let y2 = Column("y2")
	}

	// Primary key
	public static var primaryKey: [String] { ["id"] }
    
	public mutating func didInsert(with rowID: Int64, for column: String?) {
		self.id = rowID
	}
}

// MARK: - Sets (named LegoSet to avoid collision with Swift.Set)
public struct LegoSet: Codable, FetchableRecord, PersistableRecord, TableRecord {
	public static let databaseTableName = "sets"

	public var setNum: String?
	public var name: String?
	public var year: Int64?
	public var themeId: Int64?
	public var numParts: Int64?
	public var imgUrl: String?

	enum CodingKeys: String, CodingKey {
		case setNum = "set_num"
		case name, year
		case themeId = "theme_id"
		case numParts = "num_parts"
		case imgUrl = "img_url"
	}

	enum Columns {
		static let setNum = Column("set_num")
		static let name = Column("name")
		static let year = Column("year")
		static let themeId = Column("theme_id")
		static let numParts = Column("num_parts")
		static let imgUrl = Column("img_url")
	}

	// Primary key
	public static var primaryKey: [String] { ["set_num"] }
}

// MARK: - Themes
public struct Theme: Codable, FetchableRecord, MutablePersistableRecord, TableRecord {
	public static let databaseTableName = "themes"

	public var id: Int64?
	public var name: String?
	public var parentId: Int64?

	enum CodingKeys: String, CodingKey {
		case id, name
		case parentId = "parent_id"
	}

	enum Columns {
		static let id = Column("id")
		static let name = Column("name")
		static let parentId = Column("parent_id")
	}

	// Primary key
	public static var primaryKey: [String] { ["id"] }
    
	public mutating func didInsert(with rowID: Int64, for column: String?) {
		self.id = rowID
	}
}

// MARK: - Database helper
public enum BrixDatabase {
	/// Opens the database at the given path.
	/// By default this uses the project's db path, but callers can provide
	/// another path for tests or other environments.
	public static func openQueue(at path: String = "/Users/mat/code/BrixieDAL/BrixieDAL/db/Brix.sqlite") throws -> DatabaseQueue {
		return try DatabaseQueue(path: path)
	}
}
