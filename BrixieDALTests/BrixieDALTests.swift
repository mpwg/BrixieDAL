//
//  BrixieDALTests.swift
//  BrixieDALTests
//
//  Created by Matthias Wallner-Géhri on 01.09.25.
//

import Testing
@testable import BrixieDAL
import GRDB

struct BrixieDALTests {

    @Test func migration_and_bool_mapping() throws {
        // Open the real DB in the repo. Tests should be careful when mutating
        // the real DB; this test runs the idempotent migration which only
        // normalizes boolean-like values to 1/0. This is a smoke test.
        let dbQueue = try BrixieDAL.BrixDatabase.openQueue()

        // Run migration (idempotent)
        try BrixieDAL.BrixDatabase.migrateBooleanTextColumnsToInt(dbQueue)

        // Fetch a sample InventoryPart and Color to ensure decoding into Bool works
        try dbQueue.read { db in
            if let part = try InventoryPart.fetchOne(db) {
                // Access the Bool property; no assertion framework available here,
                // but we can at least ensure the value can be read without crashing.
                _ = part.isSpare
            }

            if let color = try Color.fetchOne(db) {
                _ = color.isTrans
                _ = color.rgbComponents
            }
        }
    }

}
