import 'package:flutter/material.dart';

class NewFriendsAdd extends StatefulWidget {
  const NewFriendsAdd({super.key});

  @override
  State<NewFriendsAdd> createState() => _NewFriendsAddState();
}

class _NewFriendsAddState extends State<NewFriendsAdd> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _ageController = TextEditingController();
  late TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _descController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangi Do’st Qo’shish"),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "name",
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white10),
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Iltimos Ismingizni kiriting";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                controller: _ageController,
                decoration: InputDecoration(
                    counterText: '',
                    hintText: "age",
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white10),
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Iltimos Yoshingizni kiriting";
                  } else if (value.length >= 3) {
                    return "Iltimos Yoshingizni to'g'ri kiriting";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                    hintText: "description",
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white10),
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Iltimos Bo'sh qoldirmang";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_key.currentState!.validate()) {
              
            }
          },
          label: const Text('Saqlash')),
    );
  }
}
