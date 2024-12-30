import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  List<Map<String, dynamic>> products = [
    {'productName': 'Product 1', 'quantity': 1, 'price': 10.0},
    {'productName': 'Product 2', 'quantity': 1, 'price': 15.0},
    {'productName': 'Product 3', 'quantity': 1, 'price': 12.5},
  ];

  void _increaseQuantity(int index) {
    setState(() {
      products[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (products[index]['quantity'] > 1) {
        products[index]['quantity']--;
      }
    });
  }

  void _updateProductName(int index, String value) {
    setState(() {
      products[index]['productName'] = value;
    });
  }

  double _calculateTotal() {
    double total = 0;
    for (var product in products) {
      total += product['quantity'] * product['price'];
    }
    return total;
  }

  // Add new product
  void _addNewProduct() {
    if (products.length < 5) {  // Maximum 5 products can be added
      setState(() {
        products.add({
          'productName': 'New Product',
          'quantity': 1,
          'price': 20.0, // Default price
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sales Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Customer Information"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Name (Editable)
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            String? newName = await _showProductNameDialog(context, products[index]['productName']);
                            if (newName != null && newName.isNotEmpty) {
                              _updateProductName(index, newName);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.green,
                            child: Text(
                              products[index]['productName'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Quantity Adjust (Increase/Decrease)
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => _decreaseQuantity(index),
                          ),
                          Text(products[index]['quantity'].toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => _increaseQuantity(index),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      // Price
                      Text("\$${products[index]['price'].toStringAsFixed(2)}"),
                    ],
                  );
                },
              ),
            ),
            Divider(),
            // Total Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total: \$${_calculateTotal().toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add new product if there's space
                _addNewProduct();
              },
              child: Text("Add New Product"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text("Finalize Sale"),
            ),
          ],
        ),
      ),
    );
  }

  // Show dialog for updating product name
  Future<String?> _showProductNameDialog(BuildContext context, String currentName) {
    TextEditingController controller = TextEditingController(text: currentName);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Product Name"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Product Name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
