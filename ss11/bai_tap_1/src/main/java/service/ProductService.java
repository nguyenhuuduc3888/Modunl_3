package service;

import models.Product;
import reponsive.IProductRepository;
import reponsive.ProductRepository;

import java.util.List;


public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void create(Product product) {
        productRepository.create(product);

    }

    @Override
    public void edit(int id, Product product) {
        productRepository.edit(id, product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);

    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
}
