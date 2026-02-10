import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/admin_product_model.dart';
import '../../providers/product_provider.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({super.key});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  String? _productId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _productId = ModalRoute.of(context)!.settings.arguments as String?;
    if (_productId != null) {
      final product = Provider.of<ProductProvider>(context, listen: false)
          .products
          .firstWhere((p) => p.id == _productId);
      _titleController.text = product.title;
      _priceController.text = product.price.toString();
      _imageController.text = product.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProduct,
              child: const Text('Update Product'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProduct() {
    final title = _titleController.text.trim();
    final price = double.tryParse(_priceController.text.trim()) ?? 0.0;
    final imageUrl = _imageController.text.trim();

    if (_productId != null && title.isNotEmpty && price > 0) {
      final product = AdminProduct(
        id: _productId!,
        title: title,
        price: price,
        imageUrl: imageUrl,
      );
      Provider.of<ProductProvider>(context, listen: false)
          .updateProduct(product);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    super.dispose();
  }
}
