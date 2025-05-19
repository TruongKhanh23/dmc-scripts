#!/bin/bash

echo "🔍 Bắt đầu kiểm tra các import..."

ERRORS=0

# Tìm tất cả các file có thể chứa import
find . -type f \( -name "*.vue" -o -name "*.ts" -o -name "*.js" \) | while read -r file; do
  grep -E "from\s+['\"](\.|\.\.)/" "$file" | while read -r line; do
    # Tách ra đường dẫn import
    IMPORT_PATH=$(echo "$line" | sed -nE "s/.*from\s+['\"]([^'\"]+)['\"].*/\1/p")

    # Bỏ qua nếu không phải đường dẫn tương đối
    if [[ "$IMPORT_PATH" != .* ]]; then
      continue
    fi

    # Tính đường dẫn file thật dựa vào file hiện tại
    DIR=$(dirname "$file")
    FULL_PATH="$DIR/$IMPORT_PATH"

    # Dùng glob để kiểm tra các phần mở rộng phổ biến
    FOUND=0
    for ext in .ts .js .vue .json .tsx .jsx /index.ts /index.js /index.vue; do
      if [ -f "$FULL_PATH$ext" ]; then
        FOUND=1
        break
      fi
    done

    if [ "$FOUND" -eq 0 ]; then
      echo "❌ Import không tồn tại hoặc sai tên (case-sensitive):"
      echo "  📄 File: $file"
      echo "  🧩 Import: $IMPORT_PATH"
      ERRORS=$((ERRORS + 1))
    fi
  done
done

if [ "$ERRORS" -eq 0 ]; then
  echo "✅ Tất cả import đều hợp lệ."
else
  echo "⚠️ Tổng số lỗi: $ERRORS"
  exit 1
fi
