package repository;

import models.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static final Map<Integer, Product> productMap = new HashMap<Integer, Product>();
    static {
        Product product = new Product(1, "Nokia", 2000, 20, "USA");
        Product product1 = new Product(2, "Iphone", 2000, 20, "Apple");
        Product product2 = new Product(3, "Xiaomi", 2000, 20, "China");
        productMap.put(product.getId(), product);
        productMap.put(product1.getId(), product1);
        productMap.put(product2.getId(), product2);
    }


    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public void update() {

    }

    @Override
    public void delete() {

    }

    @Override
    public List<Product> search(String name) {
        return null;
    }

    @Override
    public Product findById(int id) {
        return null;
    }
}
