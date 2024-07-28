import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicturePicker extends StatefulWidget
{
  ProfilePicturePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicturePicker> createState() => _ProfilePicturePickerState();
}

class _ProfilePicturePickerState extends State<ProfilePicturePicker>
{
  late XFile? image = null;

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector
      (
      onTap: () => _pickImage(context),
      child: Container
        (
        width: 100, height: 100,
        decoration: BoxDecoration
        (
          border: Border.all(color: Colors.grey[300]!, width: 2.0,),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: image == null ?
        Icon(Icons.person, size: 50, color: Colors.grey[500],)
            : null,
      ),
    );
  }

  void _pickImage(BuildContext context)
  {
    showDialog
      (
        context: context,
        builder: (_)
        {
          return AlertDialog
            (
            title: Text("Choose your profile picture:",
              style: GoogleFonts.notoSans(fontSize: 16),),
            content: Container
              (
              margin: const EdgeInsets.all(14),
              height: 150,
              child: Column(
                children:
                [
                  SizedBox(
                    width: double.infinity,
                    child: ListTile
                      (
                      leading: const Icon(Icons.camera_alt_rounded),
                      title: Text(
                        "Camera", style: GoogleFonts.notoSans(fontSize: 14),),
                      onTap: () {
                        getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: ListTile
                      (
                      leading: const Icon(Icons.photo_library_outlined),
                      title: Text(
                        "Gallery", style: GoogleFonts.notoSans(fontSize: 14),),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Future<void> getImage(ImageSource src) async
  {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: src);

    if (pickedImage != null) {
      setState(() {
      image = pickedImage as XFile?;
      });
    }
    else{
      image = null;
    }
  }
}
