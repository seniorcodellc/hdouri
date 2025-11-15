import 'package:cherubini/core/widgets/custom_background.dart';
import 'package:cherubini/exports.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../models/payment_model.dart';
import 'custom_switch.dart';


class AddCreditCard extends StatefulWidget {
  final Function(PaymentDetails paymentDetails) onPaymentDetailsEntered;
  const AddCreditCard({required this.onPaymentDetailsEntered, super.key});

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
  bool? isConfirm;
  bool isKeyboardVisible = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String cardHolderName = '';
  String cardNumber = '';
  String expiryDate = '';
  String cvvCode = '';

  @override
  void initState() {
    KeyboardVisibilityController keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen(
          (event) {
        isKeyboardVisible = event;
        setState(() {});
      },
    );
    super.initState();
  }

  CreditCardModel? cardModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height*0.9,
      child: Material(
        child: Padding(
          padding: getPadding(horizontal: 16.h,top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.enterCardDetails.trans,
                style: getMediumTextStyle(fontSize: 16.sp),
              ),
              31.vs,
              CreditCardForm(
                formKey: formKey, // Required
                autovalidateMode: AutovalidateMode.disabled,
                cardNumber: cardNumber, // Required
                expiryDate: expiryDate, // Required
                cardHolderName: cardHolderName, // Required
                cvvCode: cvvCode, // Required
                onCreditCardModelChange: (CreditCardModel data) {
                  cardModel = data;
                }, // Required
                cardNumberValidator: (String? cardNumber) {
                  if (cardNumber.isNullOrEmpty || cardNumber!.length < 16) {
                    return AppStrings.enterCardNumberError.trans;
                  }
                  return null;
                },
                expiryDateValidator: (String? expiryDate) {
                  if (expiryDate.isNullOrEmpty || expiryDate!.length < 5) {
                    return AppStrings.enterCardExpireDateError.trans;
                  }
                  return null;
                },
                cvvValidator: (String? cvv) {
                  if (cvv.isNullOrEmpty || cvv!.length < 3) {
                    return AppStrings.enterCardCVVError.trans;
                  }
                  return null;
                },
                cardHolderValidator: (String? cardHolderName) {
                  if (cardHolderName.isNullOrEmpty || cardHolderName!.length < 3) {
                    return AppStrings.enterCardNameError.trans;
                  }
                  return null;
                },
                onFormComplete: () {
                  // callback to execute at the end of filling card data
                },
                disableCardNumberAutoFillHints: false,

                inputConfiguration: InputConfiguration(
                  cardNumberDecoration: inputDecoration(
                    labelText: AppStrings.cardNumber.trans,
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: inputDecoration(
                    labelText: AppStrings.expiryDate.trans,
                  ),
                  cvvCodeDecoration: inputDecoration(labelText: AppStrings.cvvHint.trans, hintText: 'XXXX'),
                  cardHolderDecoration: inputDecoration(
                    labelText: AppStrings.cardHolderName.trans,
                  ),
                  cardNumberTextStyle: TextStyle(fontSize: 16.sp, color: AppColors.black.withValues(alpha: 0.4), ),
                  cardHolderTextStyle: TextStyle(fontSize: 16.sp, color: AppColors.black.withValues(alpha: 0.4), ),
                  expiryDateTextStyle:TextStyle(fontSize: 16.sp, color: AppColors.black.withValues(alpha: 0.4), ),
                  cvvCodeTextStyle: TextStyle(fontSize: 16.sp, color: AppColors.black.withValues(alpha: 0.4), ),
                ),
              ),
              _buildSaveCardDataSection(),
              27.vs,
              Divider(thickness: 1.w, color: AppColors.black.withValues(alpha:0.4),),
              _buildPaymentDetails,40.vs,
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        text: AppStrings.cancel.trans,
                        textColor: AppColors.black,
                        borderRadius: 8.r,
                        borderColor: AppColors.primaryColor,
                        backgroundColor: AppColors.scaffold,
                        onPressed: () {
                     /*     if (formKey.currentState!.validate().isTrue) {
                            PaymentDetails paymentDetails = PaymentDetails(paymentNumber: cardModel!.cardNumber);
                            widget.onPaymentDetailsEntered.call(paymentDetails);
                          }*/
                        pop();
                        }),
                  ),    43.hs,      Expanded(
                    child: CustomButton(
                        text: AppStrings.pay.trans,
                        borderRadius: 8.r,

                        onPressed: () {
                     /*     if (formKey.currentState!.validate().isTrue) {
                            PaymentDetails paymentDetails = PaymentDetails(paymentNumber: cardModel!.cardNumber);
                            widget.onPaymentDetailsEntered.call(paymentDetails);
                          }*/
                          Routes.completed.moveTo();
                        }),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  get _buildPaymentDetails => Column(
    children: [
    //  TitleWidget(title: AppStrings.paymentSummary.trans),
      19.vs,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.total.trans, style: getRegularTextStyle(fontSize: 14.sp)),
          Text('210.00ج.م', style: getRegularTextStyle(fontSize: 14.sp)),
        ],
      ),
      16.vs,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.totalAmount.trans, style: getRegularTextStyle(fontSize: 14.sp)),
          Text('210.00ج.م', style: getRegularTextStyle(fontSize: 14.sp)),
        ],
      ),
    ],
  );
  inputDecoration({required String labelText, String? hintText}) => InputDecoration(
    border: OutlineInputBorder(),
    labelText: labelText,
    hintText: hintText,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      borderSide: BorderSide(color: AppColors.black.withValues(alpha: 0.4),width: 1.w),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      borderSide: const BorderSide(color: AppColors.lightConcrete),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      borderSide: BorderSide(color: AppColors.black.withValues(alpha: 0.4),width: 1.w),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      borderSide: const BorderSide(color: Colors.red),
    ),
  );

  _buildSaveCardDataSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        9.vs,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.saveCardForFastPayment.trans,style: getRegularTextStyle(fontSize: 10.sp),),
          CustomSwitch(

          )
        ],
      )
      ],
    );
  }
}
