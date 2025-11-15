import 'package:flutter/material.dart';
import 'package:hdouri/exports.dart';
import '../../data/models/warranty_product_model.dart';
import '../../data/statics/statics.dart';
import 'custom_product_details_warranty.dart';

class ProductListSection extends StatefulWidget {
  const ProductListSection({super.key, required this.isMerchant});
 final bool isMerchant;
  @override
  State<ProductListSection> createState() => _ProductListSectionState();
}

class _ProductListSectionState extends State<ProductListSection> {
  late List<WarrantyProductModel> _products;


  @override
  void initState() {
    super.initState();
    _products = List.from(WarrantyStatics.warrantyList);
  }

  void _addProduct() {
    setState(() {
      _products.add(WarrantyProductModel());
    });
  }

  void _removeProduct(int index) {
    if (_products.length <= 1) return;
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final showDelete = index > 0;
        return Column(
          children: [
            if (index == 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.products,
                    style: getBoldTextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  CustomButton(
                    text: AppStrings.addProduct,
                    textColor: AppColors.primaryColor,
                    onPressed: _addProduct,
                    borderColor: AppColors.borderColor3,
                    backgroundColor: AppColors.bgColor,
                    svgIconPath: AppAssets.addProduct,
                    height: 38.h,
                  ),
                ],
              ),
            12.vs,
            CustomProductDetailsWarranty(
              index: index + 1,
              showDelete: showDelete,
              onDelete: showDelete ? () => _removeProduct(index) : null,
              isMerchant: widget.isMerchant,
            ),
            16.vs,
          ],
        );
      },
    );
  }
}