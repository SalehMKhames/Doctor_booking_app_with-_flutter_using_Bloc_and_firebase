import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            child: const Column
            (
              children: <Widget>
              [
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage('assets/empty_profile.jpeg'),
                  backgroundColor: Colors.black87,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Amanda Tan',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '23 Years Old | Female',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.brown,
                      ),
                      title: Text("abd@gmail.com"),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.brown,
                      ),
                      title: Text("0969********"),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(
                        Icons.medical_information,
                        color: Colors.brown,
                      ),
                      title: Text("pain in the joints"),
                      trailing: Icon(Icons.edit),
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => Edit()));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.brown,
                      ),
                      title: const Text("Sign Out"),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
