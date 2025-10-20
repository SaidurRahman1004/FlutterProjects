import 'package:flutter/material.dart';
import '../product_api_controller.dart';
import '../model/product_model.dart';

class AddProductDialog extends StatefulWidget {
  final ProductData? product;

  const AddProductDialog({Key? key, this.product}) : super(key: key);

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _codeController;
  late final TextEditingController _imgController;
  late final TextEditingController _qtyController;
  late final TextEditingController _unitPriceController;

  bool get _isEditMode => widget.product != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.product?.productName ?? '',
    );
    _codeController = TextEditingController(
      text: widget.product?.productCode?.toString() ?? '',
    );
    _imgController = TextEditingController(text: widget.product?.img ?? '');
    _qtyController = TextEditingController(
      text: widget.product?.qty?.toString() ?? '',
    );
    _unitPriceController = TextEditingController(
      text: widget.product?.unitPrice?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _imgController.dispose();
    _qtyController.dispose();
    _unitPriceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final qty = int.tryParse(_qtyController.text) ?? 0;
      final unitPrice = int.tryParse(_unitPriceController.text) ?? 0;
      final product = ProductData(
        id: widget.product?.id,
        productName: _nameController.text,
        productCode: int.tryParse(_codeController.text) ?? 0,
        img: _imgController.text,
        qty: qty,
        unitPrice: unitPrice,
        totalPrice: qty * unitPrice,
      );
      Navigator.of(context).pop(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEditMode ? 'Edit Product' : 'Add Product'),
      content: SingleChildScrollView(
        child: Form(key: _formKey, child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            TextFormField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'Product Code'),
              keyboardType: TextInputType.number,
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            TextFormField(
              controller: _imgController,
              decoration: InputDecoration(labelText: 'Image URL'),
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            TextFormField(
              controller: _qtyController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            TextFormField(
              controller: _unitPriceController,
              decoration: InputDecoration(labelText: 'Unit Price'),
              keyboardType: TextInputType.number,
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
          ],
        ),
        ),
      ),
      actions: [
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancel'),),
        ElevatedButton(onPressed: (){_submitForm();
          }, child: Text(_isEditMode?'Update' : 'add'),),

      ],
    );
  }
}
