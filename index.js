//import data from "./data/products_hethongchung.js";
import products from "./data/products_master.js";
import generateData from "./javascript/generate-data/generateProductData.js";
import fs from "fs";
import generateSQLInsertProducts from "./javascript/generate-sql/generateSQLScript_InsertProducts.js";

const data = generateData(products);

// Gọi hàm để generate SQL
const sql = generateSQLInsertProducts(data);

fs.writeFileSync("result.txt", sql, "utf8");

//fs.writeFileSync("result.txt", JSON.stringify(data, null, 2), "utf8");

console.log("Data đã được ghi vào file result.txt");
