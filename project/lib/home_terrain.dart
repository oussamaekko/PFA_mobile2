import 'package:flutter/material.dart';
import 'package:project/terrain.dart';

class HomeTerrain extends StatefulWidget {
  
  const HomeTerrain({Key? key}) : super(key: key);

  @override
  State<HomeTerrain> createState() => _HomePageState();
}

class _HomePageState extends State<HomeTerrain> {
  TextEditingController nomController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController attitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController etatController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tarifController = TextEditingController();
  List<Terrain> contacts = List.empty(growable: true);

  int selectedIndex = -1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Terrain list'),
      ),
      
      body: SingleChildScrollView(
        child:GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            FocusScope.of(context).unfocus();
          },

        child: Container(
          width: double.infinity,
          height: 1000,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            TextField(
              controller: nomController,
              decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

             TextField(
              controller: adresseController,
              decoration: const InputDecoration(
                  hintText: 'Adresse',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),


            TextField(
              controller: attitudeController,
              decoration: const InputDecoration(
                  hintText: 'Attitude',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),


            TextField(
              controller: longitudeController,
              decoration: const InputDecoration(
                  hintText: 'Longitude',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                  hintText: 'Type',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),


                TextField(
              controller: etatController,
              decoration: const InputDecoration(
                  hintText: 'Etat',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

              TextField(
              controller: tarifController,
              decoration: const InputDecoration(
                  hintText: 'Tarif',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String nom = nomController.text.trim();
                      String adresse = adresseController.text.trim();
                      String attitude = attitudeController.text.trim();
                      String longitude = longitudeController.text.trim();
                      String type = typeController.text.trim();
                      bool etat = etatController.text.trim()=='true';
                      String description = descriptionController.text.trim();
                      String tarif = tarifController.text.trim();
                      if (nom.isNotEmpty && adresse.isNotEmpty && attitude.isNotEmpty
                      && longitude.isNotEmpty && type.isNotEmpty && description.isNotEmpty
                      && tarif.isNotEmpty) {
                        setState(() {
                          nomController.text = '';
                          adresseController.text = '';
                          attitudeController.text = '';
                          longitudeController.text = '';
                          typeController.text = '';
                          etatController.text='';
                          descriptionController.text='';
                          tarifController.text='';
                          contacts.add(Terrain( terrainId:'',nom: nom, adresse:adresse, attitude:num.parse(attitude),
                          longitude:num.parse(longitude), type:num.parse(type),etat:etat,description: description ,tarif:num.parse(tarif)));
                        });
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String nom = nomController.text.trim();
                      String adresse = adresseController.text.trim();
                      String attitude =attitudeController.text.trim();
                      String longitude =longitudeController.text.trim();
                      String type =typeController.text.trim();
                      bool etat =etatController.text.trim()=='true';
                      String description = descriptionController.text.trim();
                      String tarif =typeController.text.trim();
                      if (nom.isNotEmpty && adresse.isNotEmpty && attitude.isNotEmpty && selectedIndex != -1
                      && longitude.isNotEmpty && type.isNotEmpty && description.isNotEmpty
                      && tarif.isNotEmpty) {
                        setState(() {
                          nomController.text = '';
                          adresseController.text = '';
                          attitudeController.text = '';
                          longitudeController.text = '';
                          typeController.text = '';
                          etatController.text='';
                          descriptionController.text='';
                          tarifController.text='';
                          contacts[selectedIndex].nom = nom;
                          contacts[selectedIndex].adresse = adresse;
                          contacts[selectedIndex].attitude = num.parse(attitude);
                          contacts[selectedIndex].longitude = num.parse(longitude);
                          contacts[selectedIndex].type = num.parse(type);
                          contacts[selectedIndex].etat = etat;
                          contacts[selectedIndex].description = description;
                          contacts[selectedIndex].tarif = num.parse(tarif);
                          selectedIndex = -1;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    'No Terrain yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
      ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'nom:${contacts[index].nom}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('adresse:${contacts[index].adresse}',),
            Text('attitude: ${contacts[index].attitude}',),
            Text('longitude: ${contacts[index].longitude}',),
            Text('type: ${contacts[index].type}',),
            Text('etat: ${contacts[index].etat ? 'true' :'false'}',),
            Text('description: ${contacts[index].description }',),
            Text('tarif: ${contacts[index].tarif }',),
             
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    nomController.text = contacts[index].nom;
                    adresseController.text = contacts[index].adresse;
                    attitudeController.text = contacts[index].attitude.toString();
                    longitudeController.text = contacts[index].longitude.toString(); 
                    typeController.text = contacts[index].type.toString();
                    etatController.text = contacts[index].etat.toString();
                    descriptionController.text = contacts[index].description;
                    tarifController.text = contacts[index].toString();
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
  
}
