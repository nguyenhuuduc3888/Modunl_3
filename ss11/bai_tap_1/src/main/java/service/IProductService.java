package service;

import models.Product;
import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void create(Product product);

    void edit(int id, Product product);

    void delete(int id);

    List<Product> findByName(String name);

    Product findById(int id);
}
