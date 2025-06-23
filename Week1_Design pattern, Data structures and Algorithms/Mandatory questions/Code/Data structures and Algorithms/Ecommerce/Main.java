public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Shoes", "Fashion"),
            new Product(3, "Keyboard", "Electronics"),
            new Product(4, "Chair", "Furniture")
        };

        System.out.println("Linear Search:");
        Product p1 = Search.linearSearch(products, "Keyboard");
        System.out.println(p1 != null ? p1 : "Not found");

        Search.sortProducts(products);

        System.out.println("Binary Search:");
        Product p2 = Search.binarySearch(products, "Keyboard");
        System.out.println(p2 != null ? p2 : "Not found");
    }
}
