import 'package:flutter/material.dart';
import 'model/product_model.dart';
import 'product_api_controller.dart';
import 'widget/add_product_dialog.dart';

class curdUi extends StatefulWidget {
  const curdUi({super.key});

  @override
  State<curdUi> createState() => _curdUiState();
}

class _curdUiState extends State<curdUi> {
  final controller = ProductApiController();
  bool _loading = true;

  Future<void> fetchData() async {
    try {
      await controller.fetchProduct();
      setState(() {
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print("Failed to load products");
    }
  }

  //
  void _showDeleteConfirmationDialog(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this product?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  _loading = true;
                });
                final success = await controller.deletProduct(id);
                if (success) {
                  await fetchData();
                } else {
                  setState(() {
                    _loading = false;
                  });
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Failed to delete product")),
                    );
                  }
                }
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Future<void> showAddUpdateDialog({ProductData? product}) async {
    final result = await showDialog(
      context: context,
      builder: (_) => AddProductDialog(product: product),
    );
    if (result != null && result is ProductData) {
      setState(() {
        _loading = true;
      });
      bool success;
      if(product == null ){
        success = await controller.addProduct(result);
      }else{
        success = await controller.UpdateProduct(result);;
      }

      if (success) {
        await fetchData();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            "  Product ${product == null ? 'added' : 'updated'} successfully!",
          )),
        );


      }else{
        setState(() {
          _loading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            " Failed to ${product == null ? 'add' : 'update'} product!",
          )),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ostad Api Assignment Store"),
        centerTitle: true,
        leading: Image.network(
          "https://cdn.ostad.app/public/upload/2024-03-20T04-26-32.799Z-ostad_logo_light@512x (2).png",
        ),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : controller.productStore.isEmpty
          ? Center(child: Text("No Data Found"))
          : GridView.builder(
              itemCount: controller.productStore.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (_, index) {
                final productAccess = controller.productStore[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Image with Error Handling
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                              image: productAccess.img != null
                                  ? DecorationImage(
                                      image: NetworkImage(productAccess.img!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: productAccess.img == null
                                ? Center(child: Icon(Icons.image_not_supported))
                                : null,
                          ),
                        ),
                        SizedBox(height: 10),
                        //name
                        Text(
                          productAccess.productName ?? "No Name",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        //price
                        Row(
                          children: [
                            Text(
                              "৳ ${productAccess.unitPrice ?? '0'}",
                              style: const TextStyle(
                                color: Colors.teal,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "|Q:${productAccess.qty ?? '--'}",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        //Edit and Dellet Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Edit
                            IconButton(
                              onPressed: () {
                                showAddUpdateDialog(product: productAccess);
                              },
                              icon: Icon(Icons.edit, color: Colors.blueAccent),
                              tooltip: "Edit",
                            ),
                            //Dellet
                            IconButton(
                              onPressed: () {
                                _showDeleteConfirmationDialog(
                                  productAccess.id!,
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                              tooltip: "Dellet",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUpdateDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
