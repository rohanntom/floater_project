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
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: this.state.back,
        ),
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
                  errorText:
                      this.state.errors.getError("product name required"),
                ),
              ),
              TextFormField(
                initialValue: this.state.quantity as String,
                onChanged: (v) => this.state.quantity = v as double,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantity",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this.state.errors.getError("quantity required"),
                ),
              ),
              TextFormField(
                initialValue: this.state.mrp as String,
                onChanged: (v) => this.state.mrp = v as double,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "MRP",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this.state.errors.getError("mrp required"),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: (this.state.hasErrors) ? null : this.state.submit,
                child: const Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
