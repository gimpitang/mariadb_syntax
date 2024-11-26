# 200번 반복하면서 재고 확인 및 감소
for i in {1..200}; do
    quantity=$(redis-cli -h localhost -p 6379 get apple:1:quantity)
    if [ "$quantity" -lt 1 ]; then
        echo "stock is inavailable: $quantity"
        break;
    fi
    # 재고감소
    redis-cli -h localhost -p 6379 decr apple:1:quantity
    echo "stock : $quantity"
done