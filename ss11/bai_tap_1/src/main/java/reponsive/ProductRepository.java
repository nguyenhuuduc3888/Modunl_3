package reponsive;

import models.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {

    private static Map<Integer, Product> products = new HashMap<>();

    static {
        Product product = new Product(1, "Nokia", 2000, 20, "USA");
        Product product1 = new Product(2, "Iphone", 2000, 20, "Apple");
        Product product2 = new Product(3, "Xiaomi", 2000, 20, "China");
        products.put(product.getId(), product);
        products.put(product1.getId(), product1);
        products.put(product2.getId(), product2);
    }


    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void create(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void edit(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products=new ArrayList<>();
        for (Product item: findAll()) {
            if(item.getName().contains(name)){
                products.add(item);
            }
        }
        return products;
    }


    @Override
    public Product findById(int id) {
        return products.get(id);
    }
}
