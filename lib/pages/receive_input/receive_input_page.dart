import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'receive_input_page_state.dart';

class ReceiveInputPage extends StatefulWidgetBase<ReceiveInputPageState> {
  ReceiveInputPage() : super(ReceiveInputPageState.new);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New LineItem"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: this.state.back,
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: this.state.productName,
                onChanged: (v) => this.state.productName = v,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this.state.errors.getError("productName"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (v) => this.state.quantity = double.parse(v),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantity",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this.state.errors.getError("quantity"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (v) => this.state.mrp = double.parse(v),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "MRP",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this.state.errors.getError("mrp"),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (this.state.hasErrors) ? null : this.state.submit,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
                child: const Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
