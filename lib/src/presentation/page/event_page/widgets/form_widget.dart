import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class FormEvent extends StatefulWidget {
  const FormEvent({
    super.key,
  });

  @override
  State<FormEvent> createState() => _FormEventState();
}

class _FormEventState extends State<FormEvent> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PinTheme defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color.fromRGBO(30, 60, 87, 1),
          ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(222, 231, 240, .57),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            "Comfirm your ID",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Pinput(
              length: 13,
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              onCompleted: (pin) {},
              focusedPinTheme: defaultPinTheme.copyWith(
                height: 70,
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.blueAccent),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            "Successfully",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 30),
          Text(
            "Lorem ipsum habitasse",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Faucibus sed .......",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}
