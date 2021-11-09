package service;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImp implements CustomerService {
    private static List<Customer> customers;

    static {
        customers = new ArrayList<>();
        customers.add(new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customers.add(new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customers.add(new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customers.add(new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customers.add(new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers);
    }

    @Override
    public void save(Customer customer) {
        customers.add(customer);
    }

    @Override
    public Customer findById(int id) {
        for (Customer c : customers
             ) {
            if (c.getId() == id) {
                return c;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Customer customer) {
        for (Customer c : customers
             ) {
            if (c.getId() == id) {
                c.setName(customer.getName());
                c.setEmail(customer.getEmail());
                c.setAddress(c.getAddress());
            }
        }
    }

    @Override
    public void remove(int id) {
        customers.removeIf(c -> c.getId() == id);
    }
}
