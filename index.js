import fs from "fs";
import products from "./data/products_master.js";
import generateData from "./javascript/generate-data/generateProductData.js";
import generateSQLInsertProducts from "./javascript/generate-sql/generateSQLScript_InsertProducts.js";
import { fillInBranchName } from "./javascript/generate-data/fillInBranchName.js";
import generateInsertBranches from './javascript/generate-sql/generateSQLScript_InsertBranches.js';

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

console.log("Data đã được ghi vào file result.txt");
