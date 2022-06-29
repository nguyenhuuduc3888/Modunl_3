package reponsive;

import models.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void create(Product product);

    void edit(int id, Product product);

    void delete(int id);

    List<Product> findByName(String name);

    Product findById(int id);
}
