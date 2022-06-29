package repository;

import models.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void add(Product product);

    void update();

    void delete();

    List<Product> search(String name);

    Product findById(int id);
}
