import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:floater/floater.dart';
import 'receive_input_page_state.dart';

class ReceiveInputPage extends StatefulWidgetBase<ReceiveInputPageState> {
  ReceiveInputPage() : super(() => ReceiveInputPageState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New LineItem"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this
                      .state
                      .errorsForProductName
                      .getError("product name required"),
                ),
              ),
              TextFormField(
                initialValue: this.state.quantity as String,
                onChanged: (v) => this.state.quantity = v as Double,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantity",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this
                      .state
                      .errorsForQuantity
                      .getError("quantity required"),
                ),
              ),
              TextFormField(
                initialValue: this.state.mrp as String,
                onChanged: (v) => this.state.mrp = v as Double,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "MRP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  errorText: this.state.errorsForMRP.getError("mrp required"),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: (this.state.hasErrorsForProductName ||
                        this.state.hasErrorsForQuantity ||
                        this.state.hasErrorsForMRP)
                    ? null
                    : this.state.submit,
                child: Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
