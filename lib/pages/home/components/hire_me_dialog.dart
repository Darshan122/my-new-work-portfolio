import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';

class HireMeDialog extends StatefulWidget {
  @override
  _HireMeDialogState createState() => _HireMeDialogState();
}

class _HireMeDialogState extends State<HireMeDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _timelineController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedProjectType = 'Mobile App';
  bool _isSubmitting = false;

  final List<String> _projectTypes = [
    'Mobile App',
    'Web App',
    'Full Stack',
    'UI/UX Design',
    'Consultation',
    'Other'
  ];

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulate API call to save data to Excel/Google Sheets
      await Future.delayed(Duration(seconds: 2));

      // Here you would typically send data to your backend
      // which would then save to Google Sheets/Excel
      final formData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'company': _companyController.text,
        'projectType': _selectedProjectType,
        'projectDetails': _projectController.text,
        'budget': _budgetController.text,
        'timeline': _timelineController.text,
        'description': _descriptionController.text,
        'timestamp': DateTime.now().toString(),
      };

      print('Form Data to be saved: $formData');

      // Reset form
      _formKey.currentState!.reset();

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thank you! Your details have been submitted successfully.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
          ),
        );

        Navigator.of(context).pop();
      }

      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _projectController.dispose();
    _budgetController.dispose();
    _timelineController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width > 600 ? 600 : double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hire Me",
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Let's work together! Fill out the form below and I'll get back to you soon.",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name and Email
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              controller: _nameController,
                              label: "Full Name *",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildTextFormField(
                              controller: _emailController,
                              label: "Email Address *",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Phone and Company
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              controller: _phoneController,
                              label: "Phone Number",
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildTextFormField(
                              controller: _companyController,
                              label: "Company/Organization",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Project Type
                      DropdownButtonFormField<String>(
                        value: _selectedProjectType,
                        decoration: InputDecoration(
                          labelText: "Project Type *",
                          labelStyle: TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        dropdownColor: Color(0xFF2D2D2D),
                        style: TextStyle(color: Colors.white),
                        items: _projectTypes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedProjectType = newValue!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select project type';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Project Details
                      _buildTextFormField(
                        controller: _projectController,
                        label: "Project Details *",
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please describe your project';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Budget and Timeline
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              controller: _budgetController,
                              label: "Estimated Budget",
                              hintText: "e.g., \$1000-\$5000",
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildTextFormField(
                              controller: _timelineController,
                              label: "Expected Timeline",
                              hintText: "e.g., 2-3 months",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Additional Details
                      _buildTextFormField(
                        controller: _descriptionController,
                        label: "Additional Details/Requirements",
                        maxLines: 4,
                        hintText: "Any specific technologies, features, or requirements...",
                      ),
                      SizedBox(height: 30),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: _isSubmitting
                              ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                              : Text(
                            "Submit Proposal",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "* Required fields",
                        style: TextStyle(
                          color: kCaptionColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: validator,
    );
  }
}