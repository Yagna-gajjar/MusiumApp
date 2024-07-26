import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddUserDetails extends StatefulWidget {
  final String email;
  final String username;
  final String password;
  final String lan;

  const AddUserDetails({
    Key? key,
    required this.email,
    required this.username,
    required this.password,
    required this.lan,
  }) : super(key: key);

  @override
  State<AddUserDetails> createState() => _AddUserDetailsState();
}

class _AddUserDetailsState extends State<AddUserDetails> {
  final _formKey = GlobalKey<FormState>();
  final _countryController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;
  String? _gender;
  String? _country;
  bool isLoading = false;

  Future<http.Response> createUser(Map<String, dynamic> userDetails) async {
    const url = 'http://localhost:5000/AddUsers';
    return await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userDetails),
    );
  }

  @override
  void dispose() {
    _countryController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${_selectedDate!.toLocal()}".split(' ')[0];
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.secondaryColor,
        backgroundColor: AppColors.secondaryColor,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.fourthColor,
              ),
              height: 200,
              child: Center(
                child: Image.asset(
                  'Alphabets/${widget.username[0]}.png',
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDateField(context),
                  const SizedBox(height: 30),
                  _buildGenderDropdown(),
                  const SizedBox(height: 30),
                  _buildCountryField(),
                  const SizedBox(height: 16),
                  _buildSubmitButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateController,
          style: GoogleFonts.varelaRound(color: AppColors.fourthColor),
          decoration: InputDecoration(
            labelText: 'Date',
            labelStyle: GoogleFonts.varelaRound(color: Colors.white38),
            hintText: 'Select a date',
            hintStyle: GoogleFonts.varelaRound(color: AppColors.fourthColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
          validator: (value) {
            if (_selectedDate == null) {
              return 'Please select a date';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      style: GoogleFonts.varelaRound(color: AppColors.fourthColor),
      decoration: InputDecoration(
        labelText: 'Gender',
        labelStyle: GoogleFonts.varelaRound(color: Colors.white38),
        hintStyle: GoogleFonts.varelaRound(color: AppColors.fourthColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      dropdownColor: AppColors.primaryColor,
      value: _gender,
      items: ['Male', 'Female', 'Other'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _gender = newValue;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a gender';
        }
        return null;
      },
    );
  }

  Widget _buildCountryField() {
    return TextFormField(
      style: GoogleFonts.varelaRound(color: AppColors.fourthColor),
      decoration: InputDecoration(
        labelText: 'Country',
        labelStyle: GoogleFonts.varelaRound(color: Colors.white38),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your country';
        }
        return null;
      },
      onChanged: (value) {
        _country = value;
      },
    );
  }

  Widget _buildSubmitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });

                  Map<String, dynamic> userDetails = {
                    'Username': widget.username,
                    'EmailAddress': widget.email,
                    'Password': widget.password,
                    'DateofBirth': _selectedDate?.toIso8601String(),
                    'Gender': _gender,
                    'Country': _country,
                    'AppUseLanguage': widget.lan,
                    'ProfilePicture': '${widget.username[0]}.png',
                  };

                  try {

                    await createUser(userDetails);
                    // Handle successful creation
                  } catch (e) {
                    // Handle error
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.tertiaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Next",
                  style: GoogleFonts.varelaRound(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
