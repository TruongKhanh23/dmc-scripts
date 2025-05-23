import fs from "fs";
import products from "./data/products_master.js";
import generateData from "./javascript/generate-data/generateProductData.js";
import generateSQLInsertProducts from "./javascript/generate-sql/generateSQLScript_InsertProducts.js";
import { fillInBranchName } from "./javascript/generate-data/fillInBranchName.js";
import generateInsertBranches from "./javascript/generate-sql/generateSQLScript_InsertBranches.js";
import { analyseRawInventories } from "./javascript/analyseRawInventories.js";
import extractUniqueUnits from "./javascript/extractUniqueUnits.js"
import inventories from "./data/inventories.js";
import generateUnits from "./javascript/generate-data/generateUnits.js";
import units from "./data/units.js"
import generateSQLInsertUnit from "./javascript/generate-sql/generateSQLScript_InsertUnits.js"
import generateSQLInsertInventories from "./javascript/generate-sql/generateSQLSript_InsertInventories.js"

// ---------------- Generate SQL Script - Insert Products ----------------
// const data = generateData(products);
// const sql = generateSQLInsertProducts(data);
// fs.writeFileSync("result.txt", sql, "utf8");

// ---------------- Generate Product Data Input for Generate Script Insert Products ----------------
// const data = generateData(products);
// fs.writeFileSync("result.txt", JSON.stringify(data, null, 2), "utf8");

// ---------------- Fill In Branch Name ----------------
// const data = fillInBranchName();
// fs.writeFileSync("result.txt", JSON.stringify(data, null, 2), "utf8");

// ---------------- Generate SQL Script - Insert Branches ----------------
// const branches = fillInBranchName();
// const data = generateInsertBranches(branches);
// fs.writeFileSync("result.txt", data, "utf8");

// ---------------- Analyse RawInventories ----------------
// const data = analyseRawInventories();
// fs.writeFileSync("result.txt", JSON.stringify(data, null, 2), "utf8");

// ---------------- Extract unique units ------------------
// const data = extractUniqueUnits(inventories);
// fs.writeFileSync("result.txt", JSON.stringify(data, null, 2), "utf8");

// ---------------- Generate Units ------------------------
// const data = generateUnits();
// fs.writeFileSync("result.txt", JSON.stringify(data, null, 2), "utf8");

// ---------------- Generate SQL Script - Insert Units ------------------------
// const data = generateSQLInsertUnit(units);
// fs.writeFileSync("result.txt", data, "utf8");

// ---------------- Generate SQL Script - Insert Inventories -------------------
const data = generateSQLInsertInventories(inventories);
fs.writeFileSync("result.txt", data, "utf8");

console.log("Data đã được ghi vào file result.txt");
