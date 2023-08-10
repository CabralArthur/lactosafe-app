class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController controller; // Add this line

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isObscure = false,
    this.validator,
    required this.controller, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller, // Add this line
        validator: validator,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
