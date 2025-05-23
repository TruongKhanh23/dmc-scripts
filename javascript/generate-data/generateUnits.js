import shopUnits from "../../data/shopUnits.js";
import commonUnits from "../../data/commonUnits.js";

// Helper: kiểm tra shopUnit chỉ chứa ký tự từ commonUnitName
function onlyContainsChars(source, allowed) {
  const sourceChars = source.toLowerCase().split('');
  const allowedSet = new Set(allowed.toLowerCase().split(''));
  return sourceChars.every(ch => allowedSet.has(ch));
}

function containsOrderedChars(target, pattern) {
  let index = 0;
  const lowerTarget = target.toLowerCase();
  for (const char of pattern.toLowerCase()) {
    index = lowerTarget.indexOf(char, index);
    if (index === -1) return false;
    index++;
  }
  return true;
}

export default function generateUnits() {
  return shopUnits.map(shopUnit => {
    const lowerShop = shopUnit.toLowerCase();

    const matched = commonUnits.filter(commonUnit => {
      const symbol = commonUnit.symbol.toLowerCase();
      const name = commonUnit.name.toLowerCase();

      const orderedSymbol = containsOrderedChars(lowerShop, symbol);
      const onlyValidChars = onlyContainsChars(lowerShop, name);

      return orderedSymbol && onlyValidChars;
    });

    if (matched.length > 0) {
      const preferred = matched.find(u => u.symbol.toLowerCase() !== 'l') || matched[0];
      return {
        name: shopUnit.toLowerCase(),
        symbol: preferred.symbol.toLowerCase()
      };
    } else {
      return {
        name: shopUnit.toLowerCase(),
        symbol: shopUnit.toLowerCase()
      };
    }
  });
}