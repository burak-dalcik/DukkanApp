import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class UpdateProductPage extends StatefulWidget {
  final Product product;

  const UpdateProductPage({super.key, required this.product});

  @override
  _UpdateProductPageState createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final _formKey = GlobalKey<FormState>();
  late Product _updatedProduct;
  final ProductApiService _productApiService = ProductApiService();

  @override
  void initState() {
    super.initState();
    _updatedProduct = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Güncelleme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _updatedProduct.name,
                decoration: const InputDecoration(labelText: 'Ürün Adı'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir ürün adı girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _updatedProduct = _updatedProduct.copyWith(name: value);
                },
              ),
              TextFormField(
                initialValue: _updatedProduct.code,
                decoration: const InputDecoration(labelText: 'Ürün Kodu'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir ürün kodu girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _updatedProduct = _updatedProduct.copyWith(code: value);
                },
              ),
              TextFormField(
                initialValue: _updatedProduct.description,
                decoration: const InputDecoration(labelText: 'Açıklama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir açıklama girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _updatedProduct = _updatedProduct.copyWith(description: value);
                },
              ),
              TextFormField(
                initialValue: _updatedProduct.price.toString(),
                decoration: const InputDecoration(labelText: 'Fiyat'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir fiyat girin';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Lütfen geçerli bir fiyat girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _updatedProduct = _updatedProduct.copyWith(price: double.parse(value!));
                },
              ),
              TextFormField(
                initialValue: _updatedProduct.brand,
                decoration: const InputDecoration(labelText: 'Marka'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir marka girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _updatedProduct = _updatedProduct.copyWith(brand: value);
                },
              ),
              TextFormField(
                initialValue: _updatedProduct.stockCount.toString(),
                decoration: const InputDecoration(labelText: 'Stok Adedi'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir stok adedi girin';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Lütfen geçerli bir stok adedi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _updatedProduct = _updatedProduct.copyWith(stockCount: int.parse(value!));
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProduct,
                child: const Text('Güncelle'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _productApiService.updateProduct(_updatedProduct).then((success) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ürün başarıyla güncellendi')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ürün güncellenirken bir hata oluştu')),
          );
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ürün güncellenirken bir hata oluştu: $error')),
        );
      });
    }
  }
}
